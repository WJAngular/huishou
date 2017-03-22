package com.isongshu.huishou.manager.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.isongshu.huishou.manager.interceptor.IsLoginInterceptor;
import com.isongshu.huishou.skeleton.model.PrdClazzBrand;
import com.isongshu.huishou.skeleton.model.PrdPackage;
import com.isongshu.huishou.skeleton.model.PrdProduct;
import com.isongshu.huishou.skeleton.model.sql.SqlCondition;
import com.isongshu.huishou.skeleton.model.sql.SqlObject;
import com.isongshu.huishou.skeleton.model.sql.SqlOperEnum;
import com.isongshu.huishou.skeleton.service.DbBaseService;
import com.isongshu.huishou.skeleton.service.PrdClazzBrandService;
import com.isongshu.huishou.skeleton.service.PrdPackageService;
import com.isongshu.huishou.skeleton.service.PrdProductService;
import com.isongshu.huishou.skeleton.util.JsonMessage;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.spring.Inject;
import com.jfinal.plugin.spring.IocInterceptor;

@Before({ IocInterceptor.class,IsLoginInterceptor.class })
public class PrdProductController extends _Controller{

	private static Logger logger = LoggerFactory.getLogger(PrdProductController.class);
	 
	@Inject.BY_NAME
	private PrdProductService prdProductService;
	@Inject.BY_NAME
	private PrdClazzBrandService prdClazzBrandService;
	@Inject.BY_NAME
	private PrdPackageService prdPackageService;
	
	
	public void index() {
		PrdProduct prdProduct = getBean(PrdProduct.class, "object");
		Page<PrdProduct> page = prdProductService.paginate(getParaToInt(0, 1), 10, prdProduct);
		setAttr("actionUrl","/prdProduct/");
		setAttr("actionParas",coverToParams(prdProduct, "object"));
		setAttr("object",prdProduct);
		setAttr("objectPage", page);
		setAttr("clazzBrand",prdClazzBrandService.queryAllClazzBrand());
		setAttr("prdPackage",prdPackageService.queryAll());
		render("/WEB-INF/jsp/prd/product/view.jsp");
	}
	
	public void toAdd() {
		setAttr("addOrUpdate","add");
		setAttr("clazzBrand",prdClazzBrandService.queryAllClazzBrand());
		setAttr("prdPackage",prdPackageService.queryAll());
		render("/WEB-INF/jsp/prd/product/addOrUpdateModal.jsp");
	}

	public void toUpdate() {
		
		PrdProduct prdProduct = prdProductService.findById(getPara("id"));
		logger.info("需要编辑的产品{}",prdProduct.toString());
		setAttr("object", prdProduct);
		setAttr("clazzBrand",prdClazzBrandService.queryAllClazzBrand());
		setAttr("prdPackage",prdPackageService.queryAll());
		setAttr("addOrUpdate","update");
		render("/WEB-INF/jsp/prd/product/addOrUpdateModal.jsp");
	}
	
	
	public void queryPackageItemByPackageId(){
		JsonMessage jsonMessage = new JsonMessage();
		try {
			jsonMessage.setData(prdPackageService.queryPackageItemByPackageId(getParaToInt("id")));
			jsonMessage.success();
		} catch (Exception e) {
			logger.error("查询出错",e);
			jsonMessage.error();
			jsonMessage.setMessage(e.getMessage());
		}
		renderJson(jsonMessage);
	}
	
	
	
	public void add() {
		JsonMessage jsonMessage = new JsonMessage();
		try {
			PrdProduct prdProduct = getBean(PrdProduct.class, "object");
			logger.info("新增产品{}",prdProduct.toString());
			prdProduct.setCreateTime(new Date());
			prdProductService.save(prdProduct);
			jsonMessage.success();
		} catch (Exception e) {
			logger.error("保存产品出错",e);
			jsonMessage.error();
			jsonMessage.setMessage(e.getMessage());
		}
		renderJson(jsonMessage);
	}

	
	public void updateBasePrice() {
		JsonMessage jsonMessage = new JsonMessage();
		try {
			int id = getParaToInt("id");
			int basePrice = getParaToInt("basePrice");
			PrdProduct prdProduct = new PrdProduct();
			prdProduct.setId(id);
			prdProduct.setBasePrice(basePrice);
			prdProductService.update(prdProduct);
			jsonMessage.success();
		} catch (Exception e) {
			jsonMessage.error();
			logger.error("更新价格出错",e);
			jsonMessage.error();
			jsonMessage.setMessage(e.getMessage());
		}
		renderJson(jsonMessage);
	}
	
	
	public void update() {
		JsonMessage jsonMessage = new JsonMessage();
		try {
			PrdProduct prdProduct = getBean(PrdProduct.class, "object");
			if(prdProduct.getIsHot() == null || prdProduct.getIsHot().isEmpty()){
				prdProduct.setIsHot("N");
			}
			prdProductService.update(prdProduct);
			jsonMessage.success();
		} catch (Exception e) {
			jsonMessage.error();
			logger.error("更新产品出错",e);
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
				prdProductService.deleteById(id);
			}
			jsonMessage.success();
		} catch (Exception e) {
			jsonMessage.error();
			logger.error("删除产品出错",e);
			jsonMessage.error();
			jsonMessage.setMessage(e.getMessage());
		}
		renderJson(jsonMessage);
	}
	
	
	
}
