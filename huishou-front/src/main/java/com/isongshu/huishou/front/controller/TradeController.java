package com.isongshu.huishou.front.controller;


import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.Order;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.isongshu.huishou.front.bean.Item;
import com.isongshu.huishou.front.bean.ItemCombine;
import com.isongshu.huishou.front.util.HelpKit;
import com.isongshu.huishou.front.util.UrlKti;
import com.isongshu.huishou.skeleton.model.Code;
import com.isongshu.huishou.skeleton.model.OrderInfo;
import com.isongshu.huishou.skeleton.model.PrdPackageItem;
import com.isongshu.huishou.skeleton.model.PrdProduct;
import com.isongshu.huishou.skeleton.model.SysParam;
import com.isongshu.huishou.skeleton.service.DbBaseService;
import com.isongshu.huishou.skeleton.service.OrderInfoService;
import com.isongshu.huishou.skeleton.service.PrdClazzBrandService;
import com.isongshu.huishou.skeleton.service.PrdPackageService;
import com.isongshu.huishou.skeleton.service.PrdProductService;
import com.isongshu.huishou.skeleton.service.SmsService;
import com.isongshu.huishou.skeleton.service.SysParamService;
import com.isongshu.huishou.skeleton.util.DateUtil;
import com.isongshu.huishou.skeleton.util.JsonMessage;
import com.isongshu.huishou.skeleton.util.OrderInfoStatus;
import com.isongshu.huishou.skeleton.util.SMS;
import com.jfinal.aop.Before;
import com.jfinal.plugin.spring.Inject;
import com.jfinal.plugin.spring.IocInterceptor;


/**
 * 订单交易流程
 *
 */
@Before({ IocInterceptor.class })
public class TradeController extends _Controller {

	 private static Logger logger = LoggerFactory.getLogger(TradeController.class);
	@Inject.BY_NAME
	private PrdProductService prdProductService;
	@Inject.BY_NAME
	private PrdClazzBrandService prdClazzBrandService;
	@Inject.BY_NAME
	private PrdPackageService prdPackageService;
	@Inject.BY_NAME
	private DbBaseService dbBaseService;
	@Inject.BY_NAME
	private SysParamService sysParamService;
	@Inject.BY_NAME
	private SmsService smsService;
	@Inject.BY_NAME
	private OrderInfoService orderInfoService;
	
	
	//第一步：加载产品配置项，跳转到配置项页面让用户选择
	public void product() {
		
		try {
			//获取产品ID
			String id =  getPara("id");
			//查询该产品
			PrdProduct prdProduct = prdProductService.findById(id);
			
			if(prdProduct == null){
				logger.error("交易第一步,产品ID{} 不存在",id);
				renderError(500);return;
			}
			
			//查询该产品的配置项
			List<PrdPackageItem> prdPackageItemList = prdPackageService.queryPackageItemByPackageId_(prdProduct.getPrdPackageId());
			if(prdProduct == null){
				logger.error("交易第一步, 产品ID{} 产品{}  配置项不存在",id,prdProduct.getName());
				renderError(500);return;
			}
			
			
			//初始化订单信息
			OrderInfo orderInfo = new OrderInfo();
			setSessionAttr("orderInfo",orderInfo);
			
			//取出配置参数
			List<SysParam> recycleTradeAddressCity = sysParamService.getRecycleTradeAddressCity();
			List<SysParam> payBankCode = sysParamService.getPayBankCode();
			SysParam expressAddress = sysParamService.getExpressAddress().get(0);
			setSessionAttr("recycleTradeAddressCity",recycleTradeAddressCity);//城市代码
			setSessionAttr("payBankCode",payBankCode);//银行代码
			setSessionAttr("expressAddress",expressAddress);//邮寄到公司的地址
			
			
			
			setSessionAttr("object",prdProduct);
			setAttr("packageItem",prdPackageItemList);
			
			
			String n = prdProduct.getName();
			setAttr("title","二手"+n+"回收|高价回收二手"+n+"|二手"+n+"报价-安特回收官网");
			setAttr("keywords", "安特回收专业回收二手"+n+"-您身边的二手"+n+"回收中心，高效上门交易-安特回收官网！");
			setAttr("description", ""+n+"回收,高价回收"+n+","+n+"报价");
			
			
			to(UrlKti.PRODUCT1_JSP);
		}
		catch (Exception e) {
			logger.error("交易第一步出错",e);
			renderError(500);
		}
		
	}
	
	
	//第二步：保存用户选择的配置项，跳转到报价页面
	public void assess(){
		  
		try {
			
			OrderInfo orderInfo = getSessionAttr("orderInfo");
			//获取前端用户选择的配置项
			PrdProduct prdProduct = getSessionAttr("object");
			prdProduct = prdProductService.findById(String.valueOf(prdProduct.getId()));
			orderInfo.setPrdProductId(prdProduct.getId());
			orderInfo.setPrdProductName(prdProduct.getName());
			
			//用户选择的配置项信息
			String[] itemArrays =  getPara("itemArray").split(",");
			
			//获取配置项的值
			StringBuffer sb = new StringBuffer();
			List<PrdPackageItem> prdPackageItemList = prdPackageService.queryPackageItemByPackageId(prdProduct.getPrdPackageId());
			Map<String,BigDecimal> itemValueMap = new HashMap<String,BigDecimal>();
			for(String str : itemArrays){
				for(PrdPackageItem ppi : prdPackageItemList){
					BigDecimal value = ppi.getBigDecimal("i3Value");
					if(Integer.valueOf(str) == ppi.getInt("i3Id")){
						itemValueMap.put(str, value);
						sb.append("[选项:"+ppi.getStr("i3Name")+" ,id:"+ppi.getInt("i3Id")+", 值:"+ppi.getBigDecimal("i3Value").toString()+"] ");
					}
				}
			}
			logger.info("用户勾选的选项和系数值为 {}",sb.toString());
			
			
			//查询该产品的组合配置项
			boolean isBingo = false;
			ItemCombine bingoItemCombine = null; 
			logger.info("用户勾选的产品{} 的组合配置项为{}",prdProduct.getName(),prdProduct.getBasePriceCombine());
			
			//产品本身的价格组合配置项,如
			//[{"price":"3002","items":[{"i1Id":"1","i2Id":"8","i3Id":"9"},{"i1Id":"1","i2Id":"4","i3Id":"6"}]},
			// {"price":"4000","items":[{"i1Id":"1","i2Id":"8","i3Id":"9"},{"i1Id":"1","i2Id":"4","i3Id":"7"}]},
			List<ItemCombine> productItemCombineList = (List<ItemCombine>) JSON.parseObject(prdProduct.getBasePriceCombine(), new TypeReference<ArrayList<ItemCombine>>(){});
			
			
			for(ItemCombine productItemCombine : productItemCombineList){
			
				//集合出产品的组合配置项
				List<String> productItemIdList = new ArrayList<String>();
				for(Item productItem : productItemCombine.getItems()){
					productItemIdList.add(productItem.getI3Id());
				}
				
				//集合出用户选择的组合配置项
				List<String> chooseItemIdList = new ArrayList<String>();
				for(Map.Entry<String, BigDecimal> entry: itemValueMap.entrySet()){
					chooseItemIdList.add(entry.getKey());
				}
				
				//做匹配，分析用户选择的组合配置项中是否存在产品本身的组合配置项
				if(chooseItemIdList.containsAll(productItemIdList)){
					isBingo = true;
					bingoItemCombine = productItemCombine;
					break;
				}
				
			}
			
			
			BigDecimal endPrice = new BigDecimal(0);
			//如果符合组合价格,就用组合价格做基数计算
			if(isBingo){
				
				//基础价格
				BigDecimal basePrice = null;
				try {
					basePrice = new BigDecimal(bingoItemCombine.getPrice());
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				//剔除能控制基础价格的组合条件
				for(Item productItem : bingoItemCombine.getItems()){
					itemValueMap.remove(productItem.getI3Id());
				}
				logger.info("用户勾选的选项符合产品的组合价格{}",bingoItemCombine.getPrice());
				endPrice = calTheEndPrice(basePrice,itemValueMap,prdProduct);
				
			}
			//如果不符合组合，那就用该产品的基础价格来做基数计算
			else{
				logger.info("用户勾选的选项不符合组合价格，沿用产品自身的基础价格");
				BigDecimal basePrice = new BigDecimal(prdProduct.getBasePrice());
				endPrice = calTheEndPrice(basePrice,itemValueMap,prdProduct);
			}
			
			
			orderInfo.setAssessPrice(endPrice.intValue());
			orderInfo.setDetail(getPara("itemDesc").replace("\t", "").replace("\r\n", "").trim());
			setSessionAttr("orderInfo",orderInfo);
			
			setAttr("endPrice", orderInfo.getAssessPrice());
			setAttr("actionUrl",UrlKti.TRADE_ACTION);
			to(UrlKti.ASSESS2_JSP);
		
		} catch (Exception e) {
			logger.error("交易第二步出错",e);
			renderError(500);
		}
	}
	
	//第三步：跳转到让用户输入回收方式和支付方式页面
	public void apply(){
		
		try {
			//获取最近3天的日期
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			List<String> recycleTradeTime = new ArrayList<String>();  
			Calendar now = Calendar.getInstance(); 
			for(int i=0;i<3;i++){
				now.add(Calendar.DAY_OF_MONTH, 1);
				recycleTradeTime.add(sdf.format(now.getTime()));
			}
			setAttr("recycleTradeTime",recycleTradeTime);
			
			setAttr("actionUrl",UrlKti.TRADE_ACTION);
			to(UrlKti.APPLY3_JSP);
		} catch (Exception e) {
			logger.error("交易第三步出错",e);
			renderError(500);
		}
	
	}
	
	
	
	//第四步：保存用户输入的回收方式和支付方式
	//		验证短信验证码
	public void settle(){
		
		JsonMessage jsonMessage = new JsonMessage();
		try {

			OrderInfo orderInfo = getBean(OrderInfo.class, "object");
			orderInfo.setCreateTime(new Date());
			
			//验证短信验证码
			String smsCode = getPara("smsCode");
			Code code = new Code();
			code.setMobile(orderInfo.getContactTel());
			code.setCode(smsCode);
			
			
			boolean isCorrect = smsService.isCodeCorrect(code);
							
			if(!isCorrect){
//			if(!smsCode.equals("1111")){	
				jsonMessage.error();
				jsonMessage.setCode("CODE_ERROR");
				renderJson(jsonMessage);return;
			}
			
			
			//如果短信验证码通过，就保存订单信息
			//获取初始化的订单信息
			OrderInfo oi =getSessionAttr("orderInfo");
			orderInfo.setPrdProductId(oi.getPrdProductId());
			orderInfo.setPrdProductName(oi.getPrdProductName());
			orderInfo.setAssessPrice(oi.getAssessPrice());
			orderInfo.setDetail(oi.getDetail());
			orderInfo.setOrderId(HelpKit.getOrderId());
			orderInfo.setUserName(orderInfo.getContactTel());
			
			//如果回收方式是快递，订单初始化状态是
			if(orderInfo.getRecycleType().equals("express")){
				orderInfo.setStatus(OrderInfoStatus.WAIT_EXPRESS.CODE());
			}else{
				orderInfo.setRemark("* 等待我司上门交易人员确认");
				orderInfo.setStatus(OrderInfoStatus.WAIT_CONFIRM.CODE());
			}
			
			orderInfoService.save(orderInfo);
			setSessionAttr("orderInfo",orderInfo);
			jsonMessage.success();
			logger.info("保存订单成功{}",orderInfo.toString());
			
			
			//发送短信
			//如果回收方式是快递，订单初始化状态是
			List<String> mobileList = new ArrayList<String>();
			mobileList.add(orderInfo.getContactTel());
			Map<String,String> param = new HashMap<String,String>();
			param.put("orderId", orderInfo.getOrderId());
			param.put("prdName", orderInfo.getPrdProductName());
			if(orderInfo.getRecycleType().equals("express")){
				try {
					param.put("expressAddress", sysParamService.getExpressAddress().get(0).getParamDesc());
					SMS.sendNewExpressOrder(mobileList, param);
				} catch (Exception e) {
					logger.error("发送快递回收订单短信失败",e);
				}
			}else{
				try {
					param.put("recycleTradeAddress", orderInfo.getRecycleTradeAddress());
					param.put("recycleTradeTime", DateUtil.YYYYMMDD1.format(orderInfo.getRecycleTradeTime()));
					SMS.sendNewFacetofaceOrder(mobileList, param);
				} catch (Exception e) {
					logger.error("发送当面回收订单短信失败",e);
				}
			}
			try {
				List<String> mobileList_ = new ArrayList<String>();
				mobileList_.add(sysParamService.getNewOrderNotice().get(0).getParamDesc());
				param.put("assessPrice", String.valueOf(orderInfo.getAssessPrice()));
				param.put("contactTel", orderInfo.getContactTel());
				param.put("recycleType", orderInfo.getRecycleType().equals("express") ? "快递":"当面交易");
				SMS.sendNewOrder(mobileList_, param);
			} catch (Exception e) {
				logger.error("发送新订单短信失败",e);
			}
			
			
		} catch (Exception e) {
			logger.error("保存订单回收支付方式出错",e);
			jsonMessage.error();
			jsonMessage.setMessage(e.getMessage());
		}
		
		
		renderJson(jsonMessage);
	}
	
	
	//第五步:跳转到成功页面
	public void success(){
		to(UrlKti.SUCCESS4_JSP);
	}
	
	
	
	
	
	//计算最终价格
	public BigDecimal calTheEndPrice(BigDecimal basePrice,Map<String,BigDecimal> itemValueMap,PrdProduct prdProduct){
		
		//计算价格系数
		StringBuffer sb1 = new StringBuffer();
		BigDecimal totalValue = new  BigDecimal(0);
		for(Map.Entry<String,BigDecimal> entry : itemValueMap.entrySet()){
			BigDecimal baseValue = entry.getValue();
			sb1.append("[系数:"+baseValue+"]");
			totalValue = totalValue.add(baseValue);
		}
		logger.info(String.format("用户勾选的选项，基础价格为%s,配置项系数%s",basePrice.toString(),sb1.toString()));
		
		//价格系数变成百分比
		totalValue = totalValue.divide(new BigDecimal(100));
		
		//基础价格 = 基础价格 + 基础价格*百分比系数
		BigDecimal basePriceValue = basePrice.multiply(totalValue);
		BigDecimal endPrice = basePrice.add(basePriceValue);
		
		
		//如果最终的估算价格小于该商品设置的最低价格，那就按照最低价格来算。
		if(endPrice.compareTo(new BigDecimal(prdProduct.getLimitPrice())) == -1){
			endPrice = new BigDecimal(prdProduct.getLimitPrice());
		}
		
		//如果最终的估算价格小于0，那就按0来算
		if(endPrice.compareTo(new BigDecimal(0)) == -1){
			endPrice = new BigDecimal(0);
		}
		
		logger.info(String.format("用户勾选的产品最终报价为，基础价格+基础价格*浮动系数= 最终价格,[%s + %s * %s = %s ]",basePrice.toString(),basePrice.toString(),totalValue.toString(),endPrice.toString()));
		
		return endPrice;
		
	}
	
}
