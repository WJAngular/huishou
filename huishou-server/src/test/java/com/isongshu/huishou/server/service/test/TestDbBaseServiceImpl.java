package com.isongshu.huishou.server.service.test;

import java.util.ArrayList;
import java.util.List;

import com.isongshu.huishou.server.service.impl.PrdPackageServiceImpl;
import com.isongshu.huishou.skeleton.model.PrdClazzBrand;
import com.isongshu.huishou.skeleton.model.PrdPackage;
import com.isongshu.huishou.skeleton.model.PrdPackageItem;
import com.isongshu.huishou.skeleton.model.sql.SqlCondition;
import com.isongshu.huishou.skeleton.model.sql.SqlObject;
import com.isongshu.huishou.skeleton.model.sql.SqlOperEnum;
import com.isongshu.huishou.skeleton.service.DbBaseService;

public class TestDbBaseServiceImpl extends TestDefault{

	/**
	 * 测试添加商品范畴
	 */
	public void testAdd(){
		PrdClazzBrand gt =(PrdClazzBrand) ctx.getBean("PrdClazzBrandDao");
		gt.setPId(1);
		gt.setName("My手机");
		gt.setIsShow("1");
		gt.setCreateUser("system_user");
		
		DbBaseService<PrdClazzBrand> bases = (DbBaseService<PrdClazzBrand>) ctx.getBean("dbBaseService");
		boolean f = bases.addObject(gt);
		System.out.println(f);
	}
	
	/**
	 * 更新商品信息
	 *   如从新绑定描述包，是否显示等信息
	 */
	public void testUpdateObject(){
		PrdClazzBrand gt =(PrdClazzBrand) ctx.getBean("PrdClazzBrandDao");
//		gt.setGoodsNmae("苹果1");
//		gt.setGoodsType("手机");
//		gt.setIsShow("1");
		List<SqlCondition> conditions = new ArrayList<SqlCondition>();
		conditions.add(new SqlCondition(gt.getPIdColumnName(),SqlOperEnum.EQUAL,"0"));
		conditions.add(new SqlCondition(gt.getNameColumnName(),SqlOperEnum.EQUAL,"苹果"));
		conditions.add(new SqlCondition("and","isShow",SqlOperEnum.EQUAL,"1"));
		
		SqlObject<PrdClazzBrand> sqlObject 
				= new SqlObject<PrdClazzBrand>(gt,conditions);

		
		DbBaseService<PrdClazzBrand> bases = (DbBaseService<PrdClazzBrand>) ctx.getBean("dbBaseService");
		PrdClazzBrand gtype = bases.selectObject(sqlObject);
		gtype.setName("苹果1");
		System.out.println("id="+gtype.getId());
		boolean f = bases.updateObject(gtype);
		System.out.println(f);
	}
	
	/**
	 * 删除商品信息
	 */
	public void testDeleteObject(){
		PrdClazzBrand gt =(PrdClazzBrand) ctx.getBean("goodsTypeDao");
		gt.setId(3);
		
		DbBaseService<PrdClazzBrand> bases = (DbBaseService<PrdClazzBrand>) ctx.getBean("dbBaseService");
		
		List<PrdClazzBrand> lists = bases.selectObjects(gt);
		
		for(PrdClazzBrand g : lists)
		       bases.deleteObject(g);
	}
	

	
	
	
	/**
	 * 添加描述项
	 */
//	public void testAddPackageItem(){
//		PrdPackage gt =(PrdPackage) ctx.getBean("PrdPackageDao");
//		gt.set(attr, value)
//		DbBaseService<Object> bases = (DbBaseService<Object>) ctx.getBean("dbBaseService");
//	
//		List<SqlCondition> conditions = new ArrayList<SqlCondition>();
//		conditions.add(new SqlCondition("packageName",SqlOperEnum.EQUAL,"苹果6-plus"));
//		SqlObject<com.isongshu.huishou.skeleton.model.Package> sqlObject 
//				= new SqlObject<com.isongshu.huishou.skeleton.model.Package>(gt,conditions);
//		gt = (com.isongshu.huishou.skeleton.model.Package) bases.selectObject(sqlObject);
//		
//		//1.查询包下所有描述头
//		PackageItem item = new PackageItem();
//		conditions.clear();
//		conditions.add(new SqlCondition("packageId",SqlOperEnum.EQUAL,gt.getId()));
//		
//		/*
//		 * 查询描述头:基本情况,外观等....
//		 */
//		String sql  = "select * from package_item where packageid="+gt.getId()+" and parentId=0";
//		List<Object> items =  bases.selectObjects(sql,item);
//		
//		for(int i = 0;i<items.size();i++){
//			PackageItem item_ = (PackageItem)items.get(i);
//			if(item_!=null && item_.getItemName().equals("基本情况")){
//				System.out.println(item_.toString());
//				//添加package项 -- 2级项目
//				PackageItem pi1 = new PackageItem();
//				pi1.setPackageId(gt.getId());
//				pi1.setDefaultVlaue(0.00f);
//				pi1.setItemName("内存");
//				pi1.setParentId(item_.getId());
//				pi1.setSelOpt("1");
//				bases.addObject(pi1);
//				
//				//添加3级项---内存   16G 32G  64G   128G
//				PackageItem pi2 = new PackageItem();
//				pi2.setPackageId(gt.getId());
//				pi2.setDefaultVlaue(0.15f);
//				pi2.setItemName("16G");
//				pi2.setParentId(pi1.getId());
//				pi2.setSelOpt("1");
//				bases.addObject(pi2);
//			}
//		}
//		
//		
//		
//	}
//	
	
	
	public void testAddPrdPackageItem(){
		PrdPackageItem prdPackageItem = new PrdPackageItem();
		prdPackageItem.setPId(1);
		prdPackageItem.setPackageId(1);
		prdPackageItem.setLevel(1);
		prdPackageItem.setName("1");
		
		DbBaseService<PrdPackageItem> bases = (DbBaseService<PrdPackageItem>) ctx.getBean("dbBaseService");
		bases.addObject(prdPackageItem);
		System.out.println(prdPackageItem.getId());
		System.out.println(prdPackageItem.get("id"));
		
	}
	
	
	
	
	
	/**
	 * 为描述包添加描项目
	 */
	public void testAddItemToPackage(){
//		DescriptPackage gt =(DescriptPackage) ctx.getBean("descriptPackageDao");
//		gt.setPackageName("苹果6-plus");
//		DbBaseService<Object> bases = (DbBaseService<Object>) ctx.getBean("dbBaseService");
//
//		DescriptPackage dp = (DescriptPackage) bases.selectObject(gt);
//		
//		PackageItem pi =(PackageItem) ctx.getBean("packageItemDao");
//		pi.setType("内存");
//		List<Object> lists = bases.selectObjects(pi);
//		for(Object p : lists){
//			PackageItem packages = (PackageItem) p;
//			DescriptItemRelation dr = new DescriptItemRelation();
//			dr.setDescriptPckId(dp.getId());
//			dr.setPackageItemId(packages.getId());
//			bases.addObject(dr);
//		}
	}
	
}
