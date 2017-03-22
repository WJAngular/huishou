package com.isongshu.huishou.skeleton.service;


import java.util.List;

import com.isongshu.huishou.skeleton.model.OrderInfo;
import com.isongshu.huishou.skeleton.model.PrdClazzBrand;
import com.isongshu.huishou.skeleton.model.SysParam;
import com.jfinal.plugin.activerecord.Page;

public interface SysParamService extends CommonService<SysParam>{
	
	List<SysParam> getRecycleTradeAddressCity();
	 
	List<SysParam> getPayBankCode();
	
	List<SysParam> getOrderStatus();
	
	List<SysParam> getExpressAddress() ;
	 
	List<SysParam> getExpress();
	
	List<SysParam> getOrderDesc();
	
	List<SysParam> getNewOrderNotice();
}
