package com.icms.common.beetl.tag;

import java.util.List;

import org.beetl.core.GeneralVarTagBinding;

import com.icms.cms.model.Category;
import com.icms.cms.model.Website;
import com.icms.cms.service.CategoryService;
import com.icms.cms.service.SiteService;
import com.icms.common.util.CmsUtil;
import com.icms.common.vo.ChannelVo;
import com.icms.config.AppConfig;

/**
 * Topic列表标签
 * 
 *  siteId:站点Id
 *  count:调用条数
 *  order:排序,1为倒序
 *  
 *  <#cms_topic_list siteId="1" count="10" order="0"  var="topic"> 
 *  <a href="${topic.url!}">${topic.tagName!}(${topic.count!})</a>
 *  </#cms_topic_list> 
 */
public class ChannelListTag extends GeneralVarTagBinding {

	@Override
	public void render() {

		int siteId = Integer.parseInt((String) this.getAttributeValue("siteId"));
		Long catId = Long.parseLong((String) this.getAttributeValue("parentId"));
		// Long hasContent = Long.parseLong((String)
		// this.getAttributeValue("hasContent"));
		int isNav = Integer.parseInt((String) this.getAttributeValue("isNav"));
		Website site = SiteService.service.getWebsiteBySiteId(siteId);
		List<Category> categorys = CategoryService.service.getCategoryByParentId(catId, isNav);
		ChannelVo channel = new ChannelVo();

		if (categorys != null && !categorys.isEmpty()) {

			for (Category category : categorys) {
				String url = AppConfig.http_protocol + "://" + site.getDomain() + "/";
				if (AppConfig.is_static) {
					url += "html/" + site.getSiteId() + "/";
				} else {
					url += category.getShortname() + AppConfig.dynamic_suffix;
				}
				if (!CmsUtil.isBlank(category.getUrl())) {
					url = category.getUrl();
				}
				channel.setId(category.getCategoryId());
				channel.setUrl(url);
				channel.setName(category.getCategoryName());
				this.binds(channel);
				this.doBodyRender();
			}

		} else {

			Category category = CategoryService.service.getCategoryByCatId(catId);
			if (CmsUtil.isNullOrEmpty(category)) {
				throw new RuntimeException("栏目不存在！");
			}
			String url = AppConfig.http_protocol + "://" + site.getDomain() + "/" + category.getShortname()
					+ AppConfig.dynamic_suffix;
			channel.setUrl(url);
			channel.setName(category.getCategoryName());
			this.binds(channel);
			this.doBodyRender();

		}
	}

}
