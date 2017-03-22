package com.isongshu.huishou.manager.controller;


import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.isongshu.huishou.skeleton.model.SysAdmin;
import com.isongshu.huishou.skeleton.model.SysParam;
import com.isongshu.huishou.manager.interceptor.IsLoginInterceptor;
import com.isongshu.huishou.skeleton.model.OtherBigRecycle;
import com.isongshu.huishou.skeleton.model.OtherBigRecycle;
import com.isongshu.huishou.skeleton.service.CommonService;
import com.isongshu.huishou.skeleton.service.OtherBigRecycleService;
import com.isongshu.huishou.skeleton.service.OtherBigRecycleService;
import com.isongshu.huishou.skeleton.util.JsonMessage;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.spring.Inject;
import com.jfinal.plugin.spring.IocInterceptor;

@Before({ IocInterceptor.class,IsLoginInterceptor.class })
public class OtherBigRecycleController extends _Controller {

	 private static Logger logger = LoggerFactory.getLogger(OtherBigRecycleController.class);
	 
	@Inject.BY_NAME
	private OtherBigRecycleService otherBigRecycleService;
	
	
	public void index() {
		
		OtherBigRecycle otherBigRecycle = getBean(OtherBigRecycle.class, "object");
		Page<OtherBigRecycle> page = otherBigRecycleService.paginate(getParaToInt(0, 1), 10, otherBigRecycle);
		
		setAttr("actionUrl","/otherBigRecycle/");
		setAttr("actionParas",coverToParams(otherBigRecycle, "object"));
		setAttr("object",otherBigRecycle);
		setAttr("objectPage", page);
		
		render("/WEB-INF/jsp/other/bigrecycle/view.jsp");
	}

	public void toAdd() {
		setAttr("addOrUpdate","add");
		render("/WEB-INF/jsp/other/bigrecycle/addOrUpdateModal.jsp");
	}

	public void toUpdate() {
		setAttr("object", otherBigRecycleService.findById(getPara("id")));
		setAttr("addOrUpdate","update");
		render("/WEB-INF/jsp/other/bigrecycle/addOrUpdateModal.jsp");
	}
	
	
	public void add() {
		JsonMessage jsonMessage = new JsonMessage();
		try {
			OtherBigRecycle otherBigRecycle = getBean(OtherBigRecycle.class, "object");
			otherBigRecycle.setCreateTime(new Date());
			otherBigRecycleService.save(otherBigRecycle);
			jsonMessage.success();
		} catch (Exception e) {
			logger.error("保存用户出错",e);
			jsonMessage.error();
			jsonMessage.setMessage(e.getMessage());
		}
		renderJson(jsonMessage);
	}

	public void update() {
		JsonMessage jsonMessage = new JsonMessage();
		try {
			OtherBigRecycle otherBigRecycle = getBean(OtherBigRecycle.class, "object");
			otherBigRecycleService.update(otherBigRecycle);
			jsonMessage.success();
		} catch (Exception e) {
			jsonMessage.error();
			logger.error("更新出错",e);
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
				otherBigRecycleService.deleteById(id);
			}
			jsonMessage.success();
		} catch (Exception e) {
			jsonMessage.error();
			logger.error("删除出错",e);
			jsonMessage.error();
			jsonMessage.setMessage(e.getMessage());
		}
		renderJson(jsonMessage);
	}
	

	




	
	
}
