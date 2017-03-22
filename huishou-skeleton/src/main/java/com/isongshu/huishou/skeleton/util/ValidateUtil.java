package com.isongshu.huishou.skeleton.util;

import java.util.regex.Pattern;

public class ValidateUtil {

	/**
     * 正则表达式：验证手机号
     */
    public static final String REGEX_MOBILE = "^((13[0-9])|(14[^4,\\D])|(15[^4,\\D])|(17[0-9])|(18[0-9]))\\d{8}$";
  
    /**
     * 正则表达式：验证邮箱
     */
    public static final String REGEX_EMAIL = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
 
	
	/**
     * 校验手机号
     * 
     * @param mobile
     * @return 校验通过返回true，否则返回false
     */
    public static boolean isMobile(String mobile) {
    	try {
    		return Pattern.matches(REGEX_MOBILE, mobile);
		} catch (Exception e) {
			return false;
		}
    }
    
    /**
     * 校验邮箱
     * 
     * @param email
     * @return 校验通过返回true，否则返回false
     */
    public static boolean isEmail(String email) {
    	try {
    		return Pattern.matches(REGEX_EMAIL, email);
		} catch (Exception e) {
			return false;
		}
    }
    
    public static String isMobileOrEmail(String value){
    	if (isMobile(value)){
    		return "mobile";
    	}else if(isEmail(value)){
    		return "email";
    	}else{
    		return "";
    	}
    }
    
}
