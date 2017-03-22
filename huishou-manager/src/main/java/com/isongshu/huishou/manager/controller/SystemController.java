package com.isongshu.huishou.manager.controller;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.isongshu.huishou.manager.interceptor.IsLoginInterceptor;
import com.isongshu.huishou.skeleton.model.SysAdmin;
import com.isongshu.huishou.skeleton.service.SysAdminService;
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
	private SysAdminService sysAdminService;
	
	public void randomCode() {
		CaptchaRenderUtil img = new CaptchaRenderUtil(CFG.IMAGE_RANDOM_CODE);
		render(img);
	}

	
	public void logout(){
		removeSessionAttr("sysAdmin");
		redirect("/");
	}
	
	
	public void login(){
		
		JsonMessage jsonMessage = new JsonMessage();
		try {
			
			//校验验证码
			//校验登录账号密码
			String username = getPara("username", "");
			String password = getPara("password", "");
			String inputRandomCode = getPara("code", "");
			if (inputRandomCode != null && !inputRandomCode.equals(""))
				inputRandomCode = inputRandomCode.toUpperCase();
			String systemRandomCode = CFG.IMAGE_RANDOM_CODE;
			if (CaptchaRenderUtil.validate(this,inputRandomCode, systemRandomCode) == false) {
				logger.warn("登录-图片验证码错误! [{}] ",username);
				jsonMessage.setMessage("CODE_ERROR");
				jsonMessage.error();
			}else{
				
				
				SysAdmin sysAdmin_ = new SysAdmin();
				sysAdmin_.setUsername(username);
				sysAdmin_.setPassword(password);
				
				logger.warn("登录-正在与后台校验账号密码 ....");
				SysAdmin sysAdmin = sysAdminService.login(sysAdmin_);
				if(sysAdmin == null){
					logger.warn("登录-账号密码错误! [{}]",username);
					jsonMessage.setMessage("LOGIN_FAILD");
					jsonMessage.error();
				}else if(sysAdmin.getStatus() != null && sysAdmin.getStatus().equals("2")){
					logger.warn("登录-账号被锁! [{}]",username);
					jsonMessage.setMessage("LOCK");
					jsonMessage.error();
				}else{
					logger.warn("登录-登录成功！[{}]",username);
					setSessionAttr("sysAdmin", sysAdmin);
					jsonMessage.success();
				}
				
			}
			
		} catch (Exception e) {
			logger.error("登录验证出错{}",e);
			jsonMessage.error();
		}
		renderJson(jsonMessage);
	}
	
	
	
	
}
