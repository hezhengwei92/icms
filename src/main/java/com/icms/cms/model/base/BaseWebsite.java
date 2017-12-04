package com.icms.cms.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseWebsite<M extends BaseWebsite<M>> extends Model<M> implements IBean {

	public void setSiteId(java.lang.Integer siteId) {
		set("site_id", siteId);
	}

	public java.lang.Integer getSiteId() {
		return get("site_id");
	}

	public void setSitename(java.lang.String sitename) {
		set("sitename", sitename);
	}

	public java.lang.String getSitename() {
		return get("sitename");
	}

	public void setDomain(java.lang.String domain) {
		set("domain", domain);
	}

	public java.lang.String getDomain() {
		return get("domain");
	}

	public void setLanguage(java.lang.String language) {
		set("language", language);
	}

	public java.lang.String getLanguage() {
		return get("language");
	}

	public void setTemplate(java.lang.String template) {
		set("template", template);
	}

	public java.lang.String getTemplate() {
		return get("template");
	}

	public void setTitle(java.lang.String title) {
		set("title", title);
	}

	public java.lang.String getTitle() {
		return get("title");
	}

	public void setKeyword(java.lang.String keyword) {
		set("keyword", keyword);
	}

	public java.lang.String getKeyword() {
		return get("keyword");
	}

	public void setDescription(java.lang.String description) {
		set("description", description);
	}

	public java.lang.String getDescription() {
		return get("description");
	}

	public void setIsMobile(java.lang.Boolean isMobile) {
		set("is_mobile", isMobile);
	}

	public java.lang.Boolean getIsMobile() {
		return get("is_mobile");
	}

	public void setMobileTpl(java.lang.String mobileTpl) {
		set("mobile_tpl", mobileTpl);
	}

	public java.lang.String getMobileTpl() {
		return get("mobile_tpl");
	}

}