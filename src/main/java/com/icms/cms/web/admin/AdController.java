package com.icms.cms.web.admin;

import com.icms.cms.base.AController;
import com.icms.cms.model.Ad;
import com.icms.cms.service.AdService;
import com.jfinal.plugin.activerecord.Page;

public class AdController extends AController {

	@Override
	public void index() {
		int pageNumber = getParaToInt(0, 1);
		Page<Ad> page = AdService.service.getLinkPageAll(pageNumber);
		setAttr("page", page);
		renderAdmin("ad-list");
	}

	@Override
	public void input() {
		createToken();
		Integer id = getParaToInt(0);
		if(id!=null){
			setAttr("ad", Ad.dao.findById(id));
		}
		renderAdmin("ad-input");
	}

	@Override
	public void save() {
		validateToken();
		Ad ad = getModel(Ad.class, "ad");
		if (AdService.service.AddOrUpdate(ad)) {
			renderSuccess("添加成功!");
		} else {
			renderError("添加失败！");
		}
	}

	@Override
	public void del() {

		Integer[] ids = getParaValuesToInt("Id");
		for (int id : ids) {
			AdService.service.del(id);
		}
		renderJson(true);

	}

}
