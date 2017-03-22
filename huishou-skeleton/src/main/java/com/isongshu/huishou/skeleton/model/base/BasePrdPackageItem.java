package com.isongshu.huishou.skeleton.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BasePrdPackageItem<M extends BasePrdPackageItem<M>> extends Model<M> implements IBean {

	public void setPackageId(java.lang.Integer packageId) {
		set("packageId", packageId);
	}

	public java.lang.Integer getPackageId() {
		return get("packageId");
	}

	public String getPackageIdColumnName() {
		return "packageId";
	}

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

	public void setValue(java.math.BigDecimal value) {
		set("value", value);
	}

	public java.math.BigDecimal getValue() {
		return get("value");
	}

	public String getValueColumnName() {
		return "value";
	}

	public void setSelOpt(java.lang.String selOpt) {
		set("selOpt", selOpt);
	}

	public java.lang.String getSelOpt() {
		return get("selOpt");
	}

	public String getSelOptColumnName() {
		return "selOpt";
	}

	public void setLevel(java.lang.Integer level) {
		set("level", level);
	}

	public java.lang.Integer getLevel() {
		return get("level");
	}

	public String getLevelColumnName() {
		return "level";
	}

	public void setSeq(java.lang.Integer seq) {
		set("seq", seq);
	}

	public java.lang.Integer getSeq() {
		return get("seq");
	}

	public String getSeqColumnName() {
		return "seq";
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
