package com.isongshu.huishou.skeleton.model.sql;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Table;
import com.jfinal.plugin.activerecord.TableMapping;

/**
 * 
 * @author huson
 *
 * @param <K>
 */
public class SqlObject<K extends Model> implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 查询实体类. 如K==null，则返货Modle
	 */
	private K k;

	/**
	 * 查询条件
	 */
	private List<SqlCondition> conditions;

	/**
	 * 查询的列。默认全部
	 */
	private String selectColumn = "*";

	/**
	 * SqlFix = select / delete / insert
	 */
	private String sqlPrefix = "select";
	/**
	 * 查询表名,如果不指定，则从K中获取
	 */
	private String tableName = "";

	/**
	 * 分页
	 */
	private int pageNumber, pageSize;

	public SqlObject() {
	}

	/**
	 * 查询单一表对象
	 * 
	 * @param k
	 * @param conditions
	 */
	public SqlObject(K k, List<SqlCondition> conditions) {
		this.conditions = conditions;
		this.k = k;
	}

	
	public SqlObject(String tableName, List<SqlCondition> conditions, String selectColumn) {
		this.conditions = conditions;
		this.tableName = tableName;
		this.selectColumn = selectColumn;
	}
	
	
	@SuppressWarnings({ "unused", "rawtypes" })
	public SqlObject(K k, List<SqlCondition> conditions, String selectColumn) {
		this.conditions = conditions;
		this.k = k;
		this.selectColumn = selectColumn;
	}

	/**
	 * 构造sql前缀
	 * 
	 * @return
	 */
	public String buildFix() {
		return sqlPrefix + " " + selectColumn;
	}

	/**
	 * 构造sql from .. where ..
	 * 
	 * @return
	 */
	public String buildfrom() {
		
		if(tableName == null || tableName.equals("")){
			// 获取表名
			Model modle = k;
			Table table = TableMapping.me().getTable(k.getClass());
			tableName = table.getName();
		}
				
		StringBuffer buf = new StringBuffer();
		buf.append(" from " + tableName);
		
		
		if(conditions != null && conditions.size() > 0){
			
			//判断所有条件的值是否不为空
			for (int i = 0; i < this.conditions.size(); i++) {
				SqlCondition sc = this.conditions.get(i);
				if (sc != null && sc.getValue() != null && !sc.getValue().equals("")) {
					buf.append(" where ");
					break;
				}
			}
			
			for (int i = 0; i < this.conditions.size(); i++) {
				SqlCondition sc = this.conditions.get(i);
				if (sc != null && sc.getValue() != null && !sc.getValue().equals("")) {
					buf.append(sc.build());
				}
			}
		}
		
		return buf.toString();
	}

	/**
	 * 获取完整的sql语句
	 * 
	 * @return
	 */
	public String fullSql() {
		return sqlPrefix + " " + selectColumn + " " + buildfrom();
	}

	public K getK() {
		return k;
	}

	public void setK(K k) {
		this.k = k;
	}

	public List<SqlCondition> getConditions() {
		return conditions;
	}

	public void setConditions(List<SqlCondition> conditions) {
		this.conditions = conditions;
	}

	


	public String getSelectColumn() {
		return selectColumn;
	}

	public void setSelectColumn(String selectColumn) {
		this.selectColumn = selectColumn;
	}

	public String getSqlPrefix() {
		return sqlPrefix;
	}

	public void setSqlPrefix(String sqlPrefix) {
		this.sqlPrefix = sqlPrefix;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
}
