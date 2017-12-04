package com.icms.cms.web.admin;

import org.apache.shiro.authz.annotation.RequiresPermissions;

import com.icms.cms.base.BaseController;
import com.icms.cms.service.TagService;

public class TagController extends BaseController {

	@RequiresPermissions("topic")
	public void  index(){
		int pageNumber = getParaToInt(0,1);
		setAttr("contentPage", TagService.service.getTagPageNumbaeAll(pageNumber));
		renderAdmin("tag-list");
		
	}
	@RequiresPermissions("topic:del")
	public void  del(){
		TagService.service.delByTagId(getParaToInt(0));
	}

	
}
