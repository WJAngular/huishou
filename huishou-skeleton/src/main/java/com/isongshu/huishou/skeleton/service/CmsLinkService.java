package com.isongshu.huishou.skeleton.service;

import java.util.List;

import com.isongshu.huishou.skeleton.model.CmsLink;

public interface CmsLinkService extends CommonService<CmsLink>{
	List<CmsLink> findOrderByCreateTime();
}
