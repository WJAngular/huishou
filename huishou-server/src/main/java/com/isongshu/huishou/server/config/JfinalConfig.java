package com.isongshu.huishou.server.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.druid.filter.stat.StatFilter;
import com.alibaba.druid.util.JdbcConstants;
import com.alibaba.druid.wall.WallFilter;
import com.isongshu.huishou.skeleton.model._MappingKit;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.kit.PathKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.dialect.MysqlDialect;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.plugin.druid.DruidStatViewHandler;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.jfinal.plugin.spring.SpringPlugin;
import com.jfinal.render.ViewType;

public class JfinalConfig extends JFinalConfig {

	private static Logger logger = LoggerFactory.getLogger(JfinalConfig.class);
	
	@Override
	public void configConstant(Constants me) {
		loadPropertyFile("properties/jdbc.properties");
		me.setDevMode(getPropertyToBoolean("devMode", false));
		me.setViewType(ViewType.JSP);
	}

	@Override
	public void configHandler(Handlers me) {
		// 声明Druid监控页面URL
		me.add(new DruidStatViewHandler("/druid"));
	}

	@Override
	public void configInterceptor(Interceptors me) {
	}

	@Override
	public void configPlugin(Plugins me) {
		// 配置Druid数据库连接池插件
		DruidPlugin dp = new DruidPlugin(getProperty("jdbcUrl"),getProperty("user"), getProperty("password").trim());
		StatFilter stat = new StatFilter();
		stat.setMergeSql(true);
		dp.addFilter(stat);
		dp.setTestOnBorrow(false);
		dp.setTestOnReturn(false);
		
		
		
		WallFilter wall = new WallFilter();
		wall.setDbType(JdbcConstants.MYSQL);

		dp.addFilter(wall);

		// 配置ActiveRecord插件
		ActiveRecordPlugin arp = new ActiveRecordPlugin(dp);
		arp.setShowSql(getPropertyToBoolean("devMode", false));
		arp.setDevMode(getPropertyToBoolean("devMode", false));
		arp.setDialect(new MysqlDialect());
		
		
		
		
		
		System.out.println("当前目录:"+PathKit.getWebRootPath());
		
		// 配置Spring插件
		SpringPlugin sp = new SpringPlugin("file:"+PathKit.getWebRootPath()+"/WEB-INF/classes/applicationContext.xml");
		
		// 加入各插件到Config
		me.add(dp);
		me.add(arp);
		me.add(sp);
		
		
		me.add(new EhCachePlugin());
		
		// 所有配置在 MappingKit 中搞定
		_MappingKit.mapping(arp);
		
	}

	@Override
	public void configRoute(Routes me) {
//		me.add("/", IndexController.class);
	}

	@Override
	public void afterJFinalStart() {
		logger.info("服务端-启动完毕！");
	}
}
