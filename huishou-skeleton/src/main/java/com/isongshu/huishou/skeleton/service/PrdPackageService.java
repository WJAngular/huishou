package com.isongshu.huishou.skeleton.service;

import java.util.List;

import com.isongshu.huishou.skeleton.model.PrdPackage;
import com.isongshu.huishou.skeleton.model.PrdPackageItem;
import com.isongshu.huishou.skeleton.model.SysAdmin;


/**
 * 商品/产品信息维护
 * @author huson
 *
 */
public interface PrdPackageService {
 
	 
	 
	 /**
	  * 删除描述包,会删除该描述包下所有描述项
	  * @param packageId
	  * @return
	  */
	 String deletePckage(int packageId);
	 
	 void copyDescriptPackage(final int fromPackageId);
	 List<PrdPackage> queryAll();
	 
	 List<PrdPackageItem> queryPackageItemByPackageId(int prcPackageId);
	 
	 List<PrdPackageItem> queryPackageItemByPackageId_(int prcPackageId);
}
