package com.isongshu.huishou.skeleton.util;

public enum OrderInfoStatus {

	
	WAIT_EXPRESS("WAIT_EXPRESS","待发货"),
	WAIT_TAKE("WAIT_TAKE","待收货"),
	HAS_RECEIVE("HAS_RECEIVE","已收货"),
	PAYING("PAYING","已付款中"),
	
	
	WAIT_CONFIRM("WAIT_CONFIRM","等待回收人员确认"),
	HAS_CONFIRM("HAS_CONFIRM","回收人员已确认"),
	FINISH("FINISH","已完成"),
	CLOSE("CLOSE","已关闭");
	
	
	private String code;
	private String msg;
	
	private OrderInfoStatus(String code,String msg){
		this.code = code;
		this.msg = msg;
	}
	
	public String toString() {  
	        return this.code+":"+this.msg;  
	}  
	
	public String CODE(){
		return this.code;
	}
	
	public String MSG(){
		return this.msg;
	}
}
