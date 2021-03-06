package com.icms.cms.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseSearchWords<M extends BaseSearchWords<M>> extends Model<M> implements IBean {

	public void setWordId(java.lang.Integer wordId) {
		set("word_id", wordId);
	}

	public java.lang.Integer getWordId() {
		return get("word_id");
	}

	public void setName(java.lang.String name) {
		set("name", name);
	}

	public java.lang.String getName() {
		return get("name");
	}

	public void setHitCount(java.lang.Integer hitCount) {
		set("hit_count", hitCount);
	}

	public java.lang.Integer getHitCount() {
		return get("hit_count");
	}

	public void setIsRecommend(java.lang.Boolean isRecommend) {
		set("is_recommend", isRecommend);
	}

	public java.lang.Boolean getIsRecommend() {
		return get("is_recommend");
	}

	public void setSiteId(java.lang.Integer siteId) {
		set("site_id", siteId);
	}

	public java.lang.Integer getSiteId() {
		return get("site_id");
	}

}
