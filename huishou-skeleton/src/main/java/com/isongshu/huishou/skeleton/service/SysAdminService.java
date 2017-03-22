package com.isongshu.huishou.skeleton.service;


import com.isongshu.huishou.skeleton.model.SysAdmin;
import com.jfinal.plugin.activerecord.Page;

public interface SysAdminService extends CommonService<SysAdmin>{
	SysAdmin login(SysAdmin sysAdmin);
}
