package com.isongshu.huishou.skeleton.util;

import java.io.Serializable;

public class JsonMessage  {

	private String status;
	private String code;
	private String message;
	private Object data;
	
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}

	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public void success() {
		this.status = "success";
	}
	public void error() {
		this.status = "error";
	}
}
