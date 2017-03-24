package com.isongshu.huishou.skeleton.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseSysParam<M extends BaseSysParam<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Integer id) {
		set("id", id);
	}

	public java.lang.Integer getId() {
		return get("id");
	}

	public String getIdColumnName() {
		return "id";
	}

	public void setParamType(java.lang.String paramType) {
		set("paramType", paramType);
	}

	public java.lang.String getParamType() {
		return get("paramType");
	}

	public String getParamTypeColumnName() {
		return "paramType";
	}

	public void setParamCode(java.lang.String paramCode) {
		set("paramCode", paramCode);
	}

	public java.lang.String getParamCode() {
		return get("paramCode");
	}

	public String getParamCodeColumnName() {
		return "paramCode";
	}

	public void setParamDesc(java.lang.String paramDesc) {
		set("paramDesc", paramDesc);
	}

	public java.lang.String getParamDesc() {
		return get("paramDesc");
	}

	public String getParamDescColumnName() {
		return "paramDesc";
	}

	public void setStatus(java.lang.String status) {
		set("status", status);
	}

	public java.lang.String getStatus() {
		return get("status");
	}

	public String getStatusColumnName() {
		return "status";
	}

	public void setCreateTime(java.util.Date createTime) {
		set("createTime", createTime);
	}

	public java.util.Date getCreateTime() {
		return get("createTime");
	}

	public String getCreateTimeColumnName() {
		return "createTime";
	}

	public void setCreateUser(java.lang.String createUser) {
		set("createUser", createUser);
	}

	public java.lang.String getCreateUser() {
		return get("createUser");
	}

	public String getCreateUserColumnName() {
		return "createUser";
	}

}