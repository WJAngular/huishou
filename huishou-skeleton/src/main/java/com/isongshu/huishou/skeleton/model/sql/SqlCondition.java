package com.isongshu.huishou.skeleton.model.sql;

public class SqlCondition implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 与前者之间的关系
	 * 第一个为null，第二个之后可以and.or
	 */
	private String relation="";
	private String culom;
	private SqlOperEnum oper;
	private Object value;
	
	public SqlCondition(){}
	
	public SqlCondition(String culom,SqlOperEnum oper,Object value){
		this.culom= culom;
		this.oper=oper;
		this.value=value;
	}
	
	public SqlCondition(String relation,String culom,SqlOperEnum oper,Object value){
		this.relation=relation;
		this.culom= culom;
		this.oper=oper;
		this.value=value;
	}
	
	public String build(){
		if(oper==SqlOperEnum.EQUAL){
			return this.relation+" "+this.culom+"="+changeTag();
		}else if(oper==SqlOperEnum.LIKE){
			return this.relation+" "+this.culom+" like '%"+this.value+"%' ";
		}else if(oper==SqlOperEnum.LT){
			return this.relation+" "+this.culom+" < "+changeTag();
		}else if(oper==SqlOperEnum.GT){
			return this.relation+" "+this.culom+" > "+changeTag();
		}else if(oper==SqlOperEnum.LTEQ){
			return this.relation+" "+this.culom+" <= "+changeTag();
		}else if(oper==SqlOperEnum.GTEQ){
			return this.relation+" "+this.culom+" >= "+changeTag();
		}
		return " ";
	}
	
	private String changeTag(){
		if(this.value.getClass().getSimpleName().equals("String")){
			return "'"+this.value+"' ";
		}else if(this.value.getClass().getSimpleName().matches("(Char*|char*)")){
			return "'"+this.value+"' ";
		}
		return this.value+" ";
	}
	
	public String getCulom() {
		return culom;
	}
	public void setCulom(String culom) {
		this.culom = culom;
	}
	public SqlOperEnum getOper() {
		return oper;
	}
	public void setOper(SqlOperEnum oper) {
		this.oper = oper;
	}
	public Object getValue() {
		return value;
	}
	public void setValue(Object value) {
		this.value = value;
	}
	
	
	
}
