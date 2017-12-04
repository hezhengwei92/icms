package com.icms.cms.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseTaskContent<M extends BaseTaskContent<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Integer id) {
		set("id", id);
	}

	public java.lang.Integer getId() {
		return get("id");
	}

	public void setContentId(java.lang.Long contentId) {
		set("content_id", contentId);
	}

	public java.lang.Long getContentId() {
		return get("content_id");
	}

	public void setExp(java.lang.String exp) {
		set("exp", exp);
	}

	public java.lang.String getExp() {
		return get("exp");
	}

	public void setStatus(java.lang.Boolean status) {
		set("status", status);
	}

	public java.lang.Boolean getStatus() {
		return get("status");
	}

	public void setDateTime(java.util.Date dateTime) {
		set("date_time", dateTime);
	}

	public java.util.Date getDateTime() {
		return get("date_time");
	}

}