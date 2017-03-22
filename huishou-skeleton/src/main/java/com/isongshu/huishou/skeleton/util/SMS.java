package com.isongshu.huishou.skeleton.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.dubbo.common.URL;
import com.alibaba.fastjson.JSON;
/**
 * 
 * @author 短信平台
 * http://www.haoservice.com/
 * 注册账号:samtribiani
 *	//注册账号:samtribiani
//	public static String apiKey = "f7b671a4277e4e0a96e6e07a39be0ddf"; 
//	public static String tplid = "2046";
 */
public class SMS {
	
  
	private static Logger log = LoggerFactory.getLogger(SMS.class);
	
	//注册账号:271757432@qq.com
	//密码: jun5320169
	public static String apiKey = "68678201fd7e49dd8d98fe49e63da498"; 
	public static String tplid = "2147";
	
	public static String newExpressOrderTplid = "2177";
	public static String newFacetofaceOrderTplid = "2178";
	public static String newOrderTplid = "2179";

	
	
	
	public static void main(String[] args) {
		sendCode("18566699414","123");
		
//		testSendNewOrder();
		
	}
	
	
	public static void testSendNewExpressOrder(){
		
		List<String> mobileList = new ArrayList<String>();
		mobileList.add("18566699414");
		
		Map<String,String> param = new HashMap<String,String>();
		param.put("orderId", "1111111111111111");
		param.put("prdName", "苹果iPhone7 plus ");
		param.put("expressAddress", "上海市宝山区纪蕴路588号1号楼6楼（唐生收） 联系电话：021-55609898。");
		
		sendNewExpressOrder(mobileList,param);
	}
	
	public static void testSendNewFacetofaceOrder(){
		
		List<String> mobileList = new ArrayList<String>();
		mobileList.add("18566699414");
		
		Map<String,String> param = new HashMap<String,String>();
		param.put("orderId", "1111111111111111");
		param.put("prdName", "苹果iPhone7 plus ");
		param.put("recycleTradeAddress", "2222222222");
		param.put("recycleTradeTime", "3333333333333");
		
		sendNewFacetofaceOrder(mobileList,param);
	}
	
	public static void testSendNewOrder(){
		
		List<String> mobileList = new ArrayList<String>();
		mobileList.add("18566699414");
		
		Map<String,String> param = new HashMap<String,String>();
		param.put("orderId", "1111111111111111");
		param.put("prdName", "苹果iPhone7 plus ");
		param.put("assessPrice", "2222222222");
		param.put("contactTel", "3333333333333");
		param.put("recycleType", "3333333333333");
		
		sendNewOrder(mobileList,param);
	}



	

	/**
	 * 新提交订单-新订单
	 * @param mobile
	 * @param code
	 */
	public static boolean sendNewOrder(List<String> mobileList,Map<String,String> param){
		if(!valid(mobileList)) return false;
		StringBuffer url = new StringBuffer();
		String curMobile = "";
		try {
			for(String m:mobileList){
				curMobile = m;
				
				String orderId = param.get("orderId");
				String prdName = param.get("prdName");
				String assessPrice = param.get("assessPrice");
				String contactTel = param.get("contactTel");
				String recycleType = param.get("recycleType");
				
				
				StringBuffer tpl_value = new StringBuffer();
				tpl_value.append("&tpl_value=");
				tpl_value.append(URL.encode("#orderId#="+orderId));
				tpl_value.append(URL.encode("&#prdName#="+prdName));
				tpl_value.append(URL.encode("&#assessPrice#="+assessPrice));
				tpl_value.append(URL.encode("&#contactTel#="+contactTel));
				tpl_value.append(URL.encode("&#recycleType#="+recycleType));
				
				
				send(m,newOrderTplid,tpl_value.toString());
			}
			
			return true;
		} catch (Exception e) {
			log.error( String.format("发送短信 失败! 【MOBILE=%s】【TPLID=%s】 【URL=%s】",curMobile,newOrderTplid,url.toString()),e);
			return false;
		}
		
	}
	
	
	
	/**
	 * 新提交订单-当面回收
	 * @param mobile
	 * @param code
	 */
	public static boolean sendNewFacetofaceOrder(List<String> mobileList,Map<String,String> param){
		if(!valid(mobileList)) return false;
		StringBuffer url = new StringBuffer();
		String curMobile = "";
		try {
			for(String m:mobileList){
				curMobile = m;
				
				String orderId = param.get("orderId");
				String prdName = param.get("prdName");
				String recycleTradeAddress = param.get("recycleTradeAddress");
				String recycleTradeTime = param.get("recycleTradeTime");
				
				StringBuffer tpl_value = new StringBuffer();
				tpl_value.append("&tpl_value=");
				tpl_value.append(URL.encode("#orderId#="+orderId));
				tpl_value.append(URL.encode("&#prdName#="+prdName));
				tpl_value.append(URL.encode("&#recycleTradeAddress#="+recycleTradeAddress));
				tpl_value.append(URL.encode("&#recycleTradeTime#="+recycleTradeTime));
				
				
				send(m,newFacetofaceOrderTplid,tpl_value.toString());
			}
			
			return true;
		} catch (Exception e) {
			log.error( String.format("发送短信 失败! 【MOBILE=%s】【TPLID=%s】 【URL=%s】",curMobile,newFacetofaceOrderTplid,url.toString()),e);
			return false;
		}
		
	}
	
	
	/**
	 * 新提交订单-快递回收
	 * @param mobile
	 * @param code
	 */
	public static boolean sendNewExpressOrder(List<String> mobileList,Map<String,String> param){
		if(!valid(mobileList)) return false;
		StringBuffer url = new StringBuffer();
		String curMobile = "";
		try {
			for(String m:mobileList){
				curMobile = m;
				
				String orderId = param.get("orderId");
				String prdName = param.get("prdName");
				String expressAddress = param.get("expressAddress");
				
				StringBuffer tpl_value = new StringBuffer();
				tpl_value.append("&tpl_value=");
				tpl_value.append(URL.encode("#orderId#="+orderId));
				tpl_value.append(URL.encode("&#prdName#="+prdName));
				tpl_value.append(URL.encode("&#expressAddress#="+expressAddress));
				
				send(m,newExpressOrderTplid,tpl_value.toString());
			}
			
			return true;
		} catch (Exception e) {
			log.error( String.format("发送短信 失败! 【MOBILE=%s】【TPLID=%s】 【URL=%s】",curMobile,newExpressOrderTplid,url.toString()),e);
			return false;
		}
		
	}
	
	
	public static boolean valid(List<String> mobileList){
		
		
		if(mobileList == null || mobileList.size() <= 0){
			return false;
		}
		
		for(String mobile:mobileList)
		{
			if(!ValidateUtil.isMobile(mobile)){
				return false;
			}
		}
		
		return true;
	}
	
	
	public static void send(String mobile,String tpl_id,String tpl_value){
		
		StringBuffer url = new StringBuffer();
		mobile = "&mobile="+mobile;
		String key = "key="+apiKey;
		tpl_id = "&tpl_id="+tpl_id;
		
		
		url.append("http://apis.haoservice.com/sms/send?");
		url.append(key).append(mobile).append(tpl_id).append(tpl_value.toString());
		String respJson = HttpKits.get(url.toString(), null, null);
		
		SMSResp resp = (SMSResp)JSON.parseObject(respJson,SMSResp.class);
		
		if(resp != null && resp.getError_code().equals("0")){
			log.info( String.format("发送短信成功! 【MOBILE=%s】【TPLID=%s】 【URL=%s】",mobile,tpl_id,url.toString()));
		}else{
			log.error( String.format("发送短信 失败!【MOBILE=%s】【TPLID=%s】 【返回值=%s】 【URL=%s】",mobile,tpl_id,respJson,url.toString()));
		}
		
	}
	
	
	
	
	
	/**
	 * 发送短信验证码
	 * @param mobile
	 * @param code
	 */
	public static boolean sendCode(String mobile,String code){
		
		if(mobile == null || mobile.equals("")){
			return false;
		}
		
		if(!ValidateUtil.isMobile(mobile)){
			return false;
		}
		
		if(code == null || code.equals("")){
			return false;
		}
		
		StringBuffer url = new StringBuffer();
		try {
			mobile = "&mobile="+mobile;
			String tpl_id = "&tpl_id="+tplid;
			String tpl_value = "&tpl_value=%23code%23%3d"+code;
			String key = "key="+apiKey;
			
			
			url.append("http://apis.haoservice.com/sms/send?");
			url.append(key).append(mobile).append(tpl_id).append(tpl_value);
			String respJson = HttpKits.get(url.toString(), null, null);
			
			SMSResp resp = (SMSResp)JSON.parseObject(respJson,SMSResp.class);
			
			if(resp != null && resp.getError_code().equals("0")){
				log.info( String.format("发送短信验证码成功! 【MOBILE=%s】【CODE=%s】 【URL=%s】",mobile,code,url.toString()));
				return true;
			}else{
				log.error( String.format("发送短信验证码 失败!【MOBILE=%s】【CODE=%s】 【返回值=%s】 【URL=%s】",mobile,code,respJson,url.toString()));
				return false;
			}
			
		} catch (Exception e) {
			log.error( String.format("发送短信验证码 失败! 【MOBILE=%s】【CODE=%s】 【URL=%s】",mobile,code,url.toString()),e);
			return false;
		}
		
	}
	

	
}
