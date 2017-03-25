package com.isongshu.huishou.manager.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.isongshu.huishou.manager.controller.CmsLinkController;
import com.isongshu.huishou.manager.controller.IndexController;
import com.isongshu.huishou.manager.controller.NewsInfoController;
import com.isongshu.huishou.manager.controller.OrderInfoController;
import com.isongshu.huishou.manager.controller.OtherBigRecycleController;
import com.isongshu.huishou.manager.controller.OtherJoinController;
import com.isongshu.huishou.manager.controller.OtherNewProductController;
import com.isongshu.huishou.manager.controller.PrdClazzBrandController;
import com.isongshu.huishou.manager.controller.PrdPackageController;
import com.isongshu.huishou.manager.controller.PrdPackageItemController;
import com.isongshu.huishou.manager.controller.PrdProductController;
import com.isongshu.huishou.manager.controller.SysAdminController;
import com.isongshu.huishou.manager.controller.SysParamController;
import com.isongshu.huishou.manager.controller.SystemController;
import com.isongshu.huishou.manager.controller.UserController;
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

public class JfinalConfig extends JFinalConfig {

	 private static Logger logger = LoggerFactory.getLogger(JfinalConfig.class);
	 
	@Override
	public void configConstant(Constants me) {
		me.setDevMode(true);
		me.setViewType(ViewType.JSP);
		/**
		 * 这是因为model生成了 getter方法，而 jsp 则使用了 getter 方法去取数据了，而 getter 方法对应的属性名是驼峰的，
		 * 所以需要 ${user.userId} 而不是 ${user.user_id} 去取数据。
   		 *jfinal 2.2 提供了一个参数，可以让 jsp 仍然使用以前的方式读取数，从而无视 getter 方法的存在，使用一下如下代码即可设置：
   		 *这种方式的一个好处是，可以读取关联查询中本 model 不存在的属性，也可以读取使用 put 方法任意放进去的属性，如 user.put("key", 123)。
		 */
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
		me.add("/", IndexController.class);
		me.add("/system",SystemController.class);
		me.add("/sysAdmin", SysAdminController.class);
		me.add("/sysParam",SysParamController.class);
		me.add("/prdPackage",PrdPackageController.class);
		me.add("/prdPackageItem",PrdPackageItemController.class);
		me.add("/prdClazzBrand",PrdClazzBrandController.class);
		me.add("/prdProduct",PrdProductController.class);
		me.add("/orderInfo",OrderInfoController.class);
		me.add("/newsInfo",NewsInfoController.class);
		me.add("/linkInfo",CmsLinkController.class);
		
		me.add("/otherBigRecycle",OtherBigRecycleController.class);
		me.add("/otherJoin",OtherJoinController.class);
		me.add("/otherNewProduct",OtherNewProductController.class);
		me.add("/user",UserController.class);
		
	}

	@Override
	public void afterJFinalStart() {
		logger.info("管理后台-启动完毕！");
	}

}
