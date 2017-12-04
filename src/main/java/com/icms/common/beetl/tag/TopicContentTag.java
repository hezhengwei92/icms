package com.icms.common.beetl.tag;

import java.util.List;

import org.beetl.core.GeneralVarTagBinding;

import com.icms.cms.model.Category;
import com.icms.cms.model.Content;
import com.icms.cms.model.Topic;
import com.icms.cms.model.Website;
import com.icms.cms.service.CategoryService;
import com.icms.cms.service.ContentService;
import com.icms.cms.service.SiteService;
import com.icms.cms.service.TopicService;
import com.icms.common.util.CmsUtil;
import com.icms.config.AppConfig;

public class TopicContentTag extends GeneralVarTagBinding {

	@Override
	public void render() {
		int siteId = Integer.parseInt((String) this.getAttributeValue("siteId"));
		int topicId = Integer.parseInt((String) this.getAttributeValue("topicId"));
		int titleLen = Integer.parseInt((String) this.getAttributeValue("titleLen"));
		int recommend = Integer.parseInt((String) this.getAttributeValue("recommend"));
		Topic topic = TopicService.service.getTopicByTopicId(topicId);
		List<Content> contents = null;
		if (CmsUtil.isNullOrEmpty(topic))
			throw new RuntimeException("topicId 不存在.");
		if (recommend == 1) {
			contents = ContentService.service.getContentByTopicCats(topic.getCategoryIds());
		} else {
			contents = ContentService.service.getContentByTopicCatsAndRecommend(topic.getCategoryIds());
		}
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
