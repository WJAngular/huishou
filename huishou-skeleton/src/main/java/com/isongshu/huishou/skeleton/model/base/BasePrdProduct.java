package com.isongshu.huishou.skeleton.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BasePrdProduct<M extends BasePrdProduct<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Integer id) {
		set("id", id);
	}

	public java.lang.Integer getId() {
		return get("id");
	}

	public String getIdColumnName() {
		return "id";
	}

	public void setClazzId(java.lang.Integer clazzId) {
		set("clazzId", clazzId);
	}

	public java.lang.Integer getClazzId() {
		return get("clazzId");
	}

	public String getClazzIdColumnName() {
		return "clazzId";
	}

	public void setBrandId(java.lang.Integer brandId) {
		set("brandId", brandId);
	}

	public java.lang.Integer getBrandId() {
		return get("brandId");
	}

	public String getBrandIdColumnName() {
		return "brandId";
	}

	public void setPrdPackageId(java.lang.Integer prdPackageId) {
		set("prdPackageId", prdPackageId);
	}

	public java.lang.Integer getPrdPackageId() {
		return get("prdPackageId");
	}

	public String getPrdPackageIdColumnName() {
		return "prdPackageId";
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

	public void setIsHot(java.lang.String isHot) {
		set("isHot", isHot);
	}

	public java.lang.String getIsHot() {
		return get("isHot");
	}

	public String getIsHotColumnName() {
		return "isHot";
	}

	public void setIsBan(java.lang.String isBan) {
		set("isBan", isBan);
	}

	public java.lang.String getIsBan() {
		return get("isBan");
	}

	public String getIsBanColumnName() {
		return "isBan";
	}

	public void setImgUrlThumb(java.lang.String imgUrlThumb) {
		set("imgUrlThumb", imgUrlThumb);
	}

	public java.lang.String getImgUrlThumb() {
		return get("imgUrlThumb");
	}

	public String getImgUrlThumbColumnName() {
		return "imgUrlThumb";
	}

	public void setImgUrl(java.lang.String imgUrl) {
		set("imgUrl", imgUrl);
	}

	public java.lang.String getImgUrl() {
		return get("imgUrl");
	}

	public String getImgUrlColumnName() {
		return "imgUrl";
	}

	public void setHasRecycleQuantity(java.lang.Integer hasRecycleQuantity) {
		set("hasRecycleQuantity", hasRecycleQuantity);
	}

	public java.lang.Integer getHasRecycleQuantity() {
		return get("hasRecycleQuantity");
	}

	public String getHasRecycleQuantityColumnName() {
		return "hasRecycleQuantity";
	}

	public void setRecycleMaxMoney(java.lang.Integer recycleMaxMoney) {
		set("recycleMaxMoney", recycleMaxMoney);
	}

	public java.lang.Integer getRecycleMaxMoney() {
		return get("recycleMaxMoney");
	}

	public String getRecycleMaxMoneyColumnName() {
		return "recycleMaxMoney";
	}

	public void setBasePrice(java.lang.Integer basePrice) {
		set("basePrice", basePrice);
	}

	public java.lang.Integer getBasePrice() {
		return get("basePrice");
	}

	public String getBasePriceColumnName() {
		return "basePrice";
	}

	public void setLimitPrice(java.lang.Integer limitPrice) {
		set("limitPrice", limitPrice);
	}

	public java.lang.Integer getLimitPrice() {
		return get("limitPrice");
	}

	public String getLimitPriceColumnName() {
		return "limitPrice";
	}

	public void setBasePriceCombine(java.lang.String basePriceCombine) {
		set("basePriceCombine", basePriceCombine);
	}

	public java.lang.String getBasePriceCombine() {
		return get("basePriceCombine");
	}

	public String getBasePriceCombineColumnName() {
		return "basePriceCombine";
	}

	public void setRemark(java.lang.String remark) {
		set("remark", remark);
	}

	public java.lang.String getRemark() {
		return get("remark");
	}

	public String getRemarkColumnName() {
		return "remark";
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