package com.isongshu.huishou.skeleton.model.sql;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import com.jfinal.plugin.activerecord.Config;
import com.jfinal.plugin.activerecord.DbKit;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.ModelBuilder;

public class ExModel<M extends ExModel> extends Model<M>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 查询单一记录
	 * @return
	 */
//	public M findOneRecored(){
//		Class c = getClass();
//		Class ModleClass =  c.getName().indexOf("EnhancerByCGLIB") == -1 ? c : c.getSuperclass();
//		
//		Config config = DbKit.getConfig(ModleClass);
//		Class<? extends Model> modelClass = ModleClass;
//		if (config.devMode)
//			checkTableName(modelClass, sql);
//		
//		
//		
//		
//		PreparedStatement pst = conn.prepareStatement(sql);
//		config.dialect.fillStatement(pst, paras);
//		ResultSet rs = pst.executeQuery();
//		List<M> result = ModelBuilder.build(rs, modelClass);
//		DbKit.close(rs, pst);
//		return result;
//		
//	}

}
