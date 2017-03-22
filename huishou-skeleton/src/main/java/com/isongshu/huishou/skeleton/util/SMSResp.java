package com.isongshu.huishou.skeleton.util;

public class SMSResp {

	public String error_code;
	public String reason;
	public String result;
	public String getError_code() {
		return error_code;
	}
	public void setError_code(String error_code) {
		this.error_code = error_code;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	@Override
	public String toString() {
		return "SMSResp [error_code=" + error_code + ", reason=" + reason
				+ ", result=" + result + "]";
	}
	
}
