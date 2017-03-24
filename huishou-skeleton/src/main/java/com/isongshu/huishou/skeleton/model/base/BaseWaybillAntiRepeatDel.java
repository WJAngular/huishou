package com.isongshu.huishou.skeleton.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseWaybillAntiRepeatDel<M extends BaseWaybillAntiRepeatDel<M>> extends Model<M> implements IBean {

	public void setSourceCode(java.lang.String sourceCode) {
		set("source_code", sourceCode);
	}

	public java.lang.String getSourceCode() {
		return get("source_code");
	}

	public String getSourceCodeColumnName() {
		return "source_code";
	}

	public void setBizType(java.lang.String bizType) {
		set("biz_type", bizType);
	}

	public java.lang.String getBizType() {
		return get("biz_type");
	}

	public String getBizTypeColumnName() {
		return "biz_type";
	}

	public void setWaybillNo(java.lang.String waybillNo) {
		set("waybill_no", waybillNo);
	}

	public java.lang.String getWaybillNo() {
		return get("waybill_no");
	}

	public String getWaybillNoColumnName() {
		return "waybill_no";
	}

	public void setCreateTime(java.util.Date createTime) {
		set("create_time", createTime);
	}

	public java.util.Date getCreateTime() {
		return get("create_time");
	}

	public String getCreateTimeColumnName() {
		return "create_time";
	}

}