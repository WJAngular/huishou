package com.isongshu.huishou.skeleton.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;



public class DateUtil {
	public static SimpleDateFormat YYYYMMDD1 = new SimpleDateFormat("yyyy/MM/dd");
	public static SimpleDateFormat YYYYMMDD2 = new SimpleDateFormat("yyyyMMdd");
	public static SimpleDateFormat YYYYMMDD = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	public static SimpleDateFormat HHMMSS = new SimpleDateFormat("HH:mm:ss");
	
	
	public static Date nowDate(){
		return new Date();
	}
	
	/**
	 * 不带时分秒的事件格式化
	 *  默认  YYYYMMDD2
	 * @param date
	 * @return
	 */
	public static String formatDate(String date,SimpleDateFormat format){
		if(format == null)
			format = YYYYMMDD2;
		Calendar c = checkDateFormat(date);
		return format.format(c.getTime());
	}
	
	
	/**
	 * 时间往前加<date2>天
	 * @param date1
	 * @param date2
	 * @return
	 */
	public static String addDate(String date1,int date2){
		int res = -1;
		Calendar c1 = checkDateFormat(date1);
		c1.add(Calendar.DAY_OF_MONTH, date2);
		return YYYYMMDD1.format(c1.getTime());
	}
	
	/**
	 * 时间往前加<date2>月
	 * @param date1
	 * @param date2
	 * @return
	 */
	public static String addMonth(String date1,int months){
		int res = -1;
		Calendar c1 = checkDateFormat(date1);
		c1.add(Calendar.MONTH, months);
		return YYYYMMDD1.format(c1.getTime());
	}
	
	/**
	 * 判断    beginDate < date < endDate 之间
	 * @param beginDate 
	 * @param endDate
	 * @param date
	 * @return true:false
	 */
	public static boolean betweenDate(String beginDate,String endDate,String date){
		Calendar c1 = checkDateFormat(beginDate);
		Calendar c2 = checkDateFormat(endDate);
		Calendar c3 = checkDateFormat(date);
		if((beginDate.equals(date) || c1.before(c3)) && beFore(date,endDate)){
			return true;
		}
		return false;
	}
	
	/**
	 * 判断  beginDate < date 之间
	 * @param beginDate
	 * @param date
	 * @return
	 */
	public static boolean beFore(String beginDate,String date){
		Calendar c1 = checkDateFormat(beginDate);
		Calendar c2 = checkDateFormat(date);
		return c1.before(c2) ;
	}
	
	
	public static Calendar checkDateFormat(String date1){
		int year,month,day;
		date1 = date1.trim();
		if(date1.matches("\\d{4}/\\d{2}/\\d{2}")){
			date1=date1.replaceAll("/", "");
		}else if(date1.matches("\\d{4}-\\d{2}-\\d{2}")){
			date1=date1.replaceAll("-", "");
		}else if(date1.matches("\\d{4}\\d{2}\\d{2}")){
			
		}else if(date1.matches("\\d{4}/\\d{2}/\\d{2} \\d{2}:\\d{2}:\\d{2}")){
			date1 = date1.substring(0, 10);
			date1=date1.replaceAll("/", "");
		}else{
			return null;
		}
		year = Integer.parseInt(date1.substring(0, 4));
		month = Integer.parseInt(date1.substring(4, 6))-1;
		day  = Integer.parseInt(date1.substring(6, 8));
		
		Calendar c2 = Calendar.getInstance();
		c2.set(year, month, day);
		return c2;
	}
	
	
	/**
	 * 获取当期时间 包括时分秒
	 * @return 
	 */
	public static  String getNowDate0(){
		Date now = new Date();
		return YYYYMMDD.format(now);
	}
	
	/**
	 * 获取当期时间 包括时分秒
	 * @return 
	 */
	public static  String getNowDate1(){
		Date now = new Date();
		return YYYYMMDD2.format(now);
	}
	
	/**
	 * 获取当期时间
	 * @return
	 */
	public static  String getNowDate(){
		Date now = new Date();
		return YYYYMMDD1.format(now);
	}
	
	/**
	 * 获取当期时间 yyyy/MM/dd HH:mm:ss
	 * @return
	 */
	public static  String getCurrentTime(){
		Date now = new Date();
		return YYYYMMDD.format(now);
	}
	
	/**
	 * 获取当期时间 HH:mm:ss
	 * @return
	 */
	public static  String getCurrentHms(){
		Date now = new Date();
		return HHMMSS.format(now);
	}
	
	/**
	 * 产生下个月1号的时间
	 * @param d
	 * @return
	 */
	public static String nextMonthDay(String d){
		Calendar c = checkDateFormat(d);
		c.add(Calendar.MONTH, 1);
		c.set(Calendar.DATE, 1); 
		
		return YYYYMMDD1.format(c.getTime());
	}
	
	public static String getDateDay(String d){
		Calendar now = checkDateFormat(d);  
		int day = now.get(Calendar.DAY_OF_MONTH);
		return String.valueOf(day);
	}
	
	public static void main(String[] a){
//		System.out.println(compDate("2017/11/05","2017/11/05"));
//		System.out.println(subDate("2016/08/02","2016/08/11"));
//		System.out.println(addDate("20150809",3));
//		System.out.println(addMonth("2016/08/02",2));
//		System.out.println(YYYYMMDD2.format(checkDateFormat("2015/08/01").getTime()));
//		System.out.println(YYYYMMDD2.format(checkDateFormat("2015-08-01").getTime()));
//		System.out.println(YYYYMMDD2.format(checkDateFormat("20150801").getTime()));
//		System.out.println(YYYYMMDD2.format(checkDateFormat("2015/08/01 12:04:01").getTime()));
//		System.out.println(DateUtil.subDate( "2017/12/11","2017/11/27"));
//		System.out.println(DateUtil.formatDate("2016/05/21", null));
		
		//System.out.println( DateUtil.formatDate("2016/08/21 00:12:22", DateUtil.YYYYMMDD1));
		//SimpleDateFormat format = new SimpleDateFormat("DD");
		//System.out.println( DateUtil.formatDate("2016/08/21", format));
		
		Calendar now = checkDateFormat("2016/08/31");  
        System.out.println("日: " + now.get(Calendar.DAY_OF_MONTH));  
	}
}
