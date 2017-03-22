package com.isongshu.huishou.manager.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.isongshu.huishou.manager.interceptor.IsLoginInterceptor;
import com.isongshu.huishou.skeleton.model.PrdClazzBrand;
import com.isongshu.huishou.skeleton.service.DbBaseService;
import com.isongshu.huishou.skeleton.service.PrdClazzBrandService;
import com.isongshu.huishou.skeleton.service.SysAdminService;
import com.isongshu.huishou.skeleton.util.JsonMessage;
import com.jfinal.aop.Before;
import com.jfinal.plugin.spring.Inject;
import com.jfinal.plugin.spring.IocInterceptor;

@Before({ IocInterceptor.class,IsLoginInterceptor.class })
public class PrdClazzBrandController extends _Controller{

	
	private static Logger logger = LoggerFactory.getLogger(PrdClazzBrandController.class);
	 
	
	@Inject.BY_NAME
	private PrdClazzBrandService prdClazzBrandService;
	
	public void index() {
		render("/WEB-INF/jsp/prd/clazzbrand/view.jsp");
	}
	
	
	public void add(){
		
		JsonMessage jsonMessage = new JsonMessage();
		try {
			PrdClazzBrand prdClazzBrand = new PrdClazzBrand();
			String pid = getPara("pid");
			String name = getPara("name");
			
			
			if(pid == null || pid.equals("")){
				prdClazzBrand.setPId(0);
			}else{
				prdClazzBrand.setPId(Integer.valueOf(pid));
			}
			prdClazzBrand.setName(name);
			prdClazzBrandService.save(prdClazzBrand);
	        jsonMessage.success();
		} catch (Exception e) {
			logger.error("新增节点出错",e);
			jsonMessage.error();
			jsonMessage.setMessage(e.getMessage());
		}
		renderJson(jsonMessage);
		
	}
	
	
	
	public void rename(){
		JsonMessage jsonMessage = new JsonMessage();
		try {
			int id = getParaToInt("id", -1); 
	        String newname = getPara("newname");  
	
	        PrdClazzBrand prdClazzBrandCondition = new PrdClazzBrand();
	        prdClazzBrandCondition.setId(id);
	        prdClazzBrandCondition.setName(newname);
	        prdClazzBrandService.update(prdClazzBrandCondition);
	        jsonMessage.success();
	        
		} catch (Exception e) {
			logger.error("变更节点名称出错",e);
			jsonMessage.error();
			jsonMessage.setMessage(e.getMessage());
		}
		renderJson(jsonMessage);
	}
	
	
	public void delete(){
		JsonMessage jsonMessage = new JsonMessage();
		try {
			String id = getPara("id"); 
	        prdClazzBrandService.deleteById(id);
	        jsonMessage.success();
		} catch (Exception e) {
			logger.error("删除节点出错",e);
			jsonMessage.error();
			jsonMessage.setMessage(e.getMessage());
		}
		renderJson(jsonMessage);
	}
	
	
	
	public void getData(){
		int id = getParaToInt("id", -1); 
        String name = getPara("name");  
        String level = getPara("level");  
        String otherParam = getPara("otherParam");  
        System.out.println(id + "|" + name + "|" + level + "|" + otherParam);  
        
    	PrdClazzBrand prdClazzBrandCondition = new PrdClazzBrand();
    	 if(id == -1){
    		 prdClazzBrandCondition.setPId(0);
    	 }else{
    		 prdClazzBrandCondition.setPId(id);
    	 }
    	
    	List<PrdClazzBrand> prdClazzBrandList = prdClazzBrandService.find(prdClazzBrandCondition);
    	List<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();  
    	for(PrdClazzBrand prdClazzBrand : prdClazzBrandList){
    		HashMap<String,Object> hm = new HashMap<String,Object>();   //最外层，父节点
    		  hm.put("id", prdClazzBrand.getId());//id属性  ，数据传递    
              hm.put("name", prdClazzBrand.getName()); //name属性，显示节点名称    
              hm.put("pId", prdClazzBrand.getPId());  
              if(id == -1){
            	  hm.put("isParent", "true");
              }else{
            	  hm.put("isParent", "false");
              }
              list.add(hm);  
    	}
        renderJson(list);
        return;
    }
        
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public void getTreeData2(){
		String id = getPara("id");  
        String name = getPara("name");  
        String level = getPara("level");  
        String otherParam = getPara("otherParam");  
        System.out.println(id + "|" + name + "|" + level + "|" + otherParam);  
        
        
        if(id == null){
        	List<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();  
            for(int i = 0; i < 5; i++){  
                HashMap<String,Object> hm = new HashMap<String,Object>();   //最外层，父节点             
                hm.put("id", i);//id属性  ，数据传递    
                hm.put("name", "根节点"+i); //name属性，显示节点名称    
                hm.put("pId", 0);  
                hm.put("isParent", "true");
                hm.put("v", i+"v");
                list.add(hm);  
            }  
            renderJson(list);
            return;
        }else{
        	 List<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();  
             for(int i = 0; i < 5; i++){  
                 HashMap<String,Object> hm = new HashMap<String,Object>();   //最外层，父节点             
                 hm.put("id", id + i);//id属性  ，数据传递    
                 hm.put("name", id + i); //name属性，显示节点名称    
                 hm.put("pId", id);  
                 hm.put("isParent", "false");
                 hm.put("v", i+"v");
                 list.add(hm);  
             }  
             renderJson(list);
             return;
        }
        
	}
	
	
	
}
