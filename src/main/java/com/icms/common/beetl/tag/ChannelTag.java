package com.icms.common.beetl.tag;

import org.beetl.core.GeneralVarTagBinding;

import com.icms.cms.model.Category;
import com.icms.cms.model.Website;
import com.icms.cms.service.CategoryService;
import com.icms.cms.service.SiteService;
import com.icms.common.util.CmsUtil;
import com.icms.common.vo.ChannelVo;
import com.icms.config.AppConfig;

public class ChannelTag extends GeneralVarTagBinding {

	@Override
	public void render() {
		int siteId = Integer.parseInt((String) this.getAttributeValue("siteId"));
		int isMore = Integer.parseInt((String) this.getAttributeValue("isMore"));
		Long catId = Long.parseLong((String) this.getAttributeValue("channelId"));
		ChannelVo channel = new ChannelVo();
		Website site = SiteService.service.getWebsiteBySiteId(siteId);
		Category category = CategoryService.service.getCategoryByCatId(catId);
		if (CmsUtil.isNullOrEmpty(category)) {
			throw new RuntimeException("栏目不存在！");
		}
		String url = AppConfig.http_protocol + "://" + site.getDomain() + "/";
		if (AppConfig.is_static) {
			url += "html/" + site.getSiteId() + "/";
		}else{
			url+= category.getShortname() + AppConfig.dynamic_suffix;
		}
		if (isMore == 1) {
			url = AppConfig.http_protocol + "://" + site.getDomain() + "/" + category.getShortname() + "-l"
					+ AppConfig.dynamic_suffix;
			category.setCategoryName("更多");
		}
		channel.setUrl(url);
		channel.setName(category.getCategoryName());
		this.binds(channel);
		this.doBodyRender();

	}

}
