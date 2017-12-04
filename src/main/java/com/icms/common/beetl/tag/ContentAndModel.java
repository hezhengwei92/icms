package com.icms.common.beetl.tag;

import org.beetl.core.GeneralVarTagBinding;

import com.icms.cms.model.Category;
import com.icms.cms.model.Model;
import com.icms.cms.service.CategoryService;
import com.icms.cms.service.ContentService;
import com.icms.cms.service.ModelService;
import com.jfinal.plugin.activerecord.Record;

public class ContentAndModel extends GeneralVarTagBinding{

	@Override
	public void render() {
		int siteId = Integer.parseInt((String)this.getAttributeValue("siteId"));
		int channelId =Integer.parseInt((String)this.getAttributeValue("channelId"));
		Long contentId = Long.parseLong((String)this.getAttributeValue("contentId"));
		Category cat =CategoryService.service.getCategoryBySiteIdAndCategoryId(siteId, channelId);
		Model model = ModelService.service.getModelByModelId(cat.getModelId());	
		this.binds(ContentService.service.getContentByContentIdAndTableName(contentId,model.getTableName()));
		this.doBodyRender();	
	}

}
