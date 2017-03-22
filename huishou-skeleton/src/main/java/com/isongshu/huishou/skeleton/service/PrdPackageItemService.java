package com.isongshu.huishou.skeleton.service;

import java.util.List;

import com.isongshu.huishou.skeleton.model.PrdPackage;
import com.isongshu.huishou.skeleton.model.PrdPackageItem;
import com.isongshu.huishou.skeleton.model.PrdProduct;
import com.jfinal.plugin.activerecord.Page;


public interface PrdPackageItemService extends CommonService<PrdPackageItem>{
 
	 PrdPackageItem findByIds(Object... ids);
	   void nextAction(PrdPackageItem targetPrdPackageItem,PrdPackageItem currentPrdPackageItem);
	   
	    void prevAction(PrdPackageItem targetPrdPackageItem,PrdPackageItem currentPrdPackageItem);
	    void deleteChildren(PrdPackageItem prdPackageItem);
}
