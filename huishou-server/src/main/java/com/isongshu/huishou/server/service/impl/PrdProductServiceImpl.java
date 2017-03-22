package com.isongshu.huishou.server.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.druid.util.StringUtils;
import com.isongshu.huishou.server.config.CFG;
import com.isongshu.huishou.skeleton.model.PrdProduct;
import com.isongshu.huishou.skeleton.service.PrdProductService;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;

@Service("prdProductService")
public class PrdProductServiceImpl implements PrdProductService {
	
	@Resource
	private PrdProduct prdProductDao;
	
	
	//分页查找
	public Page<PrdProduct> paginate(int pageNumber, int pageSize,PrdProduct prdProduct) {
		
		List<Object> paramer = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		
		if(prdProduct != null){
			if(!StringUtils.isEmpty(prdProduct.getName())){
				sql.append(" and p1.name like ? ");
				paramer.add("%"+prdProduct.getName()+"%");
			}
			
			if(prdProduct.getClazzId() != null){
				sql.append(" and p1.clazzId = ? ");
				paramer.add(prdProduct.getClazzId());
			}
			
			if(prdProduct.getBrandId() != null){
				sql.append(" and p1.brandId = ? ");
				paramer.add(prdProduct.getBrandId());
			}
			
			if(!StringUtils.isEmpty(prdProduct.getIsHot())){
				sql.append(" and p1.isHot = ? ");
				paramer.add(prdProduct.getIsHot());
			}
			
			if(prdProduct.getPrdPackageId() != null){
				sql.append(" and p1.prdPackageId = ? ");
				paramer.add(prdProduct.getPrdPackageId());
			}
			
		}
		
		return prdProductDao.paginate(pageNumber, pageSize, "select p1.*,"
														+ "(select name from prd_clazz_brand p2 where p1.clazzId = p2.id ) as clazzName,"
														+ "(select name from prd_clazz_brand p2 where p1.brandId = p2.id ) as brandName,"
														+ "(select name from prd_package p2 where p1.prdPackageId = p2.id ) as packageName", 
									"from prd_product p1 where 1=1 "+sql.toString()+" order by id desc",paramer.toArray());
	}

	
	//非分页查找,前期满足移动端
	public List<PrdProduct> find(PrdProduct prdProduct) {
		
		List<Object> paramer = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		
		if(prdProduct != null){
			if(!StringUtils.isEmpty(prdProduct.getName())){
				sql.append(" and p1.name like ? ");
				paramer.add("%"+prdProduct.getName()+"%");
			}
			
			if(prdProduct.getClazzId() != null){
				sql.append(" and p1.clazzId = ? ");
				paramer.add(prdProduct.getClazzId());
			}
			
			if(prdProduct.getBrandId() != null){
				sql.append(" and p1.brandId = ? ");
				paramer.add(prdProduct.getBrandId());
			}
			
			if(!StringUtils.isEmpty(prdProduct.getIsHot())){
				sql.append(" and p1.isHot = ? ");
				paramer.add(prdProduct.getIsHot());
			}
			
			if(prdProduct.getPrdPackageId() != null){
				sql.append(" and p1.prdPackageId = ? ");
				paramer.add(prdProduct.getPrdPackageId());
			}
			
		}
		
		return prdProductDao.find(
				 			   "select p1.*,"
				 			+ "(select name from prd_clazz_brand p2 where p1.clazzId = p2.id ) as clazzName,"
							+ "(select name from prd_clazz_brand p2 where p1.brandId = p2.id ) as brandName,"
							+ "(select name from prd_package p2 where p1.prdPackageId = p2.id ) as packageName "
							+ "from prd_product p1 where 1=1 "+sql.toString()+" order by id desc",paramer.toArray());
		
	}
	
	
	
	
	
	//首页分类，查询热门产品
	public List<PrdProduct> findHotProductByClazzBrand(PrdProduct prdProduct){
		
		List<Object> paramer = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		
		if(prdProduct != null){
			if(prdProduct.getBrandId() != null){
				sql.append(" and p1.brandId = ? ");
				paramer.add(prdProduct.getBrandId());
			}
			if(prdProduct.getClazzId() != null){
				sql.append(" and p1.clazzId = ? ");
				paramer.add(prdProduct.getClazzId());
			}
		}
		
		
		return prdProductDao.findByCache(CFG.CACHE_HOT_PRODUCT,
				CFG.CACHE_HOT_PRODUCT+":"+prdProduct.getBrandId()+":"+prdProduct.getClazzId(),
				"select * from prd_product p1 where p1.isHot = 'Y' "+sql.toString()+" order by id desc",paramer.toArray());
	}
	
	
	
	public void update(PrdProduct prdProduct) {
		if (prdProduct == null) {
			return;
		}
		prdProduct.update();
		CacheKit.removeAll(CFG.CACHE_INDEX);
		CacheKit.removeAll(CFG.CACHE_HOT_PRODUCT);
		CacheKit.remove(CFG.CACHE_NAME_PRODUCT,CFG.CACHE_KEY_PRODUCT+":"+prdProduct.getId());
	}

	public PrdProduct save(PrdProduct prdProduct) {
		if (prdProduct == null) {
			return null;
		}
		prdProduct.save();
		CacheKit.removeAll(CFG.CACHE_INDEX);
		CacheKit.removeAll(CFG.CACHE_HOT_PRODUCT);
		return prdProduct;
	}

	public PrdProduct findById(String id) {
		PrdProduct prdProduct = prdProductDao.findByCache(CFG.CACHE_NAME_PRODUCT,CFG.CACHE_KEY_PRODUCT+":"+id,
				"select * from prd_product p1 where p1.id = ? ",id).get(0);
		return prdProduct;
	}

	public void deleteById(String id) {
		prdProductDao.deleteById(id);
		CacheKit.removeAll(CFG.CACHE_INDEX);
		CacheKit.removeAll(CFG.CACHE_HOT_PRODUCT);
		CacheKit.remove(CFG.CACHE_NAME_PRODUCT,CFG.CACHE_KEY_PRODUCT+":"+id);
	}




	@Override
	public void delete(PrdProduct t) {
		
	}
	
}
