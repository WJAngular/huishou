package com.isongshu.huishou.manager.test;

import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;

public class test2 {

	public static void main(String[] args) {
		
		String var = "["
				+ "    {'price':'3000','items':[{'i1Id':'1','i2Id':'4','i3Id':'5'},{'i1Id':'1','i2Id':'8','i3Id':'10'}]},"
				+ "    {'price':'2000','items':[{'i1Id':'1','i2Id':'4','i3Id':'6'},{'i1Id':'1','i2Id':'8','i3Id':'11'}]}"
				+ "   ]";
		
		//查询该查询的组合配置项
			List<ItemCombine> itemCombineList =  JSON.parseObject(var, new TypeReference<ArrayList<ItemCombine>>(){});
			for(ItemCombine itemCombine : itemCombineList){
				System.out.println(itemCombine.getPrice());
				for(Item item : itemCombine.getItems()){
					System.out.println(item.getI1Id()+":"+item.getI2Id()+":"+item.getI3Id());
				}
			}
		
		
	}
	
}
