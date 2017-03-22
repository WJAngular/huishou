package com.isongshu.huishou.server.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.druid.util.StringUtils;
import com.isongshu.huishou.skeleton.model.OrderInfo;
import com.isongshu.huishou.skeleton.service.OrderInfoService;
import com.jfinal.plugin.activerecord.Page;

@Service("orderInfoService")
public class OrderInfoServiceImpl implements OrderInfoService{

	@Resource
	private OrderInfo orderInfoDao;
	@Resource
	private DbBaseServiceImpl dbBaseService;
	
	@Override
	public List<OrderInfo> find(OrderInfo orderInfo) {
		List<Object> paramer = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		
		if(orderInfo != null){
			
			//这里展示用户的订单信息
			if(!StringUtils.isEmpty(orderInfo.getContactTel())){
				sql.append(" and t."+orderInfo.getContactTelColumnName()+" = ? ");
				paramer.add(orderInfo.getContactTel());
			}
			
			if(!StringUtils.isEmpty(orderInfo.getOrderId())){
				sql.append(" and t."+orderInfo.getOrderIdColumnName()+" like ? ");
				paramer.add("%"+orderInfo.getOrderId()+"%");
			}
			
			if(!StringUtils.isEmpty(orderInfo.getUserName())){
				sql.append(" and t."+orderInfo.getUserNameColumnName()+" like ? ");
				paramer.add("%"+orderInfo.getUserName()+"%");
			}
			
			if(!StringUtils.isEmpty(orderInfo.getPrdProductName())){
				sql.append(" and t."+orderInfo.getPrdProductNameColumnName()+" like ? ");
				paramer.add("%"+orderInfo.getPrdProductName()+"%");
			}
			
			if(!StringUtils.isEmpty(orderInfo.getRecycleType())){
				sql.append(" and t."+orderInfo.getRecycleTypeColumnName()+" = ? ");
				paramer.add(orderInfo.getRecycleType());
			}
			
			
			if(!StringUtils.isEmpty(orderInfo.getPayType())){
				sql.append(" and t."+orderInfo.getPayTypeColumnName()+" = ? ");
				paramer.add(orderInfo.getPayType());
			}
			
			if(!StringUtils.isEmpty(orderInfo.getStatus())){
				sql.append(" and t."+orderInfo.getStatusColumnName()+" = ? ");
				paramer.add(orderInfo.getStatus());
			}
			
		}
		
		return orderInfoDao.find( "select *  from order_info t where 1=1 "+sql.toString()+" order by id desc",paramer.toArray());
	}

	@Override
	public Page<OrderInfo> paginate(int pageNumber, int pageSize, OrderInfo orderInfo) {
		
		List<Object> paramer = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		
		if(orderInfo != null){
			
			//这里展示用户的订单信息
			if(!StringUtils.isEmpty(orderInfo.getContactTel())){
				sql.append(" and t."+orderInfo.getContactTelColumnName()+" = ? ");
				paramer.add(orderInfo.getContactTel());
			}
			
			
			if(!StringUtils.isEmpty(orderInfo.getOrderId())){
				sql.append(" and t."+orderInfo.getOrderIdColumnName()+" like ? ");
				paramer.add("%"+orderInfo.getOrderId()+"%");
			}
			
			if(!StringUtils.isEmpty(orderInfo.getUserName())){
				sql.append(" and t."+orderInfo.getUserNameColumnName()+" like ? ");
				paramer.add("%"+orderInfo.getUserName()+"%");
			}
			
			if(!StringUtils.isEmpty(orderInfo.getPrdProductName())){
				sql.append(" and t."+orderInfo.getPrdProductNameColumnName()+" like ? ");
				paramer.add("%"+orderInfo.getPrdProductName()+"%");
			}
			
			if(!StringUtils.isEmpty(orderInfo.getRecycleType())){
				sql.append(" and t."+orderInfo.getRecycleTypeColumnName()+" = ? ");
				paramer.add(orderInfo.getRecycleType());
			}
			
			
			if(!StringUtils.isEmpty(orderInfo.getPayType())){
				sql.append(" and t."+orderInfo.getPayTypeColumnName()+" = ? ");
				paramer.add(orderInfo.getPayType());
			}
			
			if(!StringUtils.isEmpty(orderInfo.getStatus())){
				sql.append(" and t."+orderInfo.getStatusColumnName()+" = ? ");
				paramer.add(orderInfo.getStatus());
			}
			
		}
		
		return orderInfoDao.paginate(pageNumber, pageSize, "select * ", 
									"from order_info t where 1=1 "+sql.toString()+" order by id desc",paramer.toArray());
	}

	@Override
	public void update(OrderInfo orderInfo) {
		if (orderInfo == null) {
			return;
		}
		orderInfo.update();
	}

	@Override
	public OrderInfo save(OrderInfo orderInfo) {
		if (orderInfo == null) {
			return null;
		}
		orderInfo.save();
		return orderInfo;
	}

	@Override
	public OrderInfo findById(String id) {
		OrderInfo orderInfo = orderInfoDao.findById(id);
		return orderInfo;
	}

	@Override
	public void deleteById(String id) {
		orderInfoDao.deleteById(id);
		
	}

	@Override
	public void delete(OrderInfo orderInfo) {
		orderInfo.delete();
	}

}
