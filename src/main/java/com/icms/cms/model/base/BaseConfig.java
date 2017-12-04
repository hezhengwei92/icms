package com.icms.cms.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseConfig<M extends BaseConfig<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Integer Id) {
		set("Id", Id);
	}

	public java.lang.Integer getId() {
		return get("Id");
	}

	public void setAdminPath(java.lang.String adminPath) {
		set("admin_path", adminPath);
	}

	public java.lang.String getAdminPath() {
		return get("admin_path");
	}

	public void setUploadAllowtype(java.lang.String uploadAllowtype) {
		set("upload_allowType", uploadAllowtype);
	}

	public java.lang.String getUploadAllowtype() {
		return get("upload_allowType");
	}

	public void setUploadMax(java.lang.String uploadMax) {
		set("upload_max", uploadMax);
	}

	public java.lang.String getUploadMax() {
		return get("upload_max");
	}

	public void setHttpProtocol(java.lang.String httpProtocol) {
		set("http_protocol", httpProtocol);
	}

	public java.lang.String getHttpProtocol() {
		return get("http_protocol");
	}

	public void setDynamicSuffix(java.lang.String dynamicSuffix) {
		set("dynamic_suffix", dynamicSuffix);
	}

	public java.lang.String getDynamicSuffix() {
		return get("dynamic_suffix");
	}

	public void setAllowMemberReg(java.lang.Boolean allowMemberReg) {
		set("allow_member_reg", allowMemberReg);
	}

	public java.lang.Boolean getAllowMemberReg() {
		return get("allow_member_reg");
	}

	public void setMemberEmailCheck(java.lang.Boolean memberEmailCheck) {
		set("member_email_check", memberEmailCheck);
	}

	public java.lang.Boolean getMemberEmailCheck() {
		return get("member_email_check");
	}

	public void setEmailSsl(java.lang.Boolean emailSsl) {
		set("email_ssl", emailSsl);
	}

	public java.lang.Boolean getEmailSsl() {
		return get("email_ssl");
	}

	public void setEmailHost(java.lang.String emailHost) {
		set("email_host", emailHost);
	}

	public java.lang.String getEmailHost() {
		return get("email_host");
	}

	public void setEmailPort(java.lang.Integer emailPort) {
		set("email_port", emailPort);
	}

	public java.lang.Integer getEmailPort() {
		return get("email_port");
	}

	public void setEmailUsername(java.lang.String emailUsername) {
		set("email_username", emailUsername);
	}

	public java.lang.String getEmailUsername() {
		return get("email_username");
	}

	public void setEmailPassword(java.lang.String emailPassword) {
		set("email_password", emailPassword);
	}

	public java.lang.String getEmailPassword() {
		return get("email_password");
	}

	public void setEmailAddress(java.lang.String emailAddress) {
		set("email_address", emailAddress);
	}

	public java.lang.String getEmailAddress() {
		return get("email_address");
	}

	public void setQiniuOn(java.lang.Boolean qiniuOn) {
		set("qiniu_on", qiniuOn);
	}

	public java.lang.Boolean getQiniuOn() {
		return get("qiniu_on");
	}

	public void setQiniuUrl(java.lang.String qiniuUrl) {
		set("qiniu_url", qiniuUrl);
	}

	public java.lang.String getQiniuUrl() {
		return get("qiniu_url");
	}

	public void setQiniuBucketname(java.lang.String qiniuBucketname) {
		set("qiniu_bucketName", qiniuBucketname);
	}

	public java.lang.String getQiniuBucketname() {
		return get("qiniu_bucketName");
	}

	public void setQiniuAccesskey(java.lang.String qiniuAccesskey) {
		set("qiniu_accessKey", qiniuAccesskey);
	}

	public java.lang.String getQiniuAccesskey() {
		return get("qiniu_accessKey");
	}

	public void setQiniuSecretkey(java.lang.String qiniuSecretkey) {
		set("qiniu_secretKey", qiniuSecretkey);
	}

	public java.lang.String getQiniuSecretkey() {
		return get("qiniu_secretKey");
	}

	public void setSmsType(java.lang.Integer smsType) {
		set("sms_type", smsType);
	}

	public java.lang.Integer getSmsType() {
		return get("sms_type");
	}

	public void setSmsUsername(java.lang.String smsUsername) {
		set("sms_username", smsUsername);
	}

	public java.lang.String getSmsUsername() {
		return get("sms_username");
	}

	public void setSmsPassword(java.lang.String smsPassword) {
		set("sms_password", smsPassword);
	}

	public java.lang.String getSmsPassword() {
		return get("sms_password");
	}

	public void setOauthOn(java.lang.Boolean oauthOn) {
		set("oauth_on", oauthOn);
	}

	public java.lang.Boolean getOauthOn() {
		return get("oauth_on");
	}

	public void setOauthSinaOn(java.lang.Boolean oauthSinaOn) {
		set("oauth_sina_on", oauthSinaOn);
	}

	public java.lang.Boolean getOauthSinaOn() {
		return get("oauth_sina_on");
	}

	public void setOauthSinaOpenid(java.lang.String oauthSinaOpenid) {
		set("oauth_sina_openid", oauthSinaOpenid);
	}

	public java.lang.String getOauthSinaOpenid() {
		return get("oauth_sina_openid");
	}

	public void setOauthSinaOpenkey(java.lang.String oauthSinaOpenkey) {
		set("oauth_sina_openkey", oauthSinaOpenkey);
	}

	public java.lang.String getOauthSinaOpenkey() {
		return get("oauth_sina_openkey");
	}

	public void setOauthSinaRedirect(java.lang.String oauthSinaRedirect) {
		set("oauth_sina_redirect", oauthSinaRedirect);
	}

	public java.lang.String getOauthSinaRedirect() {
		return get("oauth_sina_redirect");
	}

	public void setOauthQqOn(java.lang.Boolean oauthQqOn) {
		set("oauth_qq_on", oauthQqOn);
	}

	public java.lang.Boolean getOauthQqOn() {
		return get("oauth_qq_on");
	}

	public void setOauthQqOpenid(java.lang.String oauthQqOpenid) {
		set("oauth_qq_openid", oauthQqOpenid);
	}

	public java.lang.String getOauthQqOpenid() {
		return get("oauth_qq_openid");
	}

	public void setOauthQqOpenkey(java.lang.String oauthQqOpenkey) {
		set("oauth_qq_openkey", oauthQqOpenkey);
	}

	public java.lang.String getOauthQqOpenkey() {
		return get("oauth_qq_openkey");
	}

	public void setOauthQqRedirect(java.lang.String oauthQqRedirect) {
		set("oauth_qq_redirect", oauthQqRedirect);
	}

	public java.lang.String getOauthQqRedirect() {
		return get("oauth_qq_redirect");
	}

	public void setIsDev(java.lang.Boolean isDev) {
		set("is_dev", isDev);
	}

	public java.lang.Boolean getIsDev() {
		return get("is_dev");
	}

	public void setIsDemo(java.lang.Boolean isDemo) {
		set("is_demo", isDemo);
	}

	public java.lang.Boolean getIsDemo() {
		return get("is_demo");
	}

	public void setBeian(java.lang.String beian) {
		set("beian", beian);
	}

	public java.lang.String getBeian() {
		return get("beian");
	}

	public void setCopyright(java.lang.String copyright) {
		set("copyright", copyright);
	}

	public java.lang.String getCopyright() {
		return get("copyright");
	}

	public void setRefuseIp(java.lang.String refuseIp) {
		set("refuse_ip", refuseIp);
	}

	public java.lang.String getRefuseIp() {
		return get("refuse_ip");
	}

	public void setAllowLoginError(java.lang.Integer allowLoginError) {
		set("allow_login_error", allowLoginError);
	}

	public java.lang.Integer getAllowLoginError() {
		return get("allow_login_error");
	}

	public void setMarkOn(java.lang.Boolean markOn) {
		set("mark_on", markOn);
	}

	public java.lang.Boolean getMarkOn() {
		return get("mark_on");
	}

	public void setMarkContent(java.lang.String markContent) {
		set("mark_content", markContent);
	}

	public java.lang.String getMarkContent() {
		return get("mark_content");
	}

	public void setMarkWidth(java.lang.Integer markWidth) {
		set("mark_width", markWidth);
	}

	public java.lang.Integer getMarkWidth() {
		return get("mark_width");
	}

	public void setMarkHight(java.lang.Integer markHight) {
		set("mark_hight", markHight);
	}

	public java.lang.Integer getMarkHight() {
		return get("mark_hight");
	}

	public void setMarkColor(java.lang.String markColor) {
		set("mark_color", markColor);
	}

	public java.lang.String getMarkColor() {
		return get("mark_color");
	}

	public void setPageSize(java.lang.Integer pageSize) {
		set("page_size", pageSize);
	}

	public java.lang.Integer getPageSize() {
		return get("page_size");
	}

}