package com.icms.cms.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseAd<M extends BaseAd<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Integer id) {
		set("id", id);
	}

	public java.lang.Integer getId() {
		return get("id");
	}

	public void setName(java.lang.String name) {
		set("name", name);
	}

	public java.lang.String getName() {
		return get("name");
	}

	public void setUrl(java.lang.String url) {
		set("url", url);
	}

	public java.lang.String getUrl() {
		return get("url");
	}

	public void setAdType(java.lang.Boolean adType) {
		set("ad_type", adType);
	}

	public java.lang.Boolean getAdType() {
		return get("ad_type");
	}

	public void setImg(java.lang.String img) {
		set("img", img);
	}

	public java.lang.String getImg() {
		return get("img");
	}

	public void setSort(java.lang.Integer sort) {
		set("sort", sort);
	}

	public java.lang.Integer getSort() {
		return get("sort");
	}

}
