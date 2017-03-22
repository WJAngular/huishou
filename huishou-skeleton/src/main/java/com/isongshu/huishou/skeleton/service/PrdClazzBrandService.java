package com.isongshu.huishou.skeleton.service;


import java.util.List;

import com.isongshu.huishou.skeleton.model.PrdClazzBrand;


public interface PrdClazzBrandService extends CommonService<PrdClazzBrand>{
	List<PrdClazzBrand> queryAllClazzBrand();
	List<PrdClazzBrand> queryAllClazzBrandHotProduct();
}
