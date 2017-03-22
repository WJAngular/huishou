package com.isongshu.huishou.manager.controller;


import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.isongshu.huishou.skeleton.model.SysAdmin;
import com.isongshu.huishou.skeleton.model.SysParam;
import com.isongshu.huishou.manager.interceptor.IsLoginInterceptor;
import com.isongshu.huishou.skeleton.model.OtherJoin;
import com.isongshu.huishou.skeleton.model.OtherJoin;
import com.isongshu.huishou.skeleton.service.CommonService;
import com.isongshu.huishou.skeleton.service.OtherJoinService;
import com.isongshu.huishou.skeleton.service.OtherJoinService;
import com.isongshu.huishou.skeleton.util.JsonMessage;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.spring.Inject;
import com.jfinal.plugin.spring.IocInterceptor;

@Before({ IocInterceptor.class,IsLoginInterceptor.class })
public class OtherJoinController extends _Controller {

	 private static Logger logger = LoggerFactory.getLogger(OtherJoinController.class);
	 
	@Inject.BY_NAME
	private OtherJoinService otherJoinService;
	
	
	public void index() {
		
		OtherJoin otherJoin = getBean(OtherJoin.class, "object");
		Page<OtherJoin> page = otherJoinService.paginate(getParaToInt(0, 1), 10, otherJoin);
		
		setAttr("actionUrl","/otherJoin/");
		setAttr("actionParas",coverToParams(otherJoin, "object"));
		setAttr("object",otherJoin);
		setAttr("objectPage", page);
		
		render("/WEB-INF/jsp/other/join/view.jsp");
	}

	public void toAdd() {
		setAttr("addOrUpdate","add");
		render("/WEB-INF/jsp/other/join/addOrUpdateModal.jsp");
	}

	public void toUpdate() {
		setAttr("object", otherJoinService.findById(getPara("id")));
		setAttr("addOrUpdate","update");
		render("/WEB-INF/jsp/other/join/addOrUpdateModal.jsp");
	}
	
	
	public void add() {
		JsonMessage jsonMessage = new JsonMessage();
		try {
			OtherJoin otherJoin = getBean(OtherJoin.class, "object");
			otherJoin.setCreateTime(new Date());
			otherJoinService.save(otherJoin);
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
			OtherJoin otherJoin = getBean(OtherJoin.class, "object");
			otherJoinService.update(otherJoin);
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
				otherJoinService.deleteById(id);
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
