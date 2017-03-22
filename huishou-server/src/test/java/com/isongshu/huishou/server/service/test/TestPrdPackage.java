package com.isongshu.huishou.server.service.test;

import java.util.List;

import com.isongshu.huishou.skeleton.model.PrdPackageItem;
import com.isongshu.huishou.skeleton.model.SysAdmin;
import com.isongshu.huishou.skeleton.service.PrdPackageService;

public class TestPrdPackage  extends TestDefault{

	
	public void testCopy(){
		PrdPackageService prdPackageService = (PrdPackageService) ctx.getBean("prdPackageService");
		
		prdPackageService.copyDescriptPackage(1);
		
	}
	
	/**
	 * bean要去spring容器获取
	 */
	public void testQueryPackageItemByPackageId(){
		PrdPackageService prdPackageService = (PrdPackageService) ctx.getBean("prdPackageService");
		
		SysAdmin userAdmin = new SysAdmin();
		
		List<PrdPackageItem> prdPackageItemList = prdPackageService.queryPackageItemByPackageId(1);
		 
		 for(PrdPackageItem prdPackageItem: prdPackageItemList){
			System.out.println(prdPackageItem.getStr("i1Name")+"-"+prdPackageItem.get("i1Id")+"-"+prdPackageItem.getStr("i2Name")+"-"+prdPackageItem.get("i2Id")+"-"+prdPackageItem.getStr("i3Name")+"-"+prdPackageItem.get("i3Id")+":"+prdPackageItem.getBigDecimal("i3Value").toString());
		 }
		 
	}
	
	
	/**
	 * bean要去spring容器获取
	 */
	public void testQueryPackageItemByPackageId2(){
		PrdPackageService prdPackageService = (PrdPackageService) ctx.getBean("prdPackageService");
		
		List<PrdPackageItem> prdPackageItem1List = prdPackageService.queryPackageItemByPackageId_(1);
		
		
		for(PrdPackageItem prdPackageItem1 : prdPackageItem1List){
			System.out.println(prdPackageItem1.getName());
			
			List<PrdPackageItem> prdPackageItem2List = prdPackageItem1.get("packageItem");
			
			for(PrdPackageItem prdPackageItem2 : prdPackageItem2List){
				System.out.println(prdPackageItem2.getName());
				List<PrdPackageItem> prdPackageItem3List = prdPackageItem2.get("packageItem");
				
				for(PrdPackageItem prdPackageItem3 : prdPackageItem3List){
					System.out.println(prdPackageItem3.getName());
				}
				
			}
			System.out.println();
		}
	
	}

}
