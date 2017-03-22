package com.isongshu.huishou.manager.controller;


import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.isongshu.huishou.manager.interceptor.IsLoginInterceptor;
import com.isongshu.huishou.skeleton.model.SysAdmin;
import com.isongshu.huishou.skeleton.model.SysParam;
import com.isongshu.huishou.skeleton.model.User;
import com.isongshu.huishou.skeleton.service.UserService;
import com.isongshu.huishou.skeleton.util.JsonMessage;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.spring.Inject;
import com.jfinal.plugin.spring.IocInterceptor;

@Before({ IocInterceptor.class,IsLoginInterceptor.class })
public class UserController extends _Controller {

	 private static Logger logger = LoggerFactory.getLogger(UserController.class);
	 
	@Inject.BY_NAME
	private UserService userService;
	
	
	public void index() {
		
		User user = getBean(User.class, "object");
		Page<User> page = userService.paginate(getParaToInt(0, 1), 10, user);
		
		setAttr("actionUrl","/user/");
		setAttr("actionParas",coverToParams(user, "object"));
		setAttr("object",user);
		setAttr("objectPage", page);
		
		render("/WEB-INF/jsp/user/view.jsp");
	}

	public void toAdd() {
		setAttr("addOrUpdate","add");
		render("/WEB-INF/jsp/user/addOrUpdateModal.jsp");
	}

	public void toUpdate() {
		setAttr("object", userService.findById(getPara("id")));
		setAttr("addOrUpdate","update");
		render("/WEB-INF/jsp/user/addOrUpdateModal.jsp");
	}
	
	
	public void add() {
		JsonMessage jsonMessage = new JsonMessage();
		try {
			User user = getBean(User.class, "object");
			if(userService.findById(getPara("id")) != null){
				jsonMessage.error();
				jsonMessage.setMessage("账户已经存在");
				renderJson(jsonMessage);return;
			}
			user.setCreateTime(new Date());
			userService.save(user);
			jsonMessage.success();
		} catch (Exception e) {
			logger.error("保存用户出错",e);
			jsonMessage.error();
			jsonMessage.setMessage(e.getMessage());
		}
		renderJson(jsonMessage);
	}

	public void update() {
		JsonMessage jsonMessage = new JsonMessage();
		try {
			User user = getBean(User.class, "object");
			userService.update(user);
			jsonMessage.success();
		} catch (Exception e) {
			jsonMessage.error();
			logger.error("更新用户出错",e);
			jsonMessage.error();
			jsonMessage.setMessage(e.getMessage());
		}
		renderJson(jsonMessage);
	}

	
	public void delete() {
		JsonMessage jsonMessage = new JsonMessage();
		try {
			String[] ids = getParaValues("ids[]");
			for(String id : ids){
				userService.deleteById(id);
			}
			jsonMessage.success();
		} catch (Exception e) {
			jsonMessage.error();
			logger.error("删除用户出错",e);
			jsonMessage.error();
			jsonMessage.setMessage(e.getMessage());
		}
		renderJson(jsonMessage);
	}
}
