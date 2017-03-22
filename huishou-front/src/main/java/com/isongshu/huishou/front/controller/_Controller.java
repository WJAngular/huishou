package com.isongshu.huishou.front.controller;

import java.util.Map.Entry;
import java.util.Set;

import com.isongshu.huishou.front.util.HelpKit;
import com.isongshu.huishou.front.util.UrlKti;
import com.isongshu.huishou.skeleton.model.User;
import com.jfinal.core.Controller;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Model;

public class _Controller extends Controller{

	
	
	
	public User getUser(){
		return getSessionAttr("user");
	}
	
	
	public String coverToParams(Model model,String prefix){
		
		StringBuilder sb = new StringBuilder();
		sb.append("?");
		
		if(StrKit.notBlank(prefix)){
			prefix = prefix + ".";
		}else{
			prefix = "";
		}
		
		Set<Entry<String, Object>> y = model._getAttrsEntrySet();
		for(Entry<String, Object> en : y){
			sb.append(prefix+en.getKey()+"="+en.getValue()+"&");
		}
		
		if(y == null || y.size() ==0){
			return null;
		}else{
			return sb.toString();
		}
	}
	
	
	
	public void to(String url){
		
		if (url == null || url.equals("")) return;
		
		if(url.contains(".jsp")){ //如果是渲染页面，就要根据是否是PC还是移动端来
			String USER_AGENT = getRequest().getHeader("User-Agent");
			if(HelpKit.isMobile(USER_AGENT)){
				render(UrlKti.APP_PREFIX + url);
			}else{
				render( url);
			}
		}else{ //如果是ACTION，就默认跳转
			render( url);
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
