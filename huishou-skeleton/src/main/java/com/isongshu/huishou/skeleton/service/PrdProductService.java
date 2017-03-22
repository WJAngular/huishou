package com.isongshu.huishou.skeleton.service;


import java.util.List;

import com.isongshu.huishou.skeleton.model.PrdProduct;
import com.jfinal.plugin.activerecord.Page;

public interface PrdProductService extends CommonService<PrdProduct>{
	
	List<PrdProduct> findHotProductByClazzBrand(PrdProduct prdProduct);
}
