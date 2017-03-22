package com.isongshu.huishou.skeleton.model.sql;

public enum SqlOperEnum {
	EQUAL("="),
	LIKE("like"),
	LT("<"),
	GT(">"),
	LTEQ("<="),
	GTEQ(">=");
	
	private String oper;
	
	SqlOperEnum(String oper){
		this.oper = oper;
	}
	
}
