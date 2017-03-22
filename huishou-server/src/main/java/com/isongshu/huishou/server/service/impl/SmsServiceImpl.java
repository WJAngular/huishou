package com.isongshu.huishou.server.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.isongshu.huishou.skeleton.model.Code;
import com.isongshu.huishou.skeleton.model.SysParam;
import com.isongshu.huishou.skeleton.service.SmsService;
import com.isongshu.huishou.skeleton.util.SMS;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Table;
import com.jfinal.plugin.activerecord.TableMapping;

@Service("smsService")
public class SmsServiceImpl implements SmsService{

	@Resource
	private Code codeDao;
	
	
	
	
	//判定短信发送量
	public boolean sendOverLimit(Code code){
		//一天内发送的验证码次数
		Code c = codeDao.findFirst("select count(*) from code where mobile = ? and  to_days(createTime) = to_days(now()) ",code.getMobile());
		long times =  c.getLong("count(*)");
		if(times < 10){
			return false;
		}else{
			return true;
		}
	}
		
		
	
	//发送短信
	public void send(Code code){
		SMS.sendCode(code.getMobile(), code.getCode());
		code.save();
	}
	
	
	//获取2分钟内的短信验证码
	public boolean isCodeCorrect(Code code){
		Code c = codeDao.findFirst("select * from code where mobile = ? and code = ? and  TIME_TO_SEC(TIMEDIFF(now(),createTime)) < 130 ",code.getMobile(), code.getCode());
		if(c == null){
			return false;
		}else{
			return true;
		}
		
	}



	@Override
	public List<Code> find(Code t) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public Code findById(String id) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public Page<Code> paginate(int pageNumber, int pageSize, Code t) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public void update(Code t) {
		// TODO Auto-generated method stub
		
	}



	@Override
	public Code save(Code t) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public void deleteById(String id) {
		// TODO Auto-generated method stub
		
	}



	@Override
	public void delete(Code t) {
		// TODO Auto-generated method stub
		
	}
	
	
	

}
