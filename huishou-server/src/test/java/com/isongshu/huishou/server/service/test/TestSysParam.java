package com.isongshu.huishou.server.service.test;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.isongshu.huishou.skeleton.model.SysParam;
import com.isongshu.huishou.skeleton.service.SysParamService;

public class TestSysParam  extends TestDefault{

	private static Logger logger = LoggerFactory.getLogger(TestSysParam.class);
	
	
	/**
	 * bean要去spring容器获取
	 */
	public void testFind(){
		SysParamService sysParamService = (SysParamService) ctx.getBean("sysParamService");
		
		SysParam sysParam = new SysParam();
		sysParam.setParamType("payBank");
		 List<SysParam> sysParams = sysParamService.find(sysParam);
		 logger.info("{}","123123");
		 for(SysParam u : sysParams){
			 logger.info(u.getParamCode());
		 }
		 
	}
	
	
	public void testFind1(){
		SysParamService sysParamService = (SysParamService) ctx.getBean("sysParamService");
		
		 List<SysParam> sysParams = sysParamService.getRecycleTradeAddressCity();
		 for(SysParam u : sysParams){
			 logger.info(u.getParamCode());
		 }
		 
	}
	

	
}
