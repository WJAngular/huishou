package com.isongshu.huishou.manager.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.isongshu.huishou.manager.interceptor.IsLoginInterceptor;
import com.isongshu.huishou.skeleton.model.PrdClazzBrand;
import com.isongshu.huishou.skeleton.model.PrdPackage;
import com.isongshu.huishou.skeleton.model.PrdPackageItem;
import com.isongshu.huishou.skeleton.model.sql.SqlCondition;
import com.isongshu.huishou.skeleton.model.sql.SqlObject;
import com.isongshu.huishou.skeleton.model.sql.SqlOperEnum;
import com.isongshu.huishou.skeleton.service.DbBaseService;
import com.isongshu.huishou.skeleton.service.PrdPackageService;
import com.isongshu.huishou.skeleton.util.JsonMessage;
import com.jfinal.aop.Before;
import com.jfinal.plugin.spring.Inject;
import com.jfinal.plugin.spring.IocInterceptor;

@Before({ IocInterceptor.class,IsLoginInterceptor.class })
public class PrdPackageController extends _Controller{

	
	private static Logger logger = LoggerFactory.getLogger(PrdPackageController.class);
	 
	@Inject.BY_NAME
	private DbBaseService dbBaseService;
	@Inject.BY_NAME
	private PrdPackageService prdPackageService;
	
	public void index() {
		
		PrdPackage prdPackage = getBean(PrdPackage.class, "object");
		
		SqlObject sqlObject = new SqlObject();
		sqlObject.setPageNumber(getParaToInt(0, 1));
		sqlObject.setPageSize(10);
		sqlObject.setK(prdPackage);
		List<SqlCondition> conditions = new ArrayList<SqlCondition>();
		conditions.add(new SqlCondition(prdPackage.getNameColumnName(),SqlOperEnum.LIKE,prdPackage.getName()));
		sqlObject.setConditions(conditions);

		setAttr("actionUrl","/prdPackage/");
		setAttr("actionParas",coverToParams(prdPackage, "object"));
		setAttr("object",prdPackage);
		setAttr("objectPage", dbBaseService.paginate(sqlObject));
		
		render("/WEB-INF/jsp/prd/package/view.jsp");
	}
	
	
	public void toAdd() {
		setAttr("addOrUpdate","add");
		render("/WEB-INF/jsp/prd/package/addOrUpdateModal.jsp");
	}

	public void toUpdate() {
		setAttr("object", dbBaseService.findById(new PrdPackage(),getPara("id")));
		setAttr("addOrUpdate","update");
		render("/WEB-INF/jsp/prd/package/addOrUpdateModal.jsp");
	}
	
	
	
	public void copy() {
		JsonMessage jsonMessage = new JsonMessage();
		try {
			int id = getParaToInt("id");
			prdPackageService.copyDescriptPackage(id);
			jsonMessage.success();
		} catch (Exception e) {
			logger.error("复制出错",e);
			jsonMessage.error();
			jsonMessage.setMessage(e.getMessage());
		}
		renderJson(jsonMessage);
	}
	
	public void add() {
		JsonMessage jsonMessage = new JsonMessage();
		try {
			PrdPackage prdPackage = getBean(PrdPackage.class, "object");
			prdPackage.setCreateTime(new Date());
			dbBaseService.save(prdPackage);
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
			PrdPackage prdPackage = getBean(PrdPackage.class, "object");
			dbBaseService.update(prdPackage);
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
				prdPackageService.deletePckage(Integer.valueOf(id));
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
