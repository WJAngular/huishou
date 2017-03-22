package com.isongshu.huishou.front.controller;


import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.isongshu.huishou.front.util.HelpKit;
import com.isongshu.huishou.skeleton.model.Code;
import com.isongshu.huishou.skeleton.model.User;
import com.isongshu.huishou.skeleton.service.DbBaseService;
import com.isongshu.huishou.skeleton.service.PrdClazzBrandService;
import com.isongshu.huishou.skeleton.service.PrdPackageService;
import com.isongshu.huishou.skeleton.service.PrdProductService;
import com.isongshu.huishou.skeleton.service.SmsService;
import com.isongshu.huishou.skeleton.service.UserService;
import com.isongshu.huishou.skeleton.util.CFG;
import com.isongshu.huishou.skeleton.util.CaptchaRenderUtil;
import com.isongshu.huishou.skeleton.util.JsonMessage;
import com.jfinal.aop.Before;
import com.jfinal.plugin.spring.Inject;
import com.jfinal.plugin.spring.IocInterceptor;

@Before({ IocInterceptor.class })
public class SystemController extends _Controller {

	 private static Logger logger = LoggerFactory.getLogger(SystemController.class);
	 
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
	
	public void randomCode() {
		CaptchaRenderUtil img = new CaptchaRenderUtil(CFG.IMAGE_RANDOM_CODE);
		render(img);
	}

	public void validRandomCode(){
		
		JsonMessage jsonMessage = new JsonMessage();
		String inputRandomCode = getPara("code", "");
		if (inputRandomCode != null && !inputRandomCode.equals(""))
			inputRandomCode = inputRandomCode.toUpperCase();
		
		String systemRandomCode = CFG.IMAGE_RANDOM_CODE;
		if (CaptchaRenderUtil.validate(this,inputRandomCode, systemRandomCode) == true) {
			jsonMessage.success();
		}else{
			jsonMessage.error();
		}
		renderJson(jsonMessage);
	}
	
	
	public void logout(){
		removeSessionAttr("user");
		redirect("/");
	}
	
	
	public void login(){
		
		JsonMessage jsonMessage = new JsonMessage();
		try {
			
			//验证手机校验码
			String smsCode = getPara("smsCode");
			String tel = getPara("tel");
			Code code = new Code();
			code.setMobile(tel);
			code.setCode(smsCode);
			
			boolean isCorrect = smsService.isCodeCorrect(code);
			if(isCorrect){
//			if(smsCode.equals("1111")){
				//保存用户
				User user = new User();
				user.setTel(tel);
				user.setUsername(user.getTel());
				//如果用户不存在，就保存到数据库
				if(userService.find(user).size() <= 0){
					user.setCreateTime(new Date());
					userService.save(user);
				}
				setSessionAttr("user", user);
				jsonMessage.success();
			}else{
				jsonMessage.error();
			}
			
		} catch (Exception e) {
			logger.error("验证短信校验码出错{}",e);
			jsonMessage.error();
		}
		renderJson(jsonMessage);
	}
	
	
	public void sendCode(){
		JsonMessage jsonMessage = new JsonMessage();
		
		
		try {
			String mobile = getPara("mobile");
			
			Code code = new Code();
			code.setMobile(mobile);
			code.setCode(HelpKit.getCode());
			code.setCreateTime(new Date());
			
			logger.info("发送短信{}",code.toString());
			if(smsService.sendOverLimit(code)){
				jsonMessage.setMessage("该手机号当日发送短信数量超过上限！");
				jsonMessage.error();
			}else{
				jsonMessage.success();
				smsService.send(code);
			}
		} catch (Exception e) {
			logger.error("发送短信出错{}",e);
			jsonMessage.setMessage("系统异常");
			jsonMessage.error();
		}
		
		renderJson(jsonMessage);
	}
	
	
}
