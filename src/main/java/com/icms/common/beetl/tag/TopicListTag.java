package com.icms.common.beetl.tag;

import java.util.List;

import org.beetl.core.GeneralVarTagBinding;
import com.icms.cms.model.Topic;
import com.icms.cms.model.Website;
import com.icms.cms.service.SiteService;
import com.icms.cms.service.TopicService;
import com.icms.common.util.CmsUtil;
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

public class TopicListTag extends GeneralVarTagBinding {

	@Override
	public void render() {
		int siteId = Integer.parseInt((String) this.getAttributeValue("siteId"));
		int count = Integer.parseInt((String) this.getAttributeValue("count"));
		int order = Integer.parseInt((String) this.getAttributeValue("order"));
		List<Topic> topics = null;
		Website site = SiteService.service.getWebsiteBySiteId(siteId);
		String url = AppConfig.http_protocol + "://" + site.getDomain() + "/";
		if(order==1){
			topics = TopicService.service.getTopicListBySizeAndOrderByTopicId(count);
		}else{
			topics = TopicService.service.getTopicListBySize(count);
		}
		if (!CmsUtil.isNullOrEmpty(topics)) {
			for (Topic topic : topics) {
				topic.set("url", url+"topic/"+topic.getTopicId());
				this.binds(topic);
				this.doBodyRender();
			}
		}else{
			throw new RuntimeException("tag列表为空！");
		}

	}

}
