package com.isongshu.huishou.front.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.isongshu.huishou.front.controller.ClazzController;
import com.isongshu.huishou.front.controller.IndexController;
import com.isongshu.huishou.front.controller.OtherController;
import com.isongshu.huishou.front.controller.SystemController;
import com.isongshu.huishou.front.controller.TradeController;
import com.isongshu.huishou.front.controller.UserController;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.kit.PathKit;
import com.jfinal.plugin.activerecord.ModelRecordElResolver;
import com.jfinal.plugin.spring.SpringPlugin;
import com.jfinal.render.ViewType;

public class FrontConfig extends JFinalConfig {

	 private static Logger logger = LoggerFactory.getLogger(FrontConfig.class);
	 
	@Override
	public void configConstant(Constants me) {
		me.setDevMode(false);
		me.setViewType(ViewType.JSP);
		me.setError404View("/404.jsp");
		me.setError500View("/500.jsp");
		ModelRecordElResolver.setResolveBeanAsModel(true);
	}

	@Override
	public void configHandler(Handlers me) {
	}	

	@Override
	public void configInterceptor(Interceptors me) {
	}

	@Override
	public void configPlugin(Plugins me) {
		SpringPlugin sp = new SpringPlugin("file:"+PathKit.getWebRootPath()+"/WEB-INF/classes/applicationContext.xml");
		me.add(sp);
	}

	@Override
	public void configRoute(Routes me) {
		me.add("/",IndexController.class);
		me.add("/clazz",ClazzController.class);
		me.add("/trade",TradeController.class);
		me.add("/system",SystemController.class);
		me.add("/user",UserController.class);
		me.add("/other",OtherController.class);
	}

	@Override
	public void afterJFinalStart() {
		logger.info("门户系统-启动完毕！");
	}

}
