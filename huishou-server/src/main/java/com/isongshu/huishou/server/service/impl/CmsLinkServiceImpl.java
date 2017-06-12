package com.isongshu.huishou.server.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.isongshu.huishou.skeleton.model.CmsLink;
import com.isongshu.huishou.skeleton.service.CmsLinkService;
import com.jfinal.plugin.activerecord.Page;

@Service("cmsLinkService")
public class CmsLinkServiceImpl implements CmsLinkService {

	@Resource
	private CmsLink cmsLinkDao;

	@Override
	public List<CmsLink> find(CmsLink cmsLink) {
		List<Object> paramer = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		
		if(cmsLink != null){
			if(!StringUtils.isEmpty(cmsLink.getLinkType())){
				sql.append("and t."+cmsLink.getLinkTypeColumnName()+" = ?");
				paramer.add(cmsLink.getLinkType());
			}
			
			if(!StringUtils.isEmpty(cmsLink.getIsvalid())){
				sql.append("and t."+cmsLink.getIsvalidColumnName()+" = ?");
				paramer.add(cmsLink.getIsvalid());
			}
			
			if(!StringUtils.isEmpty(cmsLink.getLinkName())){
				sql.append("and t."+cmsLink.getLinkNameColumnName()+" like ?");
				paramer.add("%"+cmsLink.getLinkName()+"%");
			}
		}
		
		return cmsLinkDao.find( "select *  from Cms_Link t where 1=1 "+sql.toString()+" order by id desc",paramer.toArray());
	}

	@Override
	public CmsLink findById(String id) {
		CmsLink cmsLink = cmsLinkDao.findById(id);
		return cmsLink;
	}

	@Override
	public Page<CmsLink> paginate(int pageNumber, int pageSize, CmsLink cmsLink) {
		List<Object> paramer = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		
		if(cmsLink != null){
			if(!StringUtils.isEmpty(cmsLink.getLinkType())){
				sql.append("and t."+cmsLink.getLinkTypeColumnName()+" = ?");
				paramer.add(cmsLink.getLinkType());
			}
			
			if(!StringUtils.isEmpty(cmsLink.getIsvalid())){
				sql.append("and t."+cmsLink.getIsvalidColumnName()+" = ?");
				paramer.add(cmsLink.getIsvalid());
			}
			
			if(!StringUtils.isEmpty(cmsLink.getLinkName())){
				sql.append("and t."+cmsLink.getLinkNameColumnName()+" like ?");
				paramer.add("%"+cmsLink.getLinkName()+"%");
			}
		}
		return cmsLinkDao.paginate(pageNumber, pageSize, "select * ", 
				"from Cms_Link t where 1=1 "+sql.toString()+" order by id desc",paramer.toArray());
	}

	@Override
	public void update(CmsLink cmsLink) {
		if (cmsLink == null) {
			return;
		}
		cmsLink.update();
	}

	@Override
	public CmsLink save(CmsLink cmsLink) {
		if (cmsLink == null) {
			return null;
		}
		cmsLink.save();
		return cmsLink;
	}

	@Override
	public void deleteById(String id) {
		cmsLinkDao.deleteById(id);
	}

	@Override
	public void delete(CmsLink cmsLink) {
		if (cmsLink == null) {
			return;
		}
		cmsLink.delete();
	}

	@Override
	public List<CmsLink> findOrderByCreateTime() {
		List<Object> paramer = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append("and t.isValid = 'Y'");
		return cmsLinkDao.find( "select *  from Cms_Link t where 1=1 "+sql.toString()+" order by createTime desc",paramer.toArray());
	}


}
