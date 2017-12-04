package com.icms.common.beetl.tag;

import java.util.List;
import java.util.Map;

import org.beetl.core.GeneralVarTagBinding;
import com.icms.common.lucene.common.SearchResultEntity;


public class LucentPageTag extends GeneralVarTagBinding {

	@Override
	public void render() {
		SearchResultEntity searchPage = (SearchResultEntity) this.getAttributeValue("page");
		wrapRender(searchPage.getDocs());
	}

	/**
	 * 包装绑定
	 * 
	 * @param contents
	 * @param titleLen
	 * @param siteId
	 * @param page
	 */
	private void wrapRender(final List<Map<String, String>> contents) {

		for (Map<String, String> m : contents) {
			this.binds(m);
			this.doBodyRender();
		}
	}

}
