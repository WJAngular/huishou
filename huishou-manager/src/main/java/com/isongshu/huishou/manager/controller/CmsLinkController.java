package com.isongshu.huishou.manager.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.isongshu.huishou.manager.interceptor.IsLoginInterceptor;
import com.isongshu.huishou.skeleton.model.CmsLink;
import com.isongshu.huishou.skeleton.service.CmsLinkService;
import com.isongshu.huishou.skeleton.util.JsonMessage;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.spring.Inject;
import com.jfinal.plugin.spring.IocInterceptor;

@Before({ IocInterceptor.class, IsLoginInterceptor.class })
public class CmsLinkController extends _Controller {
	
	private static Logger logger = LoggerFactory.getLogger(CmsLinkController.class);
	
	@Inject.BY_NAME
	private CmsLinkService cmsLinkService;

	public void index() {
		CmsLink cmsLink = getBean(CmsLink.class, "object");
		Page<CmsLink> page = cmsLinkService.paginate(getParaToInt(0, 1), 10,cmsLink);
		setAttr("actionUrl", "/linkInfo/");
		setAttr("actionParas", coverToParams(cmsLink, "object"));
		setAttr("object", cmsLink);
		setAttr("objectPage", page);
		render("/WEB-INF/jsp/other/link/view.jsp");
	}

	public void toAdd() {
		setAttr("addOrUpdate", "add");
		render("/WEB-INF/jsp/other/link/addOrUpdateModal.jsp");
	}

	public void toUpdate() {
		CmsLink cmsLink = cmsLinkService.findById(getPara("id"));
		setAttr("object", cmsLink);
		setAttr("addOrUpdate","update");
		render("/WEB-INF/jsp/other/link/addOrUpdateModal.jsp");
	}
	
	public void add() {
		JsonMessage jsonMessage = new JsonMessage();
		try {
			CmsLink cmsLink = getBean(CmsLink.class, "object");
			if(StringUtils.isEmpty(cmsLink.getIsvalid())){
				cmsLink.setIsvalid("N");
			}
			cmsLink.setCreateTime(new Date());
			cmsLinkService.save(cmsLink);
			jsonMessage.success();
		} catch (Exception e) {
			logger.error("保存友情链接出错",e);
			jsonMessage.error();
			jsonMessage.setMessage(e.getMessage());
		}
		renderJson(jsonMessage);
	}

	public void update() {
		JsonMessage jsonMessage = new JsonMessage();
		try {
			CmsLink cmsLink = getBean(CmsLink.class, "object");
			if(StringUtils.isEmpty(cmsLink.getIsvalid())){
				cmsLink.setIsvalid("N");
			}
			cmsLinkService.update(cmsLink);
			jsonMessage.success();
		} catch (Exception e) {
			jsonMessage.error();
			logger.error("更新友情链接出错",e);
			jsonMessage.error();
			jsonMessage.setMessage(e.getMessage());
		}
		renderJson(jsonMessage);
	}

	public void delete() {
		JsonMessage jsonMessage = new JsonMessage();
		try {
			String[] ids = getParaValues("ids[]");
			for (String id : ids) {
				cmsLinkService.deleteById(id);
			}
			jsonMessage.success();
		} catch (Exception e) {
			jsonMessage.error();
			logger.error("删除友情链接出错 ", e);
			jsonMessage.error();
			jsonMessage.setMessage(e.getMessage());
		}
		renderJson(jsonMessage);
	}
}
