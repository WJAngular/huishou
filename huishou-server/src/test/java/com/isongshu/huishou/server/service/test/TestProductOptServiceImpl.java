package com.isongshu.huishou.server.service.test;

import com.isongshu.huishou.server.service.impl.PrdPackageServiceImpl;
import com.isongshu.huishou.skeleton.model.SysAdmin;

public class TestProductOptServiceImpl extends TestDefault{

	/**
	 * 添加描述包
	 */
	public void testAddPackage(){
		SysAdmin ua = new SysAdmin();
		ua.setUsername("test");
		PrdPackageServiceImpl bases = (PrdPackageServiceImpl) ctx.getBean("productOptService");
	}
	
	/**
	 * 复制描述包
	 */
	public void testCopyPackage(){
		SysAdmin ua = new SysAdmin();
		ua.setUsername("test");
		PrdPackageServiceImpl bases = (PrdPackageServiceImpl) ctx.getBean("productOptService");
	}
	
	/**
	 * 删除描述包
	 */
	public void testDeletePckage(){
		PrdPackageServiceImpl bases = (PrdPackageServiceImpl) ctx.getBean("productOptService");
		System.out.println(bases.deletePckage(6));
	}
}
