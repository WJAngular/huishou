package com.isongshu.huishou.manager.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.isongshu.huishou.manager.interceptor.IsLoginInterceptor;
import com.isongshu.huishou.skeleton.model.NewsInfo;
import com.isongshu.huishou.skeleton.service.NewsInfoService;
import com.isongshu.huishou.skeleton.util.JsonMessage;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.spring.Inject;
import com.jfinal.plugin.spring.IocInterceptor;

@Before({ IocInterceptor.class, IsLoginInterceptor.class })
public class NewsInfoController extends _Controller {
	
	private static Logger logger = LoggerFactory.getLogger(NewsInfoController.class);
	
	@Inject.BY_NAME
	private NewsInfoService newsInfoService;

	public void index() {
		NewsInfo newsInfo = getBean(NewsInfo.class, "object");
		Page<NewsInfo> page = newsInfoService.paginate(getParaToInt(0, 1), 10,newsInfo);
		setAttr("actionUrl", "/newsInfo/");
		setAttr("actionParas", coverToParams(newsInfo, "object"));
		setAttr("object", newsInfo);
		setAttr("objectPage", page);
		render("/WEB-INF/jsp/other/news/view.jsp");
	}

	public void toAdd() {
		setAttr("addOrUpdate", "add");
		render("/WEB-INF/jsp/other/news/addOrUpdateModal.jsp");
	}

	public void toUpdate() {
		NewsInfo newsInfo = newsInfoService.findById(getPara("id"));
		setAttr("object", newsInfo);
		setAttr("addOrUpdate","update");
		render("/WEB-INF/jsp/other/news/addOrUpdateModal.jsp");
	}
	
	public void add() {
		JsonMessage jsonMessage = new JsonMessage();
		try {
			NewsInfo newsInfo = getBean(NewsInfo.class, "object");
			newsInfo.setCreateTime(new Date());
			if(StringUtils.isEmpty(newsInfo.getStatus())){
				newsInfo.setStatus("N");
			}
			newsInfoService.save(newsInfo);
			jsonMessage.success();
		} catch (Exception e) {
			logger.error("保存新闻出错",e);
			jsonMessage.error();
			jsonMessage.setMessage(e.getMessage());
		}
		renderJson(jsonMessage);
	}

	public void update() {
		JsonMessage jsonMessage = new JsonMessage();
		try {
			NewsInfo newsInfo = getBean(NewsInfo.class, "object");
			if(StringUtils.isEmpty(newsInfo.getStatus())){
				newsInfo.setStatus("N");
			}
			newsInfoService.update(newsInfo);
			jsonMessage.success();
		} catch (Exception e) {
			jsonMessage.error();
			logger.error("更新新闻出错",e);
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
				newsInfoService.deleteById(id);
			}
			jsonMessage.success();
		} catch (Exception e) {
			jsonMessage.error();
			logger.error("删除新闻出错 ", e);
			jsonMessage.error();
			jsonMessage.setMessage(e.getMessage());
		}
		renderJson(jsonMessage);
	}
}
