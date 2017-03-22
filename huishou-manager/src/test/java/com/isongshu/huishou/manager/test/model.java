package com.isongshu.huishou.manager.test;

import java.io.Serializable;
import java.util.List;

public class model implements Serializable{

	List<model2> packagedetail;
	int price;
	public List<model2> getPackagedetail() {
		return packagedetail;
	}
	public void setPackagedetail(List<model2> packagedetail) {
		this.packagedetail = packagedetail;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
