package com.isongshu.huishou.skeleton.service;

import java.util.List;

import com.isongshu.huishou.skeleton.model.NewsInfo;

public interface NewsInfoService extends CommonService<NewsInfo> {
	public List<NewsInfo> findOutNews();
	public List<NewsInfo> findInNews();
}
