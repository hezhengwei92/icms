package com.icms.common.beetl.tag;

import java.util.List;
import org.beetl.core.GeneralVarTagBinding;
import com.icms.cms.model.Tag;
import com.icms.cms.model.Website;
import com.icms.cms.service.SiteService;
import com.icms.cms.service.TagService;
import com.icms.common.util.CmsUtil;
import com.icms.config.AppConfig;

/**
 * Tag列表标签
 * 
 *  siteId:站点Id
 *  count:调用条数
 *  order:排序,1为倒序
 *  
 *  <#cms_tag_list siteId="1" count="10" order="0"  var="tag"> 
 *  <a href="${tag.url!}">${tag.tagName!}(${tag.count!})</a>
 *  </#cms_tag_list> 
 */

public class TagListTag extends GeneralVarTagBinding {

	@Override
	public void render() {
		int siteId = Integer.parseInt((String) this.getAttributeValue("siteId"));
		int count = Integer.parseInt((String) this.getAttributeValue("count"));
		int order = Integer.parseInt((String) this.getAttributeValue("order"));
		List<Tag> tags = null;
		Website site = SiteService.service.getWebsiteBySiteId(siteId);
		String url = AppConfig.http_protocol + "://" + site.getDomain() + "/";
		if(order==1){
			 tags = TagService.service.getTagListBySizeAndOrderByCounter(count);
		}else{
			tags = TagService.service.getTagListBySize(count);
		}
		if (!CmsUtil.isNullOrEmpty(tags)) {
			for (Tag tag : tags) {
				tag.set("url", url+"topic/"+tag.getTagId());
				this.binds(tag);
				this.doBodyRender();
			}
		}else{
			throw new RuntimeException("tag列表为空！");
		}

	}

}
