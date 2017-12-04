package com.icms.common.beetl.tag;

import java.util.List;
import org.beetl.core.GeneralVarTagBinding;
import com.icms.cms.model.Link;
import com.icms.cms.service.linkService;

public class LinkTag extends GeneralVarTagBinding {

	@Override
	public void render() {
		int count = Integer.parseInt((String) this.getAttributeValue("count"));
		int isPic = Integer.parseInt((String) this.getAttributeValue("isPic"));
		List<Link> links = null;
		
		if( isPic==0){
		links = linkService.service.getLinkList(count);
		}else{
			links = linkService.service.getLinkListWithImg(count);
		}
		
		for (Link link : links) {
			this.binds(link);
			this.doBodyRender();
		}
	}

}
