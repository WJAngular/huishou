package com.isongshu.huishou.server.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.isongshu.huishou.server.config.CFG;
import com.isongshu.huishou.skeleton.model.PrdPackage;
import com.isongshu.huishou.skeleton.model.PrdPackageItem;
import com.isongshu.huishou.skeleton.model.SysAdmin;
import com.isongshu.huishou.skeleton.model.sql.SqlCondition;
import com.isongshu.huishou.skeleton.model.sql.SqlObject;
import com.isongshu.huishou.skeleton.model.sql.SqlOperEnum;
import com.isongshu.huishou.skeleton.service.DbBaseService;
import com.isongshu.huishou.skeleton.service.PrdPackageService;
import com.isongshu.huishou.skeleton.util.DateUtil;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Config;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.DbKit;
import com.jfinal.plugin.activerecord.IAtom;
import com.jfinal.plugin.ehcache.CacheKit;

import ch.qos.logback.core.db.dialect.DBUtil;

@Service("prdPackageService")
public class PrdPackageServiceImpl<K extends Object> implements PrdPackageService {
	private static Logger log = LoggerFactory.getLogger(PrdPackageServiceImpl.class);
	@Resource
	private DbBaseService<Object> dbBaseService;
	
	@Resource
	private PrdPackage prdPackageDao;
	@Resource
	private PrdPackageItem prdPackageItemDao;
	
	
	//查询所有的描述包
	public List<PrdPackage> queryAll() {
		List<PrdPackage> prdPackageList = prdPackageDao.findByCache(CFG.CACHE_PACKAGE,CFG.CACHE_PACKAGE,"select * from prd_package");
		return prdPackageList;
	}
	
	
	//按行显示
	public List<PrdPackageItem> queryPackageItemByPackageId(int prdPackageId){
		
			List<PrdPackageItem>  prdPackageItemList = prdPackageItemDao.findByCache(
					CFG.CACHE_NAME_PACKAGE_ITEMS, 
					CFG.CACHE_KEY_PACKAGE_ITEMS_BY_ROW + prdPackageId,
					"select i1.name as i1Name ,i1.id as i1Id ,"
						 + "i2.name as i2Name,i2.id as i2Id,"
						 + "i3.name as i3Name,i3.id as i3Id,i3.value as i3Value "+
					" from prd_package_item i1,prd_package_item i2,prd_package_item i3	"+
					" where i1.id = i2.pId and i2.id = i3.pId and	"+
					 " i1.packageId = ? and i2.packageId = ? and i3.packageId = ?;",prdPackageId,prdPackageId,prdPackageId);
			 
		return prdPackageItemList;
	}
	
	//按树显示
	public List<PrdPackageItem> queryPackageItemByPackageId_(int prdPackageId){
		
		
		List<PrdPackageItem> prdPackageItem1List = CacheKit.get(CFG.CACHE_NAME_PACKAGE_ITEMS, CFG.CACHE_KEY_PACKAGE_ITEMS_BY_TREE + prdPackageId);
		
		
		//查询1级属性
		if(prdPackageItem1List == null){
			prdPackageItem1List = prdPackageItemDao.find("select * from prd_package_item ppi where ppi.packageId = ? and ppi.pId = ? order by ppi.seq desc",prdPackageId,0);
			
			//查询2级属性
			 for(PrdPackageItem prdPackageItem1 : prdPackageItem1List){
				 	
				 List<PrdPackageItem> prdPackageItem2List = prdPackageItemDao.find("select * from prd_package_item ppi where ppi.packageId = ? "
							+ " and ppi.pId = ? order by ppi.seq desc", prdPackageId,prdPackageItem1.getId());
				 prdPackageItem1.put("packageItem",prdPackageItem2List);
				 
				 
				//查询3级属性
				 for(PrdPackageItem prdPackageItem2 : prdPackageItem2List){
					 
					 List<PrdPackageItem> prdPackageItem3List = prdPackageItemDao.find("select * from prd_package_item ppi where ppi.packageId = ? "
								+ " and ppi.pId = ? order by ppi.seq desc", prdPackageId,prdPackageItem2.getId());
					 prdPackageItem2.put("packageItem",prdPackageItem3List);
				 }
				 
			 }
			 
			 CacheKit.put(CFG.CACHE_NAME_PACKAGE_ITEMS, CFG.CACHE_KEY_PACKAGE_ITEMS_BY_TREE + prdPackageId, prdPackageItem1List);
		}
		return prdPackageItem1List;
	}
	
	

	@Before(com.jfinal.plugin.activerecord.tx.Tx.class)
	public void copyDescriptPackage(final int fromPackageId) {
		final DbBaseService<Object> dbBaseService_ = this.dbBaseService;
		try {
			boolean f = Db.tx(new IAtom() {
				@Override
				public boolean run()  {

					try {
						
						//源包
						PrdPackage fromPackage = prdPackageDao.findById(fromPackageId);
						
						// 创建新的描述包
						PrdPackage newpackages = new PrdPackage();
						newpackages.setName(fromPackage.getName()+"_复制");
						newpackages.setCreateTime(new Date());
						newpackages.setRemark(" ");
						newpackages.save();
						
						
						
						Db.update("INSERT INTO prd_package_item(packageId,id,pId,name,value,level,selOpt,seq,createTime) "+
								  "select ?,id,pId,name,value,level,selOpt,seq,NOW() from prd_package_item where packageId=?",newpackages.getId(),fromPackage.getId());
						
						CacheKit.removeAll(CFG.CACHE_NAME_PACKAGE_ITEMS);
						
						return true;
					} catch (Exception e) {
						log.error("复制描述包{},出错",fromPackageId,e);
						return false;
					}
				}
			});
		} catch (Exception e) {
			log.error("复制描述包{},出错",fromPackageId,e);
		}
	}

	/**
	 * 删除描述包
	 */
	@Override
	public String deletePckage(final int packageId) {
		final DbBaseService<Object> dbBaseService_ = this.dbBaseService;

		boolean f = Db.tx(new IAtom() {

			@Override
			public boolean run() throws SQLException {
				try {
					PrdPackage pk = new PrdPackage();
					// 1.查询描述包
					List<SqlCondition> conditions = new ArrayList<SqlCondition>();
					conditions.add(new SqlCondition(pk.getIdColumnName(), SqlOperEnum.EQUAL, packageId));
					SqlObject<PrdPackage> sqlObject = new SqlObject<PrdPackage>(pk, conditions);

					pk = (PrdPackage) dbBaseService_.selectObject(sqlObject);

					if (pk == null) {
						throw new SQLException("无法删除描述包," + packageId + ":不存在");
					}

					// 2.删除所有描述项目
					String deleteItems = "delete from prd_package_item where packageId=" + packageId;
					dbBaseService_.deleteSql(deleteItems, new PrdPackageItem());

					
					CacheKit.removeAll(CFG.CACHE_NAME_PACKAGE_ITEMS);
					
					pk.delete();
					return true;
				} catch (Exception e) {
					e.printStackTrace();
					log.error("删除描述包出错",e);
					return false;
				}
			}

		});

		return "0000";
	}

	

}
