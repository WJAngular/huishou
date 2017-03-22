package com.isongshu.huishou.server.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.isongshu.huishou.skeleton.model.NewsInfo;
import com.isongshu.huishou.skeleton.service.NewsInfoService;
import com.jfinal.plugin.activerecord.Page;

@Service("newsInfoService")
public class NewsInfoServiceImpl implements NewsInfoService {

	@Resource
	NewsInfo newsInfoDao;

	@Override
	public List<NewsInfo> find(NewsInfo t) {
		return null;
	}

	@Override
	public NewsInfo findById(String id) {
		NewsInfo newsInfo = newsInfoDao.findById(id);
		return newsInfo;
	}

	@Override
	public Page<NewsInfo> paginate(int pageNumber, int pageSize, NewsInfo t) {
		return null;
	}

	@Override
	public void update(NewsInfo t) {
		if (t == null) {
			return;
		}
		newsInfoDao.update();
	}

	@Override
	public NewsInfo save(NewsInfo t) {
		if (t == null) {
			return null;
		}
		newsInfoDao.save();
		return t;
	}

	@Override
	public void deleteById(String id) {
		newsInfoDao.deleteById(id);
	}

	@Override
	public void delete(NewsInfo t) {
		if (t == null) {
			return;
		}
		newsInfoDao.delete();
	}

}
