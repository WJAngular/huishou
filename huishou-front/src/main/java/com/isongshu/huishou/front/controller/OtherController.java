package com.isongshu.huishou.front.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.isongshu.huishou.skeleton.model.OtherBigRecycle;
import com.isongshu.huishou.skeleton.model.OtherJoin;
import com.isongshu.huishou.skeleton.model.OtherNewProduct;
import com.isongshu.huishou.skeleton.service.OtherBigRecycleService;
import com.isongshu.huishou.skeleton.service.OtherJoinService;
import com.isongshu.huishou.skeleton.service.OtherNewProductService;
import com.isongshu.huishou.skeleton.service.PrdProductService;
import com.isongshu.huishou.skeleton.util.JsonMessage;
import com.jfinal.aop.Before;
import com.jfinal.plugin.spring.Inject;
import com.jfinal.plugin.spring.IocInterceptor;

@Before({ IocInterceptor.class })
public class OtherController extends _Controller{

	 private static Logger logger = LoggerFactory.getLogger(OtherController.class);
	 
	 @Inject.BY_NAME
	 private OtherJoinService otherJoinService;
	 
	 @Inject.BY_NAME
	 private OtherBigRecycleService otherBigRecycleService;
	 
	 @Inject.BY_NAME
	 private OtherNewProductService otherNewProductService;
	 
	 
	 
	 public void addJoin(){
		 JsonMessage jsonMessage = new JsonMessage();
			try {
				OtherJoin otherJoin = getBean(OtherJoin.class, "object");
				otherJoin.setCreateTime(new Date());
				otherJoinService.save(otherJoin);
				jsonMessage.success();
			} catch (Exception e) {
				logger.error("保存出错",e);
				jsonMessage.error();
				jsonMessage.setMessage(e.getMessage());
			}
			renderJson(jsonMessage);
	 }
	 
	 
	 public void addBigRecycle(){
		 JsonMessage jsonMessage = new JsonMessage();
			try {
				OtherBigRecycle otherBigRecycle = getBean(OtherBigRecycle.class, "object");
				otherBigRecycle.setCreateTime(new Date());
				otherBigRecycleService.save(otherBigRecycle);
				jsonMessage.success();
			} catch (Exception e) {
				logger.error("保存出错",e);
				jsonMessage.error();
				jsonMessage.setMessage(e.getMessage());
			}
			renderJson(jsonMessage);
	 }
	 
	 public void addNewProduct(){
		 JsonMessage jsonMessage = new JsonMessage();
			try {
				OtherNewProduct otherNewProduct = getBean(OtherNewProduct.class, "object");
				otherNewProduct.setCreateTime(new Date());
				otherNewProductService.save(otherNewProduct);
				jsonMessage.success();
			} catch (Exception e) {
				logger.error("保存出错",e);
				jsonMessage.error();
				jsonMessage.setMessage(e.getMessage());
			}
			renderJson(jsonMessage);
	 }
	 
	 
	 
	 
	 
	 
	 
	 
}
