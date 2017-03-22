package com.isongshu.huishou.server.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.druid.util.StringUtils;
import com.isongshu.huishou.server.config.CFG;
import com.isongshu.huishou.skeleton.model.PrdPackageItem;
import com.isongshu.huishou.skeleton.model.SysParam;
import com.isongshu.huishou.skeleton.service.SysParamService;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Table;
import com.jfinal.plugin.activerecord.TableMapping;
import com.jfinal.plugin.ehcache.CacheKit;

@Service("sysParamService")
public class SysParamServiceImpl implements SysParamService{

	@Resource
	private SysParam sysParamDao;
	@Resource
	private DbBaseServiceImpl dbBaseService;
	

	
	public List<SysParam> getRecycleTradeAddressCity() {
		return sysParamDao.findByCache(CFG.CACHE_NAME_SYSPARAM, CFG.CACHE_KEY_SYSPARAM_RECYCLY_TRADE_ADDRESS_CITY, 
				"select * from sys_param  t where t.paramType = ? and t.status = '1' order by id desc","recycleTradeAddressCity"
				);
	}
	
	public List<SysParam> getPayBankCode() {
		return sysParamDao.findByCache(CFG.CACHE_NAME_SYSPARAM, CFG.CACHE_KEY_SYSPARAM_PAY_BANK_CODE, 
				"select * from sys_param  t where t.paramType = ? and t.status = '1' order by id desc","payBank"
				);
	}
	
	
	public List<SysParam> getOrderStatus() {
		return sysParamDao.findByCache(CFG.CACHE_NAME_SYSPARAM, CFG.CACHE_KEY_SYSPARAM_ORDER_STATUS, 
				"select * from sys_param  t where t.paramType = ? and t.status = '1' order by id desc","orderStatus"
				);
	}
	
	
	public List<SysParam> getExpressAddress() {
		return sysParamDao.findByCache(CFG.CACHE_NAME_SYSPARAM, CFG.CACHE_KEY_SYSPARAM_EXPRESS_ADDRESS, 
				"select * from sys_param  t where t.paramType = ? and t.status = '1' order by id desc","expressAddress"
				);
	}
	
	public List<SysParam> getExpress() {
		return sysParamDao.findByCache(CFG.CACHE_NAME_SYSPARAM, CFG.CACHE_KEY_SYSPARAM_EXPRESS, 
				"select * from sys_param  t where t.paramType = ? and t.status = '1' order by id desc","express"
				);
	}
	
	
	public List<SysParam> getOrderDesc() {
		return sysParamDao.findByCache(CFG.CACHE_NAME_SYSPARAM, CFG.CACHE_KEY_SYSPARAM_ORDER_DESC, 
				"select * from sys_param  t where t.paramType = ? and t.status = '1' order by id desc","orderDesc"
				);
	}
	
	
	public List<SysParam> getNewOrderNotice() {
		return sysParamDao.findByCache(CFG.CACHE_NAME_SYSPARAM, CFG.CACHE_KEY_SYSPARAM_NEW_ORDER_NOTICE, 
				"select * from sys_param  t where t.paramType = ? and t.status = '1' order by id desc","newOrderNotice"
				);
	}
	
	
	
	@Override
	public List<SysParam> find(SysParam sysParam) {
		return dbBaseService.selectObjects(sysParam);
	}

	@Override
	public Page<SysParam> paginate(int pageNumber, int pageSize, SysParam sysParam) {
		List<Object> paramer = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		
		if(sysParam != null){
			
			if(!StringUtils.isEmpty(sysParam.getParamDesc())){
				sql.append(" and p.paramDesc like ? ");
				paramer.add("%"+sysParam.getParamDesc()+"%");
			}
			if(!StringUtils.isEmpty(sysParam.getParamType())){
				sql.append(" and p.paramType = ? ");
				paramer.add(sysParam.getParamType());
			}
			if(!StringUtils.isEmpty(sysParam.getStatus())){
				sql.append(" and p.status = ? ");
				paramer.add(sysParam.getStatus());
			}
		}
		return sysParamDao.paginate(pageNumber, pageSize, "select *", 
				"from sys_param p where p.paramType != 'orderStatus'  "+sql.toString()+" order by p.paramType desc",paramer.toArray());
	
	}

	@Override
	public void update(SysParam sysParam) {
		if (sysParam == null) {
			return;
		}
		sysParam.update();removeCache();
	}

	@Override
	public SysParam save(SysParam sysParam) {
		if (sysParam == null) {
			return null;
		}
		 sysParam.save();removeCache();
		return sysParam;
	}

	@Override
	public SysParam findById(String id) {
		SysParam sysParam = sysParamDao.findById(id);
		return sysParam;
	}

	@Override
	public void deleteById(String id) {
		sysParamDao.deleteById(id);removeCache();
		
	}

	@Override
	public void delete(SysParam sysParam) {
		sysParam.delete();removeCache();
	}

	public void removeCache(){
		CacheKit.removeAll(CFG.CACHE_NAME_SYSPARAM);
	}
}
