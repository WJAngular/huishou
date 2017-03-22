package com.isongshu.huishou.front.controller;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.isongshu.huishou.front.interceptor.IsLoginInterceptor;
import com.isongshu.huishou.front.util.HelpKit;
import com.isongshu.huishou.front.util.UrlKti;
import com.isongshu.huishou.skeleton.model.OrderInfo;
import com.isongshu.huishou.skeleton.model.SysParam;
import com.isongshu.huishou.skeleton.service.DbBaseService;
import com.isongshu.huishou.skeleton.service.OrderInfoService;
import com.isongshu.huishou.skeleton.service.PrdClazzBrandService;
import com.isongshu.huishou.skeleton.service.PrdPackageService;
import com.isongshu.huishou.skeleton.service.PrdProductService;
import com.isongshu.huishou.skeleton.service.SmsService;
import com.isongshu.huishou.skeleton.service.SysParamService;
import com.isongshu.huishou.skeleton.service.UserService;
import com.isongshu.huishou.skeleton.util.OrderInfoStatus;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.spring.Inject;
import com.jfinal.plugin.spring.IocInterceptor;

/**
 * 用户中心
 * @author Administrator
 *
 */
@Before({ IocInterceptor.class,IsLoginInterceptor.class })
public class UserController extends _Controller {

	 private static Logger logger = LoggerFactory.getLogger(UserController.class);
	 
	@Inject.BY_NAME
	private PrdProductService prdProductService;
	@Inject.BY_NAME
	private PrdClazzBrandService prdClazzBrandService;
	@Inject.BY_NAME
	private PrdPackageService prdPackageService;
	@Inject.BY_NAME
	private DbBaseService dbBaseService;
	@Inject.BY_NAME
	private SmsService smsService;
	@Inject.BY_NAME
	private UserService userService;
	@Inject.BY_NAME
	private OrderInfoService orderInfoService;
	@Inject.BY_NAME
	private SysParamService sysParamService;
	
	
	public void home() {
		//显示订单信息
		OrderInfo orderInfo = new OrderInfo();
		orderInfo.setContactTel(getUser().getTel());
		
		
		String USER_AGENT = getRequest().getHeader("User-Agent");
		if(HelpKit.isMobile(USER_AGENT)){
			List<OrderInfo> orderInfoList = orderInfoService.find(orderInfo);
			setAttr("objectPage", orderInfoList);
		}else{
			Page<OrderInfo> page = orderInfoService.paginate(getParaToInt(0, 1), 10, orderInfo);
			setAttr("objectPage", page);
		}
		
		
		List<SysParam> orderStatus = sysParamService.getOrderStatus();
		setAttr("orderStatus",orderStatus);
		setAttr("actionUrl",UrlKti.USER_ACTION);
		setAttr("actionParas",coverToParams(orderInfo, "object"));
		setAttr("object",orderInfo);
		to(UrlKti.USER_HOME_JSP);
	}
	
	
	//跳转到用户发货页面
	public void toExpress(){
		
		try {
			String id = getPara("id");
			if(id == null || id.equals("")){
				logger.warn("订单编号不存在{}",id);
				redirect(UrlKti.USER_HOME_ACTION);return;
			}
			
			OrderInfo orderInfoCondition = new OrderInfo();
			orderInfoCondition.setId(Integer.valueOf(id));
			orderInfoCondition.setContactTel(getUser().getTel());
			List<OrderInfo> orderInfos = orderInfoService.find(orderInfoCondition);
			if(orderInfos == null){
				logger.warn("订单信息不存在");
				redirect(UrlKti.USER_HOME_ACTION);return;
			}
			
			//加载我司地址
			SysParam expressAddress = sysParamService.getExpressAddress().get(0);
			//加载快递公司列表
			List<SysParam> express = sysParamService.getExpress();
			List<SysParam> orderStatus = sysParamService.getOrderStatus();
			setAttr("orderStatus",orderStatus);
			setAttr("express",express);
			setAttr("expressAddress",expressAddress);
			
			setSessionAttr("orderInfo",orderInfos.get(0));
			to(UrlKti.USER_ORDER_EXPRESS_JSP);
		} catch (Exception e) {
			logger.error("跳转到发货页面出错{}",e.getMessage(),e);
			redirect(UrlKti.USER_HOME_ACTION);
		}
		
	}
	
	//发货按钮
	public void express(){
		
		try {
			OrderInfo orderInfo = getSessionAttr("orderInfo");
			if(orderInfo == null){
				logger.warn("订单信息不存在");
				redirect(UrlKti.USER_HOME_ACTION);return;
			}
			
			OrderInfo oi = getBean(OrderInfo.class,"object");
			orderInfo.setRecycleExpressCode(oi.getRecycleExpressCode());
			orderInfo.setRecycleExpress(oi.getRecycleExpress());
			//如果发货完毕，状态改成待收货
			orderInfo.setStatus(OrderInfoStatus.WAIT_TAKE.CODE());
			orderInfo.setRemark("*  用户已发货，等待我司收货");
			orderInfoService.update(orderInfo);
			logger.info("更新订单成功{}",orderInfo.toString());
		} catch (Exception e) {
			logger.error("发货出错{}",e.getMessage(),e);
		}
		
		redirect(UrlKti.USER_HOME_ACTION);
	}
	
	//取消订单
	public void cancelOrder(){
		

		try {
			String id = getPara("id");
			if(id == null || id.equals("")){
				logger.warn("订单编号不存在{}",id);
				redirect(UrlKti.USER_HOME_ACTION);return;
			}
			
			OrderInfo orderInfoCondition = new OrderInfo();
			orderInfoCondition.setId(Integer.valueOf(id));
			orderInfoCondition.setContactTel(getUser().getTel());
			List<OrderInfo> orderInfos = orderInfoService.find(orderInfoCondition);
			if(orderInfos == null){
				logger.warn("订单信息不存在");
				redirect(UrlKti.USER_HOME_ACTION);return;
			}
			
			orderInfoCondition = new OrderInfo();
			orderInfoCondition.setId(Integer.valueOf(id));
			//如果发货完毕，状态改成待收货
			orderInfoCondition.setStatus(OrderInfoStatus.CLOSE.CODE());
			orderInfoService.update(orderInfoCondition);
			logger.info("取消订单成功{}",orderInfoCondition.toString());
		} catch (Exception e) {
			logger.error("取消订单失败{}",e.getMessage(),e);
		}
		
		redirect(UrlKti.USER_HOME_ACTION);
	}
	
	//跳转到订单信息页面
	public void toOrderInfo(){
		
		try {
			String id = getPara("id");
			if(id == null || id.equals("")){
				logger.warn("订单编号不存在{}",id);
				redirect(UrlKti.USER_HOME_ACTION);return;
			}
			
			OrderInfo orderInfoCondition = new OrderInfo();
			orderInfoCondition.setId(Integer.valueOf(id));
			orderInfoCondition.setContactTel(getUser().getTel());
			List<OrderInfo> orderInfos = orderInfoService.find(orderInfoCondition);
			if(orderInfos == null){
				logger.warn("订单信息不存在");
				redirect(UrlKti.USER_HOME_ACTION);return;
			}
			
			//加载快递公司列表
			List<SysParam> express = sysParamService.getExpress();
			List<SysParam> orderStatus = sysParamService.getOrderStatus();
			List<SysParam> recycleTradeAddressCity = sysParamService.getRecycleTradeAddressCity();
			
			setAttr("recycleTradeAddressCity",recycleTradeAddressCity);
			setAttr("orderStatus",orderStatus);
			setAttr("express",express);
			setSessionAttr("orderInfo",orderInfos.get(0));
			render("/user/order/order_info.jsp");
			to(UrlKti.USER_ORDER_INFO_JSP);
		} catch (Exception e) {
			logger.error("跳转到订单信息页面{}",e.getMessage(),e);
			redirect(UrlKti.USER_HOME_ACTION);
		}
		
	}
	
	
	
	
	
}
