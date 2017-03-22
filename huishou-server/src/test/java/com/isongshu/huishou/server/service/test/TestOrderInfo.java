package com.isongshu.huishou.server.service.test;

import java.util.List;

import com.isongshu.huishou.skeleton.model.OrderInfo;
import com.isongshu.huishou.skeleton.model.SysAdmin;
import com.isongshu.huishou.skeleton.service.OrderInfoService;
import com.isongshu.huishou.skeleton.service.SysAdminService;

public class TestOrderInfo  extends TestDefault{

	
	
	
	/**
	 * bean要去spring容器获取
	 */
	public void testFind(){
		OrderInfoService orderInfoService = (OrderInfoService) ctx.getBean("orderInfoService");
		
		
		OrderInfo orderInfoS = orderInfoService.findById("1");
		 
		System.out.println(orderInfoS.getDetail().replace("\r\n", "").trim());
		 
	}
	
	

	
}
