package com.isongshu.huishou.manager.controller;


import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.isongshu.huishou.manager.interceptor.IsLoginInterceptor;
import com.isongshu.huishou.skeleton.model.SysAdmin;
import com.isongshu.huishou.skeleton.model.SysParam;
import com.isongshu.huishou.skeleton.service.SysAdminService;
import com.isongshu.huishou.skeleton.service.SysParamService;
import com.isongshu.huishou.skeleton.util.JsonMessage;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.spring.Inject;
import com.jfinal.plugin.spring.IocInterceptor;

@Before({ IocInterceptor.class,IsLoginInterceptor.class })
public class SysAdminController extends _Controller {

	 private static Logger logger = LoggerFactory.getLogger(SysAdminController.class);
	 
	@Inject.BY_NAME
	private SysAdminService sysAdminService;
	
	@Inject.BY_NAME
	private SysParamService sysParamService;
	
	public void index() {
		
		SysAdmin sysAdmin = getBean(SysAdmin.class, "object");
		Page<SysAdmin> page = sysAdminService.paginate(getParaToInt(0, 1), 10, sysAdmin);
		
		
		List<SysParam> recycleTradeAddressCity = sysParamService.getRecycleTradeAddressCity();
		setAttr("recycleTradeAddressCity",recycleTradeAddressCity);
		setAttr("actionUrl","/sysAdmin/");
		setAttr("actionParas",coverToParams(sysAdmin, "object"));
		setAttr("object",sysAdmin);
		setAttr("objectPage", page);
		
		render("/WEB-INF/jsp/system/admin/view.jsp");
	}

	public void toAdd() {
		List<SysParam> recycleTradeAddressCity = sysParamService.getRecycleTradeAddressCity();
		setAttr("recycleTradeAddressCity",recycleTradeAddressCity);
		setAttr("addOrUpdate","add");
		render("/WEB-INF/jsp/system/admin/addOrUpdateModal.jsp");
	}

	public void toUpdate() {
		List<SysParam> recycleTradeAddressCity = sysParamService.getRecycleTradeAddressCity();
		setAttr("recycleTradeAddressCity",recycleTradeAddressCity);
		setAttr("object", sysAdminService.findById(getPara("id")));
		setAttr("addOrUpdate","update");
		render("/WEB-INF/jsp/system/admin/addOrUpdateModal.jsp");
	}
	
	
	public void add() {
		JsonMessage jsonMessage = new JsonMessage();
		try {
			SysAdmin sysAdmin = getBean(SysAdmin.class, "object");
			
			
			//判断账号是否重复
			SysAdmin condition  = new SysAdmin();
			condition.setUsername(sysAdmin.getUsername());
			if(sysAdminService.find(condition).size() > 0){
				jsonMessage.error();
				jsonMessage.setMessage("账户已经存在");
				renderJson(jsonMessage);return;
			}
			
			//区域代理只能唯一
			if(sysAdmin.getType().equals("2")){
				condition  = new SysAdmin();
				condition.setZone(sysAdmin.getZone());
				if(sysAdminService.find(condition) .size() > 0){
					jsonMessage.error();
					jsonMessage.setMessage("该区域的代理已经存在");
					renderJson(jsonMessage);return;
				}
			}
			
			sysAdmin.setCreateTime(new Date());
			sysAdmin.setCreateUser(getLoginUser().getUsername());
			sysAdminService.save(sysAdmin);
			jsonMessage.success();
		} catch (Exception e) {
			logger.error("保存出错",e);
			jsonMessage.error();
			jsonMessage.setMessage(e.getMessage());
		}
		renderJson(jsonMessage);
	}

	public void update() {
		JsonMessage jsonMessage = new JsonMessage();
		try {
			SysAdmin userAdmin = getBean(SysAdmin.class, "object");
			sysAdminService.update(userAdmin);
			jsonMessage.success();
		} catch (Exception e) {
			jsonMessage.error();
			logger.error("更新管理员账户出错",e);
			jsonMessage.error();
			jsonMessage.setMessage(e.getMessage());
		}
		renderJson(jsonMessage);
	}

	
	public void delete() {
		JsonMessage jsonMessage = new JsonMessage();
		try {
			String[] ids = getParaValues("ids[]");
			for(String id : ids){
				sysAdminService.deleteById(id);
			}
			jsonMessage.success();
		} catch (Exception e) {
			jsonMessage.error();
			logger.error("删除账户出错",e);
			jsonMessage.error();
			jsonMessage.setMessage(e.getMessage());
		}
		renderJson(jsonMessage);
	}
}
