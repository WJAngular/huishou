package com.isongshu.huishou.server.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.isongshu.huishou.skeleton.model.sql.SqlObject;
import com.isongshu.huishou.skeleton.service.DbBaseService;
import com.jfinal.plugin.activerecord.Config;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.DbKit;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.Table;
import com.jfinal.plugin.activerecord.TableMapping;

@SuppressWarnings("rawtypes")
@Service("dbBaseService")
public class DbBaseServiceImpl<K extends Model> implements DbBaseService<K>{
	private static Logger log = Logger.getLogger(DbBaseServiceImpl.class);
	
	@Override
	public boolean addObject(K gt) {
		Model model = gt;
		return model.save();
	}

	
	@Override
	public boolean updateObject(K gt) {
		Model model = gt;
		return model.update();
	}

	@Override
	public Exception deleteObject(K[] objs) {
		Model[] model = objs;
		
		Exception ex = null;
		for(Model m : model){
			if(!m.delete()){ 
				ex = new RuntimeException("删除数据异常:"+m.toString());
				break;
			}
		}
		return ex;
	}

	@Override
	public int deleteSql(String sql,  K k) {
		Config config = DbKit.getConfig(k.getClass());
		Connection conn = null;
		int res = 0;
		try{
			conn = config.getThreadLocalConnection();
			res =  conn.createStatement().executeUpdate(sql);
//			conn.commit();
		}catch(Exception e){
			this.log.error("deleteSql ERROR:",e);
			return res;
		}
		return res;
	}

	@Override
	public boolean deleteObject(K obj) {
		Model modle = obj;
		return modle.delete();
	}
	
	@Override
	public int deleteObject(SqlObject sqlObject) {
		throw new RuntimeException("未实现");
	}

	
	@Override
	public List<Record> selectObjects(String sql) {
			return Db.find(sql);
	}
	
	@SuppressWarnings("unchecked")
	public List<K> selectObjects(String sql,K k) {
		Model modle = k;
		return modle.find(sql);
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public Page<K> selectObjects(int pageNumber, int pageSize,K k,String where,List<Object> paramer ) {
		Model modle = k;
		Table table = TableMapping.me().getTable(k.getClass());
		log.debug("tablename="+table.getName());
		String sql = "from "+table.getName()+ " where "+where;
		return modle.paginate(pageNumber, pageSize, "select *", sql,paramer.toArray());
	}

	@SuppressWarnings("unchecked")
	@Override
	public K selectObject(SqlObject sqlObject) {
		Model modle = sqlObject.getK();
		return (K) modle.findFirst(sqlObject.fullSql());
//		List<K> lists = modle.find(sqlObject.fullSql());
//		return lists!=null && lists.get(0)!=null?lists.get(0):null;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<K> selectObjects(K k) {
		Model modle = k;
		Table table = TableMapping.me().getTable(k.getClass());
		String[] keys = modle._getAttrNames();
		StringBuffer buf =new StringBuffer();
		buf.append("select * from "+table.getName()+" ");
		
		if(keys.length > 0){
			buf.append(" where ");
		}
		for(int i = 0;i<keys.length;i++){
			if(modle.get(keys[i])==null) continue;
			
			
			if(modle.get(keys[i]) instanceof String){
				buf.append(keys[i]+"='"+modle.get(keys[i])+"'");
			}else{
				buf.append(keys[i]+"="+modle.get(keys[i])+"");
			}
			
			
			if(i<(keys.length-1))
				buf.append(" and ");
		}
		return modle.find(buf.toString());
	}

	@Override
	public String getString(String sql) {
		return null;
	}

	@Override
	public float getFloat(String sql) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getInt(String sql) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
	
	/**2016-09-13
	 * 分页查找
	 */
	public Page<K> paginate(SqlObject sqlObject){
		Model modle = sqlObject.getK();
 		return modle.paginate(sqlObject.getPageNumber(), sqlObject.getPageSize(),
 				sqlObject.buildFix(), sqlObject.buildfrom());
	}
	
	/**2016-09-13
	 * 保存
	 */
	public K save(K k) {
		k.save();
		return (K)k;
	}
	
	/**2016-09-13
	 * 根据ID查找
	 */
	public K findById(K k,String idValue) {
		return (K)k.findById(idValue);
	}
	
	/**2016-09-13
	 * 更新
	 */
	public boolean update(K k) {
		return k.update();
	}

	/**2016-09-13
	 * 删除
	 */
	public void deleteById(K k,String idValue){
		k.deleteById(idValue);
	}
	

}
