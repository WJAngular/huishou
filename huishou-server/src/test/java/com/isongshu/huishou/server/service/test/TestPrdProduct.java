package com.isongshu.huishou.server.service.test;

import java.util.List;

import com.isongshu.huishou.skeleton.model.PrdProduct;
import com.isongshu.huishou.skeleton.service.PrdProductService;
import com.isongshu.huishou.skeleton.service.SysAdminService;

public class TestPrdProduct  extends TestDefault{

	
	
	
	/**
	 * bean要去spring容器获取
	 */
	public void testUserAdmin(){
		PrdProductService prdProductService = (PrdProductService) ctx.getBean("prdProductService");
		
		PrdProduct prdProduct = new PrdProduct();
		
		List<PrdProduct> prdProductList = prdProductService.paginate(1, 10, prdProduct).getList();
		for(PrdProduct p : prdProductList){
			System.out.println(p.toString()+":"+p.getStr("clazz_name")+":"+p.getStr("brand_name"));
		}
		
		 
	}
	
	
	/**
	 * bean要去spring容器获取
	 */
	public void testFindHot(){
		PrdProductService prdProductService = (PrdProductService) ctx.getBean("prdProductService");
		
		PrdProduct prdProduct = new PrdProduct();
		
		List<PrdProduct> prdProductList = prdProductService.findHotProductByClazzBrand(prdProduct);
		for(PrdProduct p : prdProductList){
			System.out.println(p.toString()+":"+p.getStr("clazz_name")+":"+p.getStr("brand_name"));
		}
		
		 
	}
	
	
	
	
	/**
	 * bean要去spring容器获取
	 */
	public void testDeleteUserAdmin(){
		SysAdminService userAdminService = (SysAdminService) ctx.getBean("userAdminService");
	}
	
}
