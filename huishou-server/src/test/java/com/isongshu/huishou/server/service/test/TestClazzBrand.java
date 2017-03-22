package com.isongshu.huishou.server.service.test;

import java.util.List;

import com.isongshu.huishou.skeleton.model.PrdClazzBrand;
import com.isongshu.huishou.skeleton.model.PrdProduct;
import com.isongshu.huishou.skeleton.service.PrdClazzBrandService;
import com.isongshu.huishou.skeleton.service.PrdProductService;
import com.isongshu.huishou.skeleton.service.SysAdminService;

public class TestClazzBrand  extends TestDefault{

	
	
	
	/**
	 * bean要去spring容器获取
	 */
	public void testQuery(){
		PrdClazzBrandService prdClazzBrandService = (PrdClazzBrandService) ctx.getBean("prdClazzBrandService");
		
		 
		List<PrdClazzBrand> clazzList = prdClazzBrandService.queryAllClazzBrand();
		
		for(PrdClazzBrand clazz : clazzList){
			System.out.println(clazz.getName());
			List<PrdClazzBrand> brandList = clazz.get("brand");
			for(PrdClazzBrand brand : brandList){
				System.out.println(brand.getName());
			}
		}
		
		
	}
	
	
	
	
	/**
	 * bean要去spring容器获取
	 */
	public void testQueryALL(){
		PrdClazzBrandService prdClazzBrandService = (PrdClazzBrandService) ctx.getBean("prdClazzBrandService");
		
		 
		List<PrdClazzBrand> clazzList = prdClazzBrandService.queryAllClazzBrandHotProduct();
		
		for(PrdClazzBrand clazz : clazzList){
			System.out.println(clazz.getName());
			List<PrdClazzBrand> brandList = clazz.get("brand");
			for(PrdClazzBrand brand : brandList){
				System.out.println(brand.getName());
				
				List<PrdProduct> productList = brand.get("product");
				for(PrdProduct product : productList){
					System.out.println(product.getName());
				}
				
			}
		}
		
		List<PrdClazzBrand> clazzList1= prdClazzBrandService.queryAllClazzBrandHotProduct();
		
		for(PrdClazzBrand clazz : clazzList1){
			System.out.println(clazz.getName());
			List<PrdClazzBrand> brandList = clazz.get("brand");
			for(PrdClazzBrand brand : brandList){
				System.out.println(brand.getName());
				
				List<PrdProduct> productList = brand.get("product");
				for(PrdProduct product : productList){
					System.out.println(product.getName());
				}
				
			}
		}
		
		
	}
	
	

	
}
