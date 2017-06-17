package com.isongshu.huishou.front.controller;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.isongshu.huishou.front.util.UrlKti;
import com.isongshu.huishou.skeleton.model.CmsLink;
import com.isongshu.huishou.skeleton.model.CommentInfo;
import com.isongshu.huishou.skeleton.model.NewsInfo;
import com.isongshu.huishou.skeleton.model.PrdClazzBrand;
import com.isongshu.huishou.skeleton.service.CmsLinkService;
import com.isongshu.huishou.skeleton.service.CommentInfoService;
import com.isongshu.huishou.skeleton.service.DbBaseService;
import com.isongshu.huishou.skeleton.service.NewsInfoService;
import com.isongshu.huishou.skeleton.service.PrdClazzBrandService;
import com.isongshu.huishou.skeleton.service.PrdPackageService;
import com.isongshu.huishou.skeleton.service.PrdProductService;
import com.jfinal.aop.Before;
import com.jfinal.plugin.spring.Inject;
import com.jfinal.plugin.spring.IocInterceptor;

@Before({ IocInterceptor.class })
public class IndexController extends _Controller {

	 private static Logger logger = LoggerFactory.getLogger(IndexController.class);
	 
	@Inject.BY_NAME
	private PrdProductService prdProductService;
	@Inject.BY_NAME
	private PrdClazzBrandService prdClazzBrandService;
	@Inject.BY_NAME
	private PrdPackageService prdPackageService;
	@Inject.BY_NAME
	private DbBaseService dbBaseService;
	@Inject.BY_NAME
	private CmsLinkService cmsLinkService;
	@Inject.BY_NAME
	private NewsInfoService newsInfoService;
	@Inject.BY_NAME
	private CommentInfoService commentInfoService;
	
	public void index() {
		List<PrdClazzBrand> clazzBrandProductList = prdClazzBrandService.queryAllClazzBrandHotProduct();
		List<CmsLink> cmsLinks = cmsLinkService.findOrderByCreateTime();
		List<NewsInfo> outNews = newsInfoService.findOutNews();
		List<NewsInfo> inNews = newsInfoService.findInNews();
		List<CommentInfo> commentInfos = commentInfoService.findGoodScoredAndOrderByCreateTime();
		setAttr("clazzBrandProduct",clazzBrandProductList);
		setAttr("title","安特回收官网 | 手机回收｜二手手机回收｜笔记本回收｜专业二手数码回收平台");
		setAttr("keywords", "安特回收-是中国最专业的手机及电子产品回收平台，专门提供手机、平板、笔记本、单反及单反镜头、等数码电子产品回收业务，专业检测、权威认证，提供上门高价回收-安特回收官网");
		setAttr("description", "手机回收,平板回收,笔记本回收,单反回收,镜头回收,数码产品回收");
		setAttr("cmsLinks",cmsLinks);
		setAttr("inNews",inNews);
		setAttr("outNews",outNews);
		setAttr("commentInfos",commentInfos);
		to(UrlKti.INDEX_JSP);
	}

	
}
