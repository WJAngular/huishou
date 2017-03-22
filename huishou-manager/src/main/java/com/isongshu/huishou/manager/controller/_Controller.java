package com.isongshu.huishou.manager.controller;

import java.util.Map.Entry;
import java.util.Set;

import com.isongshu.huishou.skeleton.model.SysAdmin;
import com.jfinal.core.Controller;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Model;

public class _Controller extends Controller{

	
	public SysAdmin getLoginUser(){
		return getSessionAttr("sysAdmin");
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
			
			if(en.getValue() == null || en.getValue().equals("null") ){
				sb.append(prefix+en.getKey()+"&");
			}else{
				sb.append(prefix+en.getKey()+"="+en.getValue()+"&");
			}
			
		}
		
		if(y == null || y.size() ==0){
			return null;
		}else{
			return sb.toString();
		}
	}
	
	
}
