package com.isongshu.huishou.manager.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.isongshu.huishou.manager.interceptor.IsLoginInterceptor;
import com.isongshu.huishou.skeleton.model.CommentInfo;
import com.isongshu.huishou.skeleton.service.CommentInfoService;
import com.isongshu.huishou.skeleton.util.JsonMessage;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.spring.Inject;
import com.jfinal.plugin.spring.IocInterceptor;

@Before({ IocInterceptor.class, IsLoginInterceptor.class })
public class CommentInfoController extends _Controller {
	
	private static Logger logger = LoggerFactory.getLogger(CommentInfoController.class);
	
	@Inject.BY_NAME
	private CommentInfoService commentInfoService;

	public void index() {
		CommentInfo commentInfo = getBean(CommentInfo.class, "object");
		Page<CommentInfo> page = commentInfoService.paginate(getParaToInt(0, 1), 10,commentInfo);
		setAttr("actionUrl", "/commentInfo/");
		setAttr("actionParas", coverToParams(commentInfo, "object"));
		setAttr("object", commentInfo);
		setAttr("objectPage", page);
		render("/WEB-INF/jsp/other/comment/view.jsp");
	}

	public void toAdd() {
		setAttr("addOrUpdate", "add");
		render("/WEB-INF/jsp/other/comment/addOrUpdateModal.jsp");
	}

	public void toUpdate() {
		CommentInfo commentInfo = commentInfoService.findById(getPara("id"));
		setAttr("object", commentInfo);
		setAttr("addOrUpdate","update");
		render("/WEB-INF/jsp/other/comment/addOrUpdateModal.jsp");
	}
	
	public void add() {
		JsonMessage jsonMessage = new JsonMessage();
		try {
			CommentInfo commentInfo = getBean(CommentInfo.class, "object");
			commentInfo.setCreateTime(new Date());
			commentInfoService.save(commentInfo);
			jsonMessage.success();
		} catch (Exception e) {
			logger.error("保存评价信息出错",e);
			jsonMessage.error();
			jsonMessage.setMessage(e.getMessage());
		}
		renderJson(jsonMessage);
	}

	public void update() {
		JsonMessage jsonMessage = new JsonMessage();
		try {
			CommentInfo commentInfo = getBean(CommentInfo.class, "object");
			commentInfoService.update(commentInfo);
			jsonMessage.success();
		} catch (Exception e) {
			jsonMessage.error();
			logger.error("更新评价信息出错",e);
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
				commentInfoService.deleteById(id);
			}
			jsonMessage.success();
		} catch (Exception e) {
			jsonMessage.error();
			logger.error("删除评价信息出错 ", e);
			jsonMessage.error();
			jsonMessage.setMessage(e.getMessage());
		}
		renderJson(jsonMessage);
	}
}
