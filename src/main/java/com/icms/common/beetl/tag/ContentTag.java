package com.icms.common.beetl.tag;

import org.beetl.core.GeneralVarTagBinding;

import com.icms.cms.model.Category;
import com.icms.cms.model.Content;
import com.icms.cms.model.Website;
import com.icms.cms.service.CategoryService;
import com.icms.cms.service.ContentService;
import com.icms.cms.service.SiteService;
import com.icms.config.AppConfig;

public class ContentTag extends GeneralVarTagBinding {

	@Override
	public void render() {
		int siteId = Integer.parseInt((String) this.getAttributeValue("siteId"));
		Long catId = (Long) this.getAttributeValue("channelId");
		Long contentId = (Long) this.getAttributeValue("contentId");
		int titleLen = Integer.parseInt((String) this.getAttributeValue("titleLen"));
		// 0为下一篇，1为上一篇
		int nextId = Integer.parseInt((String) this.getAttributeValue("next"));
		// contentId必须大于0
		if (contentId > 0 && nextId == 1) {
			contentId--;
		} else {
			contentId++;
		}
		Website site = SiteService.service.getWebsiteBySiteId(siteId);
		Category category = CategoryService.service.getCategoryByCatId(catId);
		Content content = ContentService.service.getContentByContentId(contentId);
		if (content != null) {
			if (content.getTitle().length() > titleLen) {
				content.setTitle(content.getTitle().substring(0, titleLen) + "...");
			}
			String url = AppConfig.http_protocol + "://" + site.getDomain() + "/";
			
			if (AppConfig.is_static) {
				url += "html/" + site.getSiteId() + "/";
			}
			url += category.getShortname() + "-c-" + content.getContentId() + AppConfig.dynamic_suffix;
			content.setUrl(url);
			System.out.println("url :"+url );
			this.binds(content);
			this.doBodyRender();
		}
		
	}

}
