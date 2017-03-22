package com.isongshu.huishou.server.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.druid.util.StringUtils;
import com.isongshu.huishou.skeleton.model.OtherJoin;
import com.isongshu.huishou.skeleton.model.OtherJoin;
import com.isongshu.huishou.skeleton.service.OtherJoinService;
import com.jfinal.plugin.activerecord.Page;

@Service("otherJoinService")
public class OtherJoinServiceImpl implements OtherJoinService{

	@Resource
	private OtherJoin otherJoinDao;
	@Resource
	private DbBaseServiceImpl dbBaseService;
	
	@Override
	public List<OtherJoin> find(OtherJoin otherJoin) {
		return dbBaseService.selectObjects(otherJoin);
	}

	@Override
	public Page<OtherJoin> paginate(int pageNumber, int pageSize, OtherJoin otherJoin) {
		
		List<Object> paramer = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		
		if(otherJoin != null){
			if(!StringUtils.isEmpty(otherJoin.getAddress())){
				sql.append(" and t.address like ? ");
				paramer.add("%"+otherJoin.getAddress()+"%");
			}
			
			if(!StringUtils.isEmpty(otherJoin.getContact())){
				sql.append(" and t.contact like ? ");
				paramer.add("%"+otherJoin.getContact()+"%");
			}
			
			if(!StringUtils.isEmpty(otherJoin.getTel())){
				sql.append(" and t.tel like ? ");
				paramer.add("%"+otherJoin.getTel()+"%");
			}
			
		}
		return otherJoinDao.paginate(pageNumber, pageSize, "select *", "from other_join t where 1=1 "+sql.toString()+" order by id desc",paramer.toArray());
	
	}

	@Override
	public void update(OtherJoin otherJoin) {
		if (otherJoin == null) {
			return;
		}
		otherJoin.update();
	}

	@Override
	public OtherJoin save(OtherJoin otherJoin) {
		if (otherJoin == null) {
			return null;
		}
		otherJoin.save();
		return otherJoin;
	}

	@Override
	public OtherJoin findById(String id) {
		OtherJoin otherJoin = otherJoinDao.findById(id);
		return otherJoin;
	}

	@Override
	public void deleteById(String id) {
		otherJoinDao.deleteById(id);
		
	}

	@Override
	public void delete(OtherJoin otherJoin) {
		otherJoin.delete();
	}

}
