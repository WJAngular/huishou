package com.isongshu.huishou.server.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.druid.util.StringUtils;
import com.isongshu.huishou.skeleton.model.CommentInfo;
import com.isongshu.huishou.skeleton.service.CommentInfoService;
import com.jfinal.plugin.activerecord.Page;

@Service("commentInfoService")
public class CommentInfoServiceImpl implements CommentInfoService {

	@Resource
	private CommentInfo commentInfoDao;

	@Override
	public List<CommentInfo> find(CommentInfo commentInfo) {
		List<Object> paramer = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		
		if(commentInfo != null){
			if(!StringUtils.isEmpty(commentInfo.getContactTel())){
				sql.append("and t." + commentInfo.getContactTelColumnName()+" = ?");
				paramer.add(commentInfo.getContactTel());
			}
		}
		return commentInfoDao.find( "select *  from comment_info t where 1=1 "+sql.toString()+" order by id desc",paramer.toArray());
	}

	@Override
	public CommentInfo findById(String id) {
		CommentInfo commentInfo = commentInfoDao.findById(id);
		return commentInfo;
	}

	@Override
	public Page<CommentInfo> paginate(int pageNumber, int pageSize, CommentInfo commentInfo) {
		List<Object> paramer = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		
		if(commentInfo != null){
			if(!StringUtils.isEmpty(commentInfo.getScore())){
				sql.append("and t."+commentInfo.getScoreColumnName()+" = ?");
				paramer.add(commentInfo.getScore());
			}
		}
		return commentInfoDao.paginate(pageNumber, pageSize, "select * ", 
				"from comment_info t where 1=1 "+sql.toString()+" order by id desc",paramer.toArray());
	}

	@Override
	public void update(CommentInfo commentInfo) {
		if (commentInfo == null) {
			return;
		}
		commentInfo.update();
	}

	@Override
	public CommentInfo save(CommentInfo commentInfo) {
		if (commentInfo == null) {
			return null;
		}
		commentInfo.save();
		return commentInfo;
	}

	@Override
	public void deleteById(String id) {
		commentInfoDao.deleteById(id);
	}

	@Override
	public void delete(CommentInfo commentInfo) {
		if (commentInfo == null) {
			return;
		}
		commentInfo.delete();
	}

}
