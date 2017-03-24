package com.isongshu.huishou.server.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.druid.util.StringUtils;
import com.isongshu.huishou.skeleton.model.NewsInfo;
import com.isongshu.huishou.skeleton.service.NewsInfoService;
import com.jfinal.plugin.activerecord.Page;

@Service("newsInfoService")
public class NewsInfoServiceImpl implements NewsInfoService {

	@Resource
	private NewsInfo newsInfoDao;

	@Override
	public List<NewsInfo> find(NewsInfo newsInfo) {
		List<Object> paramer = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		
		if(newsInfo != null){
			if(!StringUtils.isEmpty(newsInfo.getType())){
				sql.append("and t."+newsInfo.getTypeColumnName()+" = ?");
				paramer.add(newsInfo.getType());
			}
			
			if(!StringUtils.isEmpty(newsInfo.getStatus())){
				sql.append("and t."+newsInfo.getStatusColumnName()+" = ?");
				paramer.add(newsInfo.getStatus());
			}
			
			if(!StringUtils.isEmpty(newsInfo.getTitle())){
				sql.append("and t."+newsInfo.getTitleColumnName()+" like ?");
				paramer.add("%"+newsInfo.getTitle()+"%");
			}
		}
		
		return newsInfoDao.find( "select *  from news_info t where 1=1 "+sql.toString()+" order by id desc",paramer.toArray());
	}

	@Override
	public NewsInfo findById(String id) {
		NewsInfo newsInfo = newsInfoDao.findById(id);
		return newsInfo;
	}

	@Override
	public Page<NewsInfo> paginate(int pageNumber, int pageSize, NewsInfo newsInfo) {
		List<Object> paramer = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		
		if(newsInfo != null){
			if(!StringUtils.isEmpty(newsInfo.getType())){
				sql.append("and t."+newsInfo.getTypeColumnName()+" = ?");
				paramer.add(newsInfo.getType());
			}
			
			if(!StringUtils.isEmpty(newsInfo.getStatus())){
				sql.append("and t."+newsInfo.getStatusColumnName()+" = ?");
				paramer.add(newsInfo.getStatus());
			}
			
			if(!StringUtils.isEmpty(newsInfo.getTitle())){
				sql.append("and t."+newsInfo.getTitleColumnName()+" like ?");
				paramer.add("%"+newsInfo.getTitle()+"%");
			}
		}
		return newsInfoDao.paginate(pageNumber, pageSize, "select * ", 
				"from news_info t where 1=1 "+sql.toString()+" order by id desc",paramer.toArray());
	}

	@Override
	public void update(NewsInfo newsInfo) {
		if (newsInfo == null) {
			return;
		}
		newsInfo.update();
	}

	@Override
	public NewsInfo save(NewsInfo newsInfo) {
		if (newsInfo == null) {
			return null;
		}
		newsInfo.save();
		return newsInfo;
	}

	@Override
	public void deleteById(String id) {
		newsInfoDao.deleteById(id);
	}

	@Override
	public void delete(NewsInfo newsInfo) {
		if (newsInfo == null) {
			return;
		}
		newsInfo.delete();
	}

}
