package com.isongshu.huishou.server.service.test;

import java.util.List;

import com.isongshu.huishou.skeleton.model.SysAdmin;
import com.isongshu.huishou.skeleton.service.SysAdminService;

public class TestDemo  extends TestDefault{

	
	
	
	/**
	 * bean要去spring容器获取
	 */
	public void testUserAdmin(){
		SysAdminService userAdminService = (SysAdminService) ctx.getBean("userAdminService");
		
		SysAdmin sysAdmin = new SysAdmin();
		
		 List<SysAdmin> userAdmins= userAdminService.paginate(1, 10, sysAdmin).getList();
		 
		 for(SysAdmin u : userAdmins){
			 System.out.println(u.getUsername());
		 }
		 
	}
	
	
	/**
	 * bean要去spring容器获取
	 */
	public void testDeleteUserAdmin(){
		SysAdminService userAdminService = (SysAdminService) ctx.getBean("userAdminService");
	}
	
}
