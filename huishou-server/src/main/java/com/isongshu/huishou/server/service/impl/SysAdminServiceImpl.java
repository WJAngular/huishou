package com.isongshu.huishou.server.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.alibaba.druid.util.StringUtils;
import com.isongshu.huishou.skeleton.model.SysAdmin;
import com.isongshu.huishou.skeleton.service.CommonService;
import com.isongshu.huishou.skeleton.service.SysAdminService;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@Service("sysAdminService")
public class SysAdminServiceImpl implements SysAdminService {
	
	private static Logger log = Logger.getLogger(SysAdminServiceImpl.class);
	@Resource
	private SysAdmin sysAdminDao;
	@Resource
	private DbBaseServiceImpl dbBaseService;
	
	public SysAdmin login(SysAdmin sysAdmin){
		log.warn("后台正在登录验证中.....");
		return sysAdminDao.findFirst("select * from sys_admin t where t.username = ? and t.password = ?",sysAdmin.getUsername(),sysAdmin.getPassword());
	}
	
	
	public Page<SysAdmin> paginate(int pageNumber, int pageSize,SysAdmin sysAdmin) {
		
		List<Object> paramer = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		
		if(sysAdmin != null){
			if(!StringUtils.isEmpty(sysAdmin.getUsername())){
				sql.append(" and u.username like ? ");
				paramer.add("%"+sysAdmin.getUsername()+"%");
			}
			
			if(!StringUtils.isEmpty(sysAdmin.getStatus())){
				sql.append(" and u.status = ? ");
				paramer.add(sysAdmin.getStatus());
			}
			
			if(!StringUtils.isEmpty(sysAdmin.getType())){
				sql.append(" and u.type = ? ");
				paramer.add(sysAdmin.getType());
			}
			
			if(!StringUtils.isEmpty(sysAdmin.getZone())){
				sql.append(" and u.zone = ? ");
				paramer.add(sysAdmin.getZone());
			}
			
		}
		
		return sysAdminDao.paginate(pageNumber, pageSize, "select *", "from sys_admin u where 1=1 "+sql.toString()+" order by id desc",paramer.toArray());
	}

	public void update(SysAdmin sysAdmin) {
		if (sysAdmin == null) {
			return;
		}
		sysAdmin.update();
	}

	public SysAdmin save(SysAdmin sysAdmin) {
		if (sysAdmin == null) {
			return null;
		}
		sysAdmin.save();
		return sysAdmin;
	}

	public SysAdmin findById(String id) {
		SysAdmin sysAdmin = sysAdminDao.findById(id);
		return sysAdmin;
	}

	public void deleteById(String id) {
		sysAdminDao.deleteById(id);
	}

	@Override
	public List<SysAdmin> find(SysAdmin sysAdmin) {
		return dbBaseService.selectObjects(sysAdmin);
	}

	@Override
	public void delete(SysAdmin t) {
		// TODO Auto-generated method stub
		
	}

	
}
