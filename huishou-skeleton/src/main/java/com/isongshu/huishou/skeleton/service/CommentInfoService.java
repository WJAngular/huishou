package com.isongshu.huishou.skeleton.service;

import java.util.List;

import com.isongshu.huishou.skeleton.model.CommentInfo;

public interface CommentInfoService extends CommonService<CommentInfo>{
	List<CommentInfo> findGoodScoredAndOrderByCreateTime();
}
