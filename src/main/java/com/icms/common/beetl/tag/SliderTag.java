package com.icms.common.beetl.tag;

import java.util.List;
import org.beetl.core.GeneralVarTagBinding;
import com.icms.cms.model.Ad;

public class SliderTag extends GeneralVarTagBinding {

	@Override
	public void render() {
		List<Ad> ad = null;
		ad = Ad.dao.find("select * from ic_ad where ad_type=1");
		for (Ad link : ad) {
			this.binds(link);
			this.doBodyRender();
		}
	}

}
