package com.isongshu.huishou.manager.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class IndexController extends _Controller{

	 private static Logger logger = LoggerFactory.getLogger(SystemController.class);
	 
	 public void index(){
		 if(getLoginUser() == null){
			 render("/login.jsp");
		 }else{
			 render("/WEB-INF/jsp/mainpage.jsp");
		 }
		 
	 }
	 
}
