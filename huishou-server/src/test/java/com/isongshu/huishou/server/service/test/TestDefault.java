package com.isongshu.huishou.server.service.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.alibaba.druid.util.JdbcConstants;
import com.alibaba.druid.wall.WallFilter;
import com.isongshu.huishou.skeleton.model._MappingKit;
import com.jfinal.kit.PathKit;
import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.dialect.MysqlDialect;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.jfinal.plugin.spring.SpringPlugin;

import junit.framework.TestCase;


/**
 * 
 *	这是单元测试的初始化方法，所有测试必须继承此类 
 *
 */
public class TestDefault extends TestCase{
	
	ApplicationContext ctx;
	
	protected void setUp() throws InterruptedException{
		// 读取配置文件
		Prop p = PropKit.use("properties/jdbc.properties", "utf-8");

		// 配置Druid数据库连接池插件
		DruidPlugin dp = new DruidPlugin(p.get("jdbcUrl"), p.get("user"), p
				.get("password").trim());

		WallFilter wall = new WallFilter();
		wall.setDbType(JdbcConstants.MYSQL);
		dp.addFilter(wall);

		// 配置ActiveRecord插件
		ActiveRecordPlugin arp = new ActiveRecordPlugin(dp);

		arp.setDialect(new MysqlDialect());
		arp.setShowSql(p.getBoolean("devMode", false));
		arp.setDevMode(p.getBoolean("devMode", false));

		// 所有配置在 MappingKit 中搞定
		_MappingKit.mapping(arp);
		
		EhCachePlugin ehcache = new EhCachePlugin();
		
		
		// 手动启动各插件
		dp.start();
		arp.start();
		ehcache.start();
		ctx = new FileSystemXmlApplicationContext(PathKit.getWebRootPath()+"/src/test/resources/applicationContext-test.xml");
		
		
		System.out.println("启动完成。");
		
	}
	
	
	
	
}
