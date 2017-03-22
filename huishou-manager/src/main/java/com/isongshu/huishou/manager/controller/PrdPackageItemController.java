package com.isongshu.huishou.manager.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.isongshu.huishou.manager.interceptor.IsLoginInterceptor;
import com.isongshu.huishou.skeleton.model.PrdPackageItem;
import com.isongshu.huishou.skeleton.service.DbBaseService;
import com.isongshu.huishou.skeleton.service.PrdPackageItemService;
import com.isongshu.huishou.skeleton.util.JsonMessage;
import com.jfinal.aop.Before;
import com.jfinal.plugin.spring.Inject;
import com.jfinal.plugin.spring.IocInterceptor;

@Before({ IocInterceptor.class,IsLoginInterceptor.class })
public class PrdPackageItemController extends _Controller{

	
	private static Logger logger = LoggerFactory.getLogger(PrdPackageItemController.class);
	 
	@Inject.BY_NAME
	private DbBaseService dbBaseService;
	@Inject.BY_NAME
	private PrdPackageItemService prdPackageItemService;
	
	public void index() {
		
		setAttr("actionUrl","/prdPackageItem/");
		setAttr("packageId",getPara("packageId"));
		
		render("/WEB-INF/jsp/prd/package/item.jsp");
	}
	
	
	public void updateValue(){
		
		JsonMessage jsonMessage = new JsonMessage();
		try {
			int id = getParaToInt("id", -1); 
	        int packageId = getParaToInt("packageId");
	        String value = getPara("value");
	        
	        PrdPackageItem prdPackageItem = new PrdPackageItem();
	        prdPackageItem.setPackageId(packageId);
	        prdPackageItem.setId(id);
	        prdPackageItem.setValue(new BigDecimal(value));
	        
	        prdPackageItemService.update(prdPackageItem);
	        jsonMessage.success();
		} catch (Exception e) {
			logger.error("变更节点名称出错",e);
			jsonMessage.error();
			jsonMessage.setMessage(e.getMessage());
		}
		renderJson(jsonMessage);
		
		
	}
	
	
	
	public void updateSelOpt(){
		
		JsonMessage jsonMessage = new JsonMessage();
		try {
			int id = getParaToInt("id", -1); 
	        int packageId = getParaToInt("packageId");
	        String selOpt = getPara("selOpt");
	        
	        PrdPackageItem prdPackageItem = new PrdPackageItem();
	        prdPackageItem.setPackageId(packageId);
	        prdPackageItem.setId(id);
	        prdPackageItem.setSelOpt(selOpt);
	        
	        prdPackageItemService.update(prdPackageItem);
	        jsonMessage.success();
		} catch (Exception e) {
			logger.error("变更节点名称出错",e);
			jsonMessage.error();
			jsonMessage.setMessage(e.getMessage());
		}
		renderJson(jsonMessage);
		
		
	}
	
	
	
	
	public void add(){
		
		JsonMessage jsonMessage = new JsonMessage();
		try {
			PrdPackageItem prdPackageItem = new PrdPackageItem();
			String pid = getPara("pid");
			String name = getPara("name");
			int packageId = getParaToInt("packageId");
			int level = getParaToInt("level");
			
			prdPackageItem.setPackageId(packageId);
			prdPackageItem.setLevel(level);
			
			if(pid == null || pid.equals("")){
				prdPackageItem.setPId(0);
			}else{
				prdPackageItem.setPId(Integer.valueOf(pid));
			}
			
			prdPackageItem.setName(name);
			prdPackageItem.setCreateTime(new Date());
			
			
			
			//拿出相同pid的配置项，然后顺序就是这些配置项里面最小的
			PrdPackageItem condition = new PrdPackageItem();
			condition.setPId(prdPackageItem.getPId());
			List<PrdPackageItem> prdPackageItemList = prdPackageItemService.find(condition);
			int minSeq = 0;
			if(prdPackageItemList != null && prdPackageItemList.size() > 0){
				minSeq = prdPackageItemList.get(0).getSeq();
				for(PrdPackageItem ppki : prdPackageItemList){
					if(ppki.getSeq() < minSeq){
						minSeq = ppki.getSeq(); 
					}
				}
				prdPackageItem.setSeq(minSeq - 1);
			}
			
			
			prdPackageItem = prdPackageItemService.save(prdPackageItem);
			
			jsonMessage.setData(prdPackageItem.getId());
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
	        int packageId = getParaToInt("packageId");
	        
	        PrdPackageItem prdPackageItem = new PrdPackageItem();
	        prdPackageItem.setPackageId(packageId);
	        
	        prdPackageItem.setId(id);
	        prdPackageItem.setName(newname);
	      
	        
	        prdPackageItemService.update(prdPackageItem);
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
			int id = getParaToInt("id", -1); 
			int packageId = getParaToInt("packageId");
		        
	        PrdPackageItem prdPackageItem = new PrdPackageItem();
	        prdPackageItem.setPackageId(packageId);
	        prdPackageItem.setId(id);  
	        prdPackageItemService.delete(prdPackageItem);
	        prdPackageItemService.deleteChildren(prdPackageItem);
	        jsonMessage.success();
		} catch (Exception e) {
			logger.error("删除节点出错",e);
			jsonMessage.error();
			jsonMessage.setMessage(e.getMessage());
		}
		renderJson(jsonMessage);
	}
	
	
	//拖曳控制
	public void drag(){
		JsonMessage jsonMessage = new JsonMessage();
		try {
			
			Integer packageId = getParaToInt("packageId");
			Integer currentId = getParaToInt("currentId");
			Integer targetId = getParaToInt("targetId");
			String moveType = getPara("moveType");
			
			
			PrdPackageItem currentPrdPackageItem =  prdPackageItemService.findByIds(String.valueOf(currentId),String.valueOf(packageId));
			PrdPackageItem targetPrdPackageItem  =  prdPackageItemService.findByIds(String.valueOf(targetId),String.valueOf(packageId));
			
			//拖曳的节点父ID等于目标节点父ID
			currentPrdPackageItem.setPId(targetPrdPackageItem.getPId());
			
			//如果拖曳的节点是属于目标节点的后边，那么序列就应该比目标节点要小1
			if(moveType.equals("next")){
				currentPrdPackageItem.setSeq(targetPrdPackageItem.getSeq() - 1);
				prdPackageItemService.nextAction( targetPrdPackageItem,currentPrdPackageItem);
			}
			
			//如果拖曳的节点是属于目标节点的前面，那么序列就应该比目标节点要大1
			if(moveType.equals("prev")){
				currentPrdPackageItem.setSeq(targetPrdPackageItem.getSeq() + 1);
				prdPackageItemService.prevAction(targetPrdPackageItem,currentPrdPackageItem);
			}
			
			prdPackageItemService.update(currentPrdPackageItem);
	        jsonMessage.success();
		} catch (Exception e) {
			logger.error("拖曳节点出错",e);
			jsonMessage.error();
			jsonMessage.setMessage(e.getMessage());
		}
		renderJson(jsonMessage);
		
	}
	
	
	
	
	public void getData(){
		
		int packageId = getParaToInt("packageId", -1);
		int id = getParaToInt("id", -1); 
        String name = getPara("name");  
        String level = getPara("level");  
        String otherParam = getPara("otherParam");  
        System.out.println(id + "|" + name + "|" + level + "|" + otherParam);  
        
        
        PrdPackageItem prdPackageItemCondition = new PrdPackageItem();
        prdPackageItemCondition.setPackageId(packageId);
        if(id == -1){
        	prdPackageItemCondition.setPId(0);
        }else{
        	prdPackageItemCondition.setPId(id);
   	 	}
        
    	List<PrdPackageItem> prdPackageItemList = prdPackageItemService.find(prdPackageItemCondition);
    	
    	List<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();  
    	for(PrdPackageItem prdPackageItem : prdPackageItemList){
    		HashMap<String,Object> hm = new HashMap<String,Object>();   //最外层，父节点
    		  hm.put("id", prdPackageItem.getId());//id属性  ，数据传递    
              hm.put("name", prdPackageItem.getName()); //name属性，显示节点名称    
              hm.put("pId", prdPackageItem.getPId());  
              hm.put("level", prdPackageItem.getLevel());
              hm.put("value", prdPackageItem.getValue());
              hm.put("selOpt", prdPackageItem.getSelOpt());
              hm.put("seq", prdPackageItem.getSeq());
              if(prdPackageItem.getLevel() == 0 ||  prdPackageItem.getLevel() == 1){
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
