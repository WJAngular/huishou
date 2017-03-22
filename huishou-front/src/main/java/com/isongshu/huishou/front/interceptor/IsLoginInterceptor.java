package com.isongshu.huishou.front.interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.isongshu.huishou.skeleton.model.User;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;

/**
 * 是否登录拦截器
 *
 */
public class IsLoginInterceptor implements Interceptor{

	private static Logger logger = LoggerFactory.getLogger(IsLoginInterceptor.class);

	@Override
	public void intercept(Invocation inv) {
		try {
			Controller controller = inv.getController();
			User user = controller.getSessionAttr("user");
			if(user == null){
				 controller.redirect("/");
			}else{
				inv.invoke();
			}
		} catch (Exception e) {
			logger.error("登录拦截器出错",e);
		}
		
		
	}
}
