package com.icms.common.beetl.tag;

import java.util.List;
import org.beetl.core.GeneralVarTagBinding;

import com.icms.cms.model.Category;
import com.icms.cms.model.Content;
import com.icms.cms.model.Website;
import com.icms.cms.service.CategoryService;
import com.icms.cms.service.SiteService;
import com.icms.common.util.CmsUtil;
import com.icms.config.AppConfig;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

public class ContentPageTag extends GeneralVarTagBinding {

	@Override
	public void render() {
		int siteId = (Integer) this.getAttributeValue("siteId");
		Page<?> contentPage = (Page<?>) this.getAttributeValue("page");
		int titleLen = Integer.parseInt((String) this.getAttributeValue("titleLen"));
		wrapRender(contentPage.getList(), titleLen, siteId);
	}

	/**
	 * 包装绑定
	 * 
	 * @param contents
	 * @param titleLen
	 * @param siteId
	 * @param page
	 */
	private void wrapRender(final List<?> contents, final int titleLen, final int siteId) {

		if (!CmsUtil.isNullOrEmpty(contents) && contents.get(0) instanceof Content) {
			for (Object obj : contents) {
				Content content = (Content) obj;
				String title = content.getTitle();
				int length = title.length();
				if (length > titleLen) {
					content.setTitle(title.substring(0, titleLen));
				}
				if (CmsUtil.isBlank(content.getUrl())) {

					Website site = SiteService.service.getWebsiteBySiteId(siteId);
					Category category = CategoryService.service.getCategoryByCatId(content.getCategoryId());
					String url = AppConfig.http_protocol + "://" + site.getDomain() + "/";
					if (AppConfig.is_static) {
						url += "html/" + site.getSiteId() + "/";
					} else {
						// 拼接域名
						url += category.getShortname() + "-c-" + content.getContentId() + AppConfig.dynamic_suffix;
					}
					content.setUrl(url);
				}

				this.binds(content);
				this.doBodyRender();
			}
		} else if (!CmsUtil.isNullOrEmpty(contents) && contents.get(0) instanceof Record) {

			for (Object obj : contents) {
				Record content = (Record) obj;
				String title = content.getStr("title");
				int length = title.length();
				if (length > titleLen) {
					content.set("title", title.substring(0, titleLen) + "...");
				}
				if (CmsUtil.isBlank(content.getStr("url"))) {
					Website site = SiteService.service.getWebsiteBySiteId(siteId);
					Category category = CategoryService.service.getCategoryByCatId(content.getLong("category_id"));
					// 拼接域名
					String url = AppConfig.http_protocol + "://" + site.getDomain() + "/";
					if (AppConfig.is_static) {
						url += "html/" + site.getSiteId() + "/";
					}
					url += category.getShortname() + "-c-" + content.getLong("content_id") + AppConfig.dynamic_suffix;
					content.set("url", url);
				}

				this.binds(content);
				this.doBodyRender();
			}

		}

	}

}
