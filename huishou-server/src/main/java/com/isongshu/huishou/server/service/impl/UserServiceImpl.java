package com.isongshu.huishou.server.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.druid.util.StringUtils;
import com.isongshu.huishou.skeleton.model.User;
import com.isongshu.huishou.skeleton.service.UserService;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Table;
import com.jfinal.plugin.activerecord.TableMapping;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Resource
	private User userDao;
	@Resource
	private DbBaseServiceImpl dbBaseService;
	
	@Override
	public List<User> find(User user) {
		return dbBaseService.selectObjects(user);
	}

	@Override
	public Page<User> paginate(int pageNumber, int pageSize, User user) {
		List<Object> paramer = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		
		if(user != null){
			if(!StringUtils.isEmpty(user.getUsername())){
				sql.append(" and u.username like ? ");
				paramer.add("%"+user.getUsername()+"%");
			}
			if(!StringUtils.isEmpty(user.getStatus())){
				sql.append(" and u.status = ? ");
				paramer.add(user.getStatus());
			}
		}
		return userDao.paginate(pageNumber, pageSize, "select *", "from user u where 1=1 "+sql.toString()+" order by id desc",paramer.toArray());
	}

	@Override
	public void update(User user) {
		if (user == null) {
			return;
		}
		user.update();
	}

	@Override
	public User save(User user) {
		if (user == null) {
			return null;
		}
		user.save();
		return user;
	}

	@Override
	public User findById(String id) {
		User user = userDao.findById(id);
		return user;
	}

	@Override
	public void deleteById(String id) {
		userDao.deleteById(id);
		
	}

	@Override
	public void delete(User user) {
		user.delete();
	}

}
