package com.isongshu.huishou.skeleton.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseUserAdmin<M extends BaseUserAdmin<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Integer id) {
		set("id", id);
	}

	public java.lang.Integer getId() {
		return get("id");
	}

	public String getIdColumnName() {
		return "id";
	}

	public void setUsername(java.lang.String username) {
		set("username", username);
	}

	public java.lang.String getUsername() {
		return get("username");
	}

	public String getUsernameColumnName() {
		return "username";
	}

	public void setPassword(java.lang.String password) {
		set("password", password);
	}

	public java.lang.String getPassword() {
		return get("password");
	}

	public String getPasswordColumnName() {
		return "password";
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
