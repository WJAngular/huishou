package com.isongshu.huishou.server.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.druid.util.StringUtils;
import com.isongshu.huishou.server.config.CFG;
import com.isongshu.huishou.skeleton.model.PrdPackageItem;
import com.isongshu.huishou.skeleton.model.PrdProduct;
import com.isongshu.huishou.skeleton.service.PrdPackageItemService;
import com.isongshu.huishou.skeleton.service.PrdProductService;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Table;
import com.jfinal.plugin.activerecord.TableMapping;
import com.jfinal.plugin.ehcache.CacheKit;

@Service("prdPackageItemService")
public class PrdPackageItemServiceImpl implements PrdPackageItemService {
	
	@Resource
	private PrdPackageItem prdPackageItemDao;
	@Resource
	private DbBaseServiceImpl dbBaseService;
	
	
	public void removeCache(){
		CacheKit.removeAll(CFG.CACHE_NAME_PACKAGE_ITEMS);
	}
	
	public void update(PrdPackageItem prdPackageItem) {
		if (prdPackageItem == null) {
			return;
		}
		prdPackageItem.update();
		removeCache();
	}

	public PrdPackageItem save(PrdPackageItem prdPackageItem) {
		if (prdPackageItem == null) {
			return null;
		}
		prdPackageItem.save();
		removeCache();
		return prdPackageItem;
	}

	public PrdPackageItem findByIds(Object... ids) {
		PrdPackageItem prdPackageItem = prdPackageItemDao.findById(ids);
		return prdPackageItem;
	}

	
	public PrdPackageItem findById(String id) {
		PrdPackageItem prdPackageItem = prdPackageItemDao.findById(id);
		return prdPackageItem;
	}


	public void deleteById(String id) {
		prdPackageItemDao.deleteById(id);
		removeCache();
	}
	
	public void delete(PrdPackageItem prdPackageItem) {
		prdPackageItem.delete();
		removeCache();
	}
	
	public List<PrdPackageItem> find(PrdPackageItem prdPackageItem){
		
		List<Object> paramer = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		
		if(prdPackageItem != null){
			if(prdPackageItem.getPackageId() != null){
				sql.append(" and t.packageId =? ");
				paramer.add(prdPackageItem.getPackageId());
			}
			
			if(prdPackageItem.getPId() != null){
				sql.append(" and t.pId =? ");
				paramer.add(prdPackageItem.getPId());
			}
		}
		
		
		return prdPackageItemDao.findByCache(
				CFG.CACHE_NAME_PACKAGE_ITEMS,
				CFG.CACHE_KEY_PACKAGE_ITEMS_BY_PACKAGEID+":"+prdPackageItem.getPackageId()+":"+prdPackageItem.getPId(),
				"select * from prd_package_item t where 1=1 " + sql.toString() +" order by t.seq desc",
				paramer.toArray()
				);
		
		
//		return prdPackageItemDao.find(
//				"select * from prd_package_item t where 1=1 " + sql.toString() +" order by t.seq desc",
//				paramer.toArray()
//				);
	}

	@Override
	public Page<PrdPackageItem> paginate(int pageNumber, int pageSize, PrdPackageItem t) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	//拖曳顺序控制
	public void nextAction(PrdPackageItem targetPrdPackageItem,PrdPackageItem currentPrdPackageItem){
		Db.update("update prd_package_item t set seq = seq - 1 where t.packageId = ? and t.pId = ? and t.seq < ?",targetPrdPackageItem.getPackageId(),targetPrdPackageItem.getPId(),targetPrdPackageItem.getSeq());
		removeCache();
	}
	
	
	//拖曳顺序控制
	public void prevAction(PrdPackageItem targetPrdPackageItem,PrdPackageItem currentPrdPackageItem){
		Db.update("update prd_package_item t set seq = seq + 1 where t.packageId = ? and t.pId = ? and t.seq > ?",targetPrdPackageItem.getPackageId(),targetPrdPackageItem.getPId(),targetPrdPackageItem.getSeq());
		removeCache();
	}
	
	
	//删除子配置项
	public void deleteChildren(PrdPackageItem prdPackageItem){
		
		
		PrdPackageItem prdPackageItemCondition = new PrdPackageItem();
	    prdPackageItemCondition.setPackageId(prdPackageItem.getPackageId());
	    prdPackageItemCondition.setPId(prdPackageItem.getId());
	    
	    //第二级别
	    List<PrdPackageItem> prdPackageItemList = prdPackageItemDao.find("select * from prd_package_item t where t.packageId = ? and t.pId = ?",prdPackageItem.getPackageId(),prdPackageItem.getId());
	    List<Integer> pids = new ArrayList<Integer>();
	    if(prdPackageItemList != null && prdPackageItemList.size() > 0){
	    	for(PrdPackageItem p : prdPackageItemList){
	    		pids.add(p.getId());
	    		p.delete();
	    	}
	    }
	    
		for(int pid: pids){
			Db.update("delete from prd_package_item where packageId = ? and pId = ?",prdPackageItem.getPackageId(),pid);
		}
		
		removeCache();
	}
	
	
	
	
}
