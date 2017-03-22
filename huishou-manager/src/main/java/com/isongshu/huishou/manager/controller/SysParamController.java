package com.isongshu.huishou.manager.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.isongshu.huishou.manager.interceptor.IsLoginInterceptor;
import com.isongshu.huishou.skeleton.model.OrderInfo;
import com.isongshu.huishou.skeleton.model.PrdClazzBrand;
import com.isongshu.huishou.skeleton.model.PrdPackage;
import com.isongshu.huishou.skeleton.model.PrdPackageItem;
import com.isongshu.huishou.skeleton.model.PrdProduct;
import com.isongshu.huishou.skeleton.model.SysAdmin;
import com.isongshu.huishou.skeleton.model.SysParam;
import com.isongshu.huishou.skeleton.model.sql.SqlCondition;
import com.isongshu.huishou.skeleton.model.sql.SqlObject;
import com.isongshu.huishou.skeleton.model.sql.SqlOperEnum;
import com.isongshu.huishou.skeleton.service.DbBaseService;
import com.isongshu.huishou.skeleton.service.OrderInfoService;
import com.isongshu.huishou.skeleton.service.PrdPackageService;
import com.isongshu.huishou.skeleton.service.SysParamService;
import com.isongshu.huishou.skeleton.util.JsonMessage;
import com.isongshu.huishou.skeleton.util.OrderInfoStatus;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.spring.Inject;
import com.jfinal.plugin.spring.IocInterceptor;

@Before({ IocInterceptor.class,IsLoginInterceptor.class })
public class SysParamController extends _Controller{

	
	private static Logger logger = LoggerFactory.getLogger(SysParamController.class);
	 
	@Inject.BY_NAME
	private SysParamService sysParamService;
	
	public void index() {
		SysParam sysParam = getBean(SysParam.class, "object");
		Page<SysParam> page = sysParamService.paginate(getParaToInt(0, 1), 10, sysParam);
		setAttr("actionUrl","/sysParam/");
		setAttr("actionParas",coverToParams(sysParam, "object"));
		setAttr("object",sysParam);
		setAttr("objectPage", page);
		render("/WEB-INF/jsp/system/param/view.jsp");
	}
	
	
	public void toAdd() {
		setAttr("addOrUpdate","add");
		render("/WEB-INF/jsp/system/param/addOrUpdateModal.jsp");
	}

	public void toUpdate() {
		setAttr("object", sysParamService.findById(getPara("id")));
		setAttr("addOrUpdate","update");
		render("/WEB-INF/jsp/system/param/addOrUpdateModal.jsp");
	}
	
	
	
	public void add() {
		JsonMessage jsonMessage = new JsonMessage();
		try {
			SysParam sysParam = getBean(SysParam.class, "object");
			
			//判断重复性
			SysParam conditiaon = new SysParam();
			conditiaon.setParamType(sysParam.getParamType());
			conditiaon.setParamCode(sysParam.getParamCode());
			if(sysParamService.find(conditiaon).size() > 0){
				jsonMessage.error();
				jsonMessage.setMessage("该参数类型下已存在相同的参数代码");
				renderJson(jsonMessage);
				return;
			}
			
			sysParam.setCreateTime(new Date());
			sysParam.setCreateUser(getLoginUser().getUsername());
			sysParamService.save(sysParam);
			jsonMessage.success();
		} catch (Exception e) {
			logger.error("保存描述包出错",e);
			jsonMessage.error();
			jsonMessage.setMessage(e.getMessage());
		}
		renderJson(jsonMessage);
	}

	public void update() {
		JsonMessage jsonMessage = new JsonMessage();
		try {
			SysParam sysParam = getBean(SysParam.class, "object");
			sysParamService.update(sysParam);
			jsonMessage.success();
		} catch (Exception e) {
			jsonMessage.error();
			logger.error("更新描述包出错",e);
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
				sysParamService.deleteById(id);
			}
			jsonMessage.success();
		} catch (Exception e) {
			jsonMessage.error();
			logger.error("删除描述包出错",e);
			jsonMessage.error();
			jsonMessage.setMessage(e.getMessage());
		}
		renderJson(jsonMessage);
	}
	
	
	
}
