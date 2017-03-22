package com.isongshu.huishou.server.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.druid.util.StringUtils;
import com.isongshu.huishou.skeleton.model.OtherNewProduct;
import com.isongshu.huishou.skeleton.model.OtherNewProduct;
import com.isongshu.huishou.skeleton.service.OtherNewProductService;
import com.jfinal.plugin.activerecord.Page;

@Service("otherNewProductService")
public class OtherNewProductServiceImpl implements OtherNewProductService{

	@Resource
	private OtherNewProduct otherNewProductDao;
	@Resource
	private DbBaseServiceImpl dbBaseService;
	
	@Override
	public List<OtherNewProduct> find(OtherNewProduct otherNewProduct) {
		return dbBaseService.selectObjects(otherNewProduct);
	}

	@Override
	public Page<OtherNewProduct> paginate(int pageNumber, int pageSize, OtherNewProduct otherNewProduct) {
		
		List<Object> paramer = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		
		if(otherNewProduct != null){
			if(!StringUtils.isEmpty(otherNewProduct.getBrand())){
				sql.append(" and t.brand like ? ");
				paramer.add("%"+otherNewProduct.getBrand()+"%");
			}
			
			if(!StringUtils.isEmpty(otherNewProduct.getName())){
				sql.append(" and t.name like ? ");
				paramer.add("%"+otherNewProduct.getName()+"%");
			}
			
		}
		return otherNewProductDao.paginate(pageNumber, pageSize, "select *", "from other_new_product t where 1=1 "+sql.toString()+" order by id desc",paramer.toArray());
	
	}

	@Override
	public void update(OtherNewProduct otherNewProduct) {
		if (otherNewProduct == null) {
			return;
		}
		otherNewProduct.update();
	}

	@Override
	public OtherNewProduct save(OtherNewProduct otherNewProduct) {
		if (otherNewProduct == null) {
			return null;
		}
		otherNewProduct.save();
		return otherNewProduct;
	}

	@Override
	public OtherNewProduct findById(String id) {
		OtherNewProduct otherNewProduct = otherNewProductDao.findById(id);
		return otherNewProduct;
	}

	@Override
	public void deleteById(String id) {
		otherNewProductDao.deleteById(id);
		
	}

	@Override
	public void delete(OtherNewProduct otherNewProduct) {
		otherNewProduct.delete();
	}

}
