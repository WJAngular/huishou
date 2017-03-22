package com.isongshu.huishou.server.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.isongshu.huishou.server.config.CFG;
import com.isongshu.huishou.skeleton.model.PrdClazzBrand;
import com.isongshu.huishou.skeleton.model.PrdProduct;
import com.isongshu.huishou.skeleton.service.PrdClazzBrandService;
import com.isongshu.huishou.skeleton.service.PrdProductService;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;

@Service("prdClazzBrandService")
public class PrdClazzBrandServiceImpl implements  PrdClazzBrandService{
	
	@Resource
	private PrdClazzBrand prdClazzBrandDao;
	@Resource
	private PrdProduct prdProductDao;
	@Resource
	private DbBaseServiceImpl dbBaseService;
	@Resource
	private PrdProductService prdProductService;
	
	/**
	 * 查找所有的类别和品牌(首页分类,后台产品管理)
	 */
	public List<PrdClazzBrand> queryAllClazzBrand(){
		
		//查找类别
		 List<PrdClazzBrand> clazzList = prdClazzBrandDao.findByCache(CFG.CACHE_NAME_CLAZZ_BRAND, CFG.CACHE_KEY_CLAZZ+"_","select * from prd_clazz_brand pcb where pcb.pId = 0 order by id asc");
		
		//查找品牌
		for(PrdClazzBrand p : clazzList){
			
			List<PrdClazzBrand> brandList = prdClazzBrandDao.findByCache(CFG.CACHE_NAME_CLAZZ_BRAND, CFG.CACHE_KEY_BRAND+"_"+p.getId(),"select * from prd_clazz_brand pcb where pcb.pId = ? order by id asc",p.getId());
			p.put("brand", brandList);
		}
		return clazzList;
	}
	
	/**
	 * 查找所有的类别和品牌，以及热门产品 (用于首页显示)
	 */
	public List<PrdClazzBrand> queryAllClazzBrandHotProduct(){
		
		
		List<PrdClazzBrand> indexList = CacheKit.get(CFG.CACHE_INDEX, CFG.CACHE_INDEX);
		
		if(indexList == null){
			
			//查找类别
			indexList = prdClazzBrandDao.find("select * from prd_clazz_brand pcb where pcb.pId = 0 order by id asc");
			
			//查找品牌
			for(PrdClazzBrand p : indexList){
	
				//查询某个类别下的所有热门产品
				List<PrdProduct>  hotProductListByClazz = prdProductDao.find("select * from prd_product pp where pp.isHot = 'Y' and pp.clazzId = ? order by id asc",p.getId());
				
				//查询某个类别下所有品牌
				List<PrdClazzBrand> brandList = prdClazzBrandDao.find("select * from prd_clazz_brand pcb where pcb.pId = ? order by id asc",p.getId());
				
				//新增一个热销品牌，涵盖某个类别下的所有热门产品
				boolean isHotSellExist = false;
				for(PrdClazzBrand pcb:brandList){
					if(pcb.getId() == -1){
						isHotSellExist = true;
					}
				}
				if(!isHotSellExist){
					PrdClazzBrand brand = new PrdClazzBrand();
					brand.setId(-1);
					brand.setName("热门");
					brand.put("product",hotProductListByClazz);
					brandList.add(0, brand);
				}
	
				
				//查找品牌下面的热门产品
				for(PrdClazzBrand b : brandList){
						if(b.getId() == -1) continue;
						List<PrdProduct>  productList = prdProductDao.find("select * from prd_product pp where pp.isHot = 'Y' and pp.brandId = ? order by id asc",b.getId());
						b.put("product",productList);
				}
				
				p.put("brand", brandList);
			}
			
			CacheKit.put(CFG.CACHE_INDEX, CFG.CACHE_INDEX,indexList);
		}
		return indexList;
	}

	
	
	
//	/**
//	 * 查找所有的类别和品牌，以及热门产品 (用于首页显示)
//	 */
//	public List<PrdClazzBrand> queryAllClazzBrandHotProduct(){
//		
//		//查找类别
//		List<PrdClazzBrand> clazzList = prdClazzBrandDao.findByCache(CFG.CACHE_NAME_CLAZZ_BRAND, CFG.CACHE_KEY_CLAZZ,"select * from prd_clazz_brand pcb where pcb.pId = 0 order by id asc");
//		
//		//查找品牌
//		for(PrdClazzBrand p : clazzList){
//
//			//查询某个类别下的所有热门产品
//			PrdProduct prdProductCondition = new PrdProduct();
//			prdProductCondition.setClazzId(p.getId());
//			List<PrdProduct> hotProductListByClazz = prdProductService.findHotProductByClazzBrand(prdProductCondition);
//			
//			
//			List<PrdClazzBrand> brandList = prdClazzBrandDao.findByCache(CFG.CACHE_NAME_CLAZZ_BRAND, CFG.CACHE_KEY_BRAND+p.getId(),"select * from prd_clazz_brand pcb where pcb.pId = ? order by id asc",p.getId());
//			
//			//新增一个热销品牌，涵盖某个类别下的所有热门产品
//			boolean isHotSellExist = false;
//			for(PrdClazzBrand pcb:brandList){
//				if(pcb.getId() == -1){
//					isHotSellExist = true;
//				}
//			}
//			if(!isHotSellExist){
//				PrdClazzBrand brand = new PrdClazzBrand();
//				brand.setId(-1);
//				brand.setName("热销");
//				brand.put("product",hotProductListByClazz);
//				brandList.add(0, brand);
//			}
//
//			
//			//查找品牌下面的热门产品
//			for(PrdClazzBrand b : brandList){
//					if(b.getId() == -1) continue;
//					List<PrdProduct>  productList = prdProductDao.findByCache(CFG.CACHE_NAME_CLAZZ_BRAND, CFG.CACHE_KEY_PRODUCT+b.getId(),"select * from prd_product pp where pp.isHot = 'Y' and pp.brandId = ? order by id asc",b.getId());
//					b.put("product",productList);
//			}
//			
//			
//			
//			p.put("brand", brandList);
//		}
//		return clazzList;
//	}
	
	
	
	
	@Override
	public List<PrdClazzBrand> find(PrdClazzBrand prdClazzBrand) {
		return dbBaseService.selectObjects(prdClazzBrand);
	}


	@Override
	public Page<PrdClazzBrand> paginate(int pageNumber, int pageSize, PrdClazzBrand t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(PrdClazzBrand prdClazzBrand) {
		if (prdClazzBrand == null) {
			return;
		}
		prdClazzBrand.update();removeCache();
	}

	@Override
	public PrdClazzBrand save(PrdClazzBrand prdClazzBrand) {
		if (prdClazzBrand == null) {
			return null;
		}
		prdClazzBrand.save();removeCache();
		return prdClazzBrand;
	}

	@Override
	public PrdClazzBrand findById(String id) {
		PrdClazzBrand prdClazzBrand = prdClazzBrandDao.findById(id);
		return prdClazzBrand;
	}

	@Override
	public void deleteById(String id) {
		prdClazzBrandDao.deleteById(id);removeCache();
		
	}

	@Override
	public void delete(PrdClazzBrand prdClazzBrand) {
		prdClazzBrand.delete();removeCache();
	}
	
	public void removeCache(){
		CacheKit.removeAll(CFG.CACHE_NAME_CLAZZ_BRAND);
	}
}
