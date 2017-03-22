package com.isongshu.huishou.skeleton.service;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

public interface CommonService<T> {

	List<T>  find(T t);
	
	T findById(String id);

	Page<T> paginate(int pageNumber, int pageSize,T t);

	void update(T t);
	
	T save(T t);
	
	void deleteById(String id);
	
	void delete(T t) ;
	
}
