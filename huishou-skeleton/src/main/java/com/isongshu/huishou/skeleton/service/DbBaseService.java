package com.isongshu.huishou.skeleton.service;

import java.util.List;

import com.isongshu.huishou.skeleton.model.sql.SqlObject;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

/**
 * 基础服务
 * 
 * @author huson
 *
 */
public interface DbBaseService<K> {

	/**
	 * 添加商品范畴
	 * 
	 * @param gt
	 * @return
	 */
	boolean addObject(K gt);

	/**
	 * 更新对象
	 * 
	 * @param gt
	 * @return
	 */
	boolean updateObject(K gt);

	/**
	 * 删除对象
	 * 
	 * @param objs
	 *            
	 * @return 0: success,
	 */
	Exception deleteObject(K[] ids);

	/**
	 * 支持事物绑定
	 * @param sql
	 * @param k
	 * @return
	 */
	int deleteSql(String sql, K k);

	/**
	 * 删除特定对象数据
	 * 
	 * @param obj
	 * @return
	 */
	boolean deleteObject(K obj);
	int deleteObject(SqlObject sqlObject);
	
	
	/**
	 * 分页查询
	 * 
	 * @param sql
	 * @return
	 */
	Page<K> selectObjects(int pageNumber, int pageSize,K k,String where,List<Object> paramer ) ;

	/**
	 * 返回 Record 对象, 可以执行多表查询
	 * @param sql
	 * @param k
	 * @return
	 */
	List<Record> selectObjects(String sql) ;

	/**
	 * 对单表查询
	 * @param sql
	 * @return
	 */
	List<K> selectObjects(String sql,K k) ;
	
	/**
	 * 自定义构造SQl
	 * @param sqlObject
	 * @return
	 */
	Page<K> paginate(SqlObject sqlObject);
	/**
	 * 返回单一对象
	 * 
	 * @param sql
	 * @return
	 */
	K selectObject(SqlObject sqlObject);
	
	List<K> selectObjects(K k);

	/**
	 * 获取某一列的值
	 * 
	 * @param sql
	 * @return
	 */
	String getString(String sql);

	float getFloat(String sql);

	int getInt(String sql);
	
	
	
	
	K save(K k);
	K findById(K k,String idValue);
	boolean update(K k);
	void deleteById(K k,String idValue);
	
	
	
	
	
	
}
