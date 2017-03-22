package com.isongshu.huishou.front.controller;


import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.isongshu.huishou.front.util.HelpKit;
import com.isongshu.huishou.front.util.UrlKti;
import com.isongshu.huishou.skeleton.model.PrdProduct;
import com.isongshu.huishou.skeleton.model.sql.SqlCondition;
import com.isongshu.huishou.skeleton.model.sql.SqlObject;
import com.isongshu.huishou.skeleton.model.sql.SqlOperEnum;
import com.isongshu.huishou.skeleton.service.DbBaseService;
import com.isongshu.huishou.skeleton.service.PrdClazzBrandService;
import com.isongshu.huishou.skeleton.service.PrdPackageService;
import com.isongshu.huishou.skeleton.service.PrdProductService;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.spring.Inject;
import com.jfinal.plugin.spring.IocInterceptor;

@Before({ IocInterceptor.class })
public class ClazzController extends _Controller {

	 private static Logger logger = LoggerFactory.getLogger(ClazzController.class);
	 
	@Inject.BY_NAME
	private PrdProductService prdProductService;
	@Inject.BY_NAME
	private PrdClazzBrandService prdClazzBrandService;
	@Inject.BY_NAME
	private PrdPackageService prdPackageService;
	@Inject.BY_NAME
	private DbBaseService dbBaseService;
	
	
	public void index() {
		
		PrdProduct prdProduct = getBean(PrdProduct.class,"");
		
		//如果没有任何分类和品牌查询关键字，就查询出热门产品
		if((prdProduct.getName() == null || prdProduct.getName().equals("")) && prdProduct.getClazzId() == null){
			prdProduct.setIsHot("Y");
		}
		
		
		//按条件查询
		//如果是移动端就不分页
		String USER_AGENT = getRequest().getHeader("User-Agent");
		if(HelpKit.isMobile(USER_AGENT)){
			List<PrdProduct> productpage = prdProductService.find(prdProduct);
			setAttr("objectPage", productpage);
		}else{
			Page<PrdProduct> productpage = prdProductService.paginate(getParaToInt(0, 1), 30, prdProduct);
			//查询出热门产品
			List<PrdProduct> hotProductList = prdProductService.findHotProductByClazzBrand(prdProduct);
			if(hotProductList == null || hotProductList.size() <= 0){
				hotProductList = productpage.getList();
			}
			setAttr("objectPage", productpage);
			setAttr("hotProduct", hotProductList);
		}
		
		setAttr("actionUrl",UrlKti.CLAZZ_ACTION);
		setAttr("actionParas",coverToParams(prdProduct, ""));
		setAttr("object",prdProduct);
		setAttr("clazzBrand", prdClazzBrandService.queryAllClazzBrand());
		
		
		setAttr("title","二手手机回收｜旧手机回收｜二手手机交易－安特回收");
		setAttr("keywords", "安特回收二手手机回收频道-为您提供二手闲置手机回收、旧手机回收、闲置手机回收业务-权威机构检测，高价上门回收-安特回收官网！");
		setAttr("description", "手机回收,旧手机回收,回收手机,高价回收手机");
		
		
		to(UrlKti.CLAZZ_JSP);
	}
	
	

	
}
