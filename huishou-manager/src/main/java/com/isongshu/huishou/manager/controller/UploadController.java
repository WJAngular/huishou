package com.isongshu.huishou.manager.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.isongshu.huishou.manager.interceptor.IsLoginInterceptor;
import com.jfinal.aop.Before;
import com.jfinal.plugin.spring.IocInterceptor;
import com.jfinal.upload.UploadFile;

@Before({ IocInterceptor.class, IsLoginInterceptor.class })
public class UploadController extends _Controller {
	private static Logger logger = LoggerFactory.getLogger(UploadController.class);
	
	public void index(){
		
	}
	
	public void uploads(){
	    UploadFile upfile = getFile();//JFinal规定getFile()必须最先执行
	    File file = upfile.getFile();
	    String filename = file.getName();
	    String delfilename = filename;
	    String imgurl = null;
	    if(filename!=null && !filename.equals("")){
	        filename = new SimpleDateFormat("yyyyMMddkkmmss").format(new Date())+"_"+filename;
	        /**
	         * 新保存的位置
	         */
	        String path = getRequest().getSession().getServletContext()
	                .getRealPath("");
	        String newPath = File.separator+"uploader"+File.separator+"uploads"+File.separator;//自定义目录  用于存放图片
	        /**
	         * 没有则新建目录
	         */
	        File floder = new File(path + newPath);
	        if (!floder.exists()) {
	            floder.mkdirs();
	        }
	        /**
	         * 保存新文件
	         */
	        FileInputStream fis = null;
	        FileOutputStream fos = null;
	        try{
	            File savePath = new File(path + newPath + filename);
	            if(!savePath.isDirectory()) savePath.createNewFile();
	            fis = new FileInputStream(file);
	            fos = new FileOutputStream(savePath);
	            byte[] bt = new byte[300];
	            while (fis.read(bt, 0, 300) != -1) {
	                fos.write(bt, 0, 300);
	            }
	        }catch(Exception e){
	            e.printStackTrace();
	        }finally{
	            try{
	                if(null!=fis) fis.close();
	                if(null!=fos) fos.close();
	            }catch(Exception e){
	                e.printStackTrace();
	            }
	        }

	        /**
	         * 删除原图片，JFinal默认上传文件路径为 /upload（自动创建）
	         */
	        File delFile = new File(path+File.separator+"upload"+File.separator+delfilename);
	        if(delFile.exists()){
	            delFile.delete();
	        }
	        imgurl = "http://" + this.getRequest().getServerName() + ":"
					+ this.getRequest().getServerPort() +this.getRequest().getContextPath() +"/uploader/uploads/"
					+ filename;
	        setAttr("msg",filename);
	        setAttr("imgurl",imgurl);
	        setAttr("t",1);
	    }else{
	        setAttr("t",0);
	    }
	    renderJson();
	}
}
