package com.isongshu.huishou.skeleton.service;


import java.util.List;

import com.isongshu.huishou.skeleton.model.Code;
import com.isongshu.huishou.skeleton.model.SysParam;
import com.jfinal.plugin.activerecord.Page;

public interface SmsService extends CommonService<Code>{
	
	//判定短信发送量
	public boolean sendOverLimit(Code code);
	
	//发送短信
	public void send(Code code);
	
	//获取2分钟内的短信验证码
	public boolean isCodeCorrect(Code code);
	
}
