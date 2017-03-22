package com.isongshu.huishou.front.bean;

import java.io.Serializable;
import java.util.List;

public class ItemCombine implements Serializable{

	private String price;
	
	private List<Item> items;

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public List<Item> getItems() {
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	}

	
	
}
