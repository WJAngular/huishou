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
public class OrderInfoController extends _Controller{

	
	private static Logger logger = LoggerFactory.getLogger(OrderInfoController.class);
	 
	@Inject.BY_NAME
	private DbBaseService dbBaseService;
	@Inject.BY_NAME
	private OrderInfoService orderInfoService;
	@Inject.BY_NAME
	private SysParamService sysParamService;
	
	public void index() {
		
		
 		OrderInfo orderInfo = getBean(OrderInfo.class, "object");
		
		
		//做代理商权限设置，只能看到自己代理地方的订单
		SysAdmin sysAdmin = getLoginUser();
		if(sysAdmin.getType().equals("2")){
			orderInfo.setRecycleType("facetoface");
			orderInfo.setRecycleTradeAddressCity(sysAdmin.getZone());
		}
		
		
		Page<OrderInfo> page = orderInfoService.paginate(getParaToInt(0, 1), 10, orderInfo);
		setAttr("actionUrl","/orderInfo/");
		setAttr("actionParas",coverToParams(orderInfo, "object"));
		setAttr("object",orderInfo);
		setAttr("objectPage", page);
		
		List<SysParam> recycleTradeAddressCity = sysParamService.getRecycleTradeAddressCity();
		List<SysParam> payBankCode = sysParamService.getPayBankCode();
		List<SysParam> orderStatus = sysParamService.getOrderStatus();
		
		setAttr("recycleTradeAddressCity",recycleTradeAddressCity);
		setAttr("payBankCode",payBankCode);
		setAttr("orderStatus",orderStatus);
		
		
		render("/WEB-INF/jsp/order/info/view.jsp");
	}
	
	
	public void toAdd() {
		setAttr("addOrUpdate","add");
		render("/WEB-INF/jsp/order/info/addOrUpdateModal.jsp");
	}

	public void toUpdate() {
		List<SysParam> recycleTradeAddressCity = sysParamService.getRecycleTradeAddressCity();
		List<SysParam> payBankCode = sysParamService.getPayBankCode();
		List<SysParam> orderStatus = sysParamService.getOrderStatus();
		List<SysParam> orderDesc = sysParamService.getOrderDesc(); 
		List<SysParam> express = sysParamService.getExpress();
		
		
		setAttr("recycleTradeAddressCity",recycleTradeAddressCity);
		setAttr("payBankCode",payBankCode);
		setAttr("orderStatus",orderStatus);
		setAttr("orderDesc",orderDesc);
		setAttr("express",express);
		
		
		OrderInfo orderInfo = orderInfoService.findById(getPara("id"));
		setAttr("object", orderInfo);
		setAttr("addOrUpdate","update");
		render("/WEB-INF/jsp/order/info/addOrUpdateModal.jsp");
	}
	
	
	public void changeStatus(){
		JsonMessage jsonMessage = new JsonMessage();
		try {
			
			OrderInfo orderInfo = new OrderInfo();
			orderInfo.setId(getParaToInt("id"));
			orderInfo.setStatus(getPara("status"));
			orderInfoService.update(orderInfo);
			jsonMessage.success();
		} catch (Exception e) {
			logger.error("更新状态出错",e);
			jsonMessage.error();
			jsonMessage.setMessage(e.getMessage());
		}
		renderJson(jsonMessage);
	}
	
	
	public void add() {
		JsonMessage jsonMessage = new JsonMessage();
		try {
			OrderInfo orderInfo = getBean(OrderInfo.class, "object");
			orderInfo.setCreateTime(new Date());
			orderInfoService.save(orderInfo);
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
			OrderInfo orderInfo = getBean(OrderInfo.class, "object");
			orderInfoService.update(orderInfo);
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
				orderInfoService.deleteById(id);
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
