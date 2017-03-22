package com.isongshu.huishou.server.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.druid.util.StringUtils;
import com.isongshu.huishou.skeleton.model.OtherBigRecycle;
import com.isongshu.huishou.skeleton.model.OtherBigRecycle;
import com.isongshu.huishou.skeleton.service.OtherBigRecycleService;
import com.jfinal.plugin.activerecord.Page;

@Service("otherBigRecycleService")
public class OtherBigRecycleServiceImpl implements OtherBigRecycleService{

	@Resource
	private OtherBigRecycle otherBigRecycleDao;
	@Resource
	private DbBaseServiceImpl dbBaseService;
	
	@Override
	public List<OtherBigRecycle> find(OtherBigRecycle otherBigRecycle) {
		return dbBaseService.selectObjects(otherBigRecycle);
	}

	
	@Override
	public Page<OtherBigRecycle> paginate(int pageNumber, int pageSize, OtherBigRecycle otherBigRecycle) {
		List<Object> paramer = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		
		if(otherBigRecycle != null){
			if(!StringUtils.isEmpty(otherBigRecycle.getCompany())){
				sql.append(" and t.company like ? ");
				paramer.add("%"+otherBigRecycle.getCompany()+"%");
			}
			
			if(!StringUtils.isEmpty(otherBigRecycle.getContact())){
				sql.append(" and t.contact like ? ");
				paramer.add("%"+otherBigRecycle.getContact()+"%");
			}
			
			if(!StringUtils.isEmpty(otherBigRecycle.getTel())){
				sql.append(" and t.tel like ? ");
				paramer.add("%"+otherBigRecycle.getTel()+"%");
			}
			
		}
		return otherBigRecycleDao.paginate(pageNumber, pageSize, "select *", "from other_big_recycle t where 1=1 "+sql.toString()+" order by id desc",paramer.toArray());
	
	}

	@Override
	public void update(OtherBigRecycle otherBigRecycle) {
		if (otherBigRecycle == null) {
			return;
		}
		otherBigRecycle.update();
	}

	@Override
	public OtherBigRecycle save(OtherBigRecycle otherBigRecycle) {
		if (otherBigRecycle == null) {
			return null;
		}
		otherBigRecycle.save();
		return otherBigRecycle;
	}

	@Override
	public OtherBigRecycle findById(String id) {
		OtherBigRecycle otherBigRecycle = otherBigRecycleDao.findById(id);
		return otherBigRecycle;
	}

	@Override
	public void deleteById(String id) {
		otherBigRecycleDao.deleteById(id);
		
	}

	@Override
	public void delete(OtherBigRecycle otherBigRecycle) {
		otherBigRecycle.delete();
	}

}
