package com.icms.common.beetl.tag;

import java.util.List;
import org.beetl.core.GeneralVarTagBinding;

import com.icms.cms.model.Category;
import com.icms.cms.model.Content;
import com.icms.cms.model.Website;
import com.icms.cms.service.CategoryService;
import com.icms.cms.service.ContentService;
import com.icms.cms.service.SiteService;
import com.icms.common.util.CmsUtil;
import com.icms.config.AppConfig;

public class ContentListTag extends GeneralVarTagBinding {

	/**
	 * 文章列表标签
	 * 
	 * catId:分类编号 tagId：标记编号 siteId：站点编号 titleLen:标题长度 target:是否新窗口打开
	 * recommend:是否推荐 ：0为不推荐，1为推荐
	 */
	@Override
	public void render() {

		int catId = Integer.parseInt((String) this.getAttributeValue("channelId"));
		int channelOption = Integer.parseInt((String) this.getAttributeValue("channelOption"));
		int orderBy = Integer.parseInt((String) this.getAttributeValue("orderBy"));
		// int tagId = Integer.parseInt((String)
		// this.getAttributeValue("tagId"));
		int siteId = Integer.parseInt((String) this.getAttributeValue("siteId"));
		int titleLen = Integer.parseInt((String) this.getAttributeValue("titleLen"));
		int recommend = Integer.parseInt((String) this.getAttributeValue("recommend"));
		int isHot = Integer.parseInt((String) this.getAttributeValue("isHot"));
		if (channelOption == 0) {
			wrapRender(ContentService.service.getContentListBySiteIdAndCatId(siteId, catId, recommend, orderBy, isHot),
					titleLen, siteId);
		} else {
			wrapRender(ContentService.service.getContentListBySiteIdAndParentId(siteId, catId, recommend, orderBy),
					titleLen, siteId);
		}

	}

	private void wrapRender(List<Content> contents, int titleLen, int siteId) {

		for (Content content : contents) {
			String title = content.getTitle();
			int length = title.length();
			if (length > titleLen) {
				content.setTitle(title.substring(0, titleLen) + "...");
			}
			if (CmsUtil.isBlank(content.getUrl())) {
				Website site = SiteService.service.getWebsiteBySiteId(siteId);
				String url = AppConfig.http_protocol + "://" + site.getDomain() + "/";
				Category category = CategoryService.service.getCategoryByCatId(content.getCategoryId());
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

	}
}
