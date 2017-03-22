package com.isongshu.huishou.manager.controller;


import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.isongshu.huishou.skeleton.model.SysAdmin;
import com.isongshu.huishou.skeleton.model.SysParam;
import com.isongshu.huishou.manager.interceptor.IsLoginInterceptor;
import com.isongshu.huishou.skeleton.model.OtherNewProduct;
import com.isongshu.huishou.skeleton.model.OtherNewProduct;
import com.isongshu.huishou.skeleton.service.CommonService;
import com.isongshu.huishou.skeleton.service.OtherNewProductService;
import com.isongshu.huishou.skeleton.service.OtherNewProductService;
import com.isongshu.huishou.skeleton.util.JsonMessage;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.spring.Inject;
import com.jfinal.plugin.spring.IocInterceptor;

@Before({ IocInterceptor.class,IsLoginInterceptor.class })
public class OtherNewProductController extends _Controller {

	 private static Logger logger = LoggerFactory.getLogger(OtherNewProductController.class);
	 
	@Inject.BY_NAME
	private OtherNewProductService otherNewProductService;
	
	
	public void index() {
		
		OtherNewProduct otherNewProduct = getBean(OtherNewProduct.class, "object");
		Page<OtherNewProduct> page = otherNewProductService.paginate(getParaToInt(0, 1), 10, otherNewProduct);
		
		setAttr("actionUrl","/otherNewProduct/");
		setAttr("actionParas",coverToParams(otherNewProduct, "object"));
		setAttr("object",otherNewProduct);
		setAttr("objectPage", page);
		
		render("/WEB-INF/jsp/other/newproduct/view.jsp");
	}

	public void toAdd() {
		setAttr("addOrUpdate","add");
		render("/WEB-INF/jsp/other/newproduct/addOrUpdateModal.jsp");
	}

	public void toUpdate() {
		setAttr("object", otherNewProductService.findById(getPara("id")));
		setAttr("addOrUpdate","update");
		render("/WEB-INF/jsp/other/newproduct/addOrUpdateModal.jsp");
	}
	
	
	public void add() {
		JsonMessage jsonMessage = new JsonMessage();
		try {
			OtherNewProduct otherNewProduct = getBean(OtherNewProduct.class, "object");
			otherNewProduct.setCreateTime(new Date());
			otherNewProductService.save(otherNewProduct);
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
			OtherNewProduct otherNewProduct = getBean(OtherNewProduct.class, "object");
			otherNewProductService.update(otherNewProduct);
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
				otherNewProductService.deleteById(id);
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
