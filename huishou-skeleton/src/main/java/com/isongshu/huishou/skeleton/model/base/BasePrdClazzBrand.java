package com.isongshu.huishou.skeleton.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BasePrdClazzBrand<M extends BasePrdClazzBrand<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Integer id) {
		set("id", id);
	}

	public java.lang.Integer getId() {
		return get("id");
	}

	public String getIdColumnName() {
		return "id";
	}

	public void setPId(java.lang.Integer pId) {
		set("pId", pId);
	}

	public java.lang.Integer getPId() {
		return get("pId");
	}

	public String getPIdColumnName() {
		return "pId";
	}

	public void setName(java.lang.String name) {
		set("name", name);
	}

	public java.lang.String getName() {
		return get("name");
	}

	public String getNameColumnName() {
		return "name";
	}

	public void setIsShow(java.lang.String isShow) {
		set("isShow", isShow);
	}

	public java.lang.String getIsShow() {
		return get("isShow");
	}

	public String getIsShowColumnName() {
		return "isShow";
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
