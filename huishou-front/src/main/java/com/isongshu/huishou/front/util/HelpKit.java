package com.isongshu.huishou.front.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class HelpKit {

	private HelpKit(){
        
    }
    public static String getUUID(){
        return UUID.randomUUID().toString().replace("-", "");
    }
    
    public static String getCode(){
    	return (new Random().nextInt(9000)+1000)+"";
    }
    
    //18位订单号
    public static String getOrderId(){
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
    	return sdf.format(new Date())+(new Random().nextInt(9000)+1000);
    }
    
    
	/**
	 * 判断是访问者是PC客户端还是移动客户端
	 * 
	 * @param userAgent
	 * @return
	 */
	public static boolean isMobile(String userAgent)
	{
		if (null == userAgent)
		{
			userAgent = "";
		}

		// \b 是单词边界(连着的两个(字母字符 与 非字母字符) 之间的逻辑上的间隔),
		// 字符串在编译时会被转码一次,所以是 "\\b"
		// \B 是单词内部逻辑间隔(连着的两个字母字符之间的逻辑上的间隔)
		String phoneReg = "\\b(ip(hone|od)|android|opera m(ob|in)i" + "|windows (phone|ce)|blackberry"
				+ "|s(ymbian|eries60|amsung)|p(laybook|alm|rofile/midp" + "|laystation portable)|nokia|fennec|htc[-_]"
				+ "|mobile|up.browser|[1-4][0-9]{2}x[1-4][0-9]{2})\\b";

		String tableReg = "\\b(ipad|tablet|(Nexus 7)|up.browser" + "|[1-4][0-9]{2}x[1-4][0-9]{2})\\b";

		Pattern phonePat = Pattern.compile(phoneReg, Pattern.CASE_INSENSITIVE);
		Pattern tablePat = Pattern.compile(tableReg, Pattern.CASE_INSENSITIVE);

		// 匹配
		Matcher matcherPhone = phonePat.matcher(userAgent);
		Matcher matcherTable = tablePat.matcher(userAgent);

		if (matcherPhone.find() || matcherTable.find())
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	
}
