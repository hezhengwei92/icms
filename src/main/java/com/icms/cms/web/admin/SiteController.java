package com.icms.cms.web.admin;

import com.icms.cms.base.AController;
import com.icms.cms.model.Website;
import com.icms.cms.service.SiteService;
import com.jfinal.plugin.activerecord.Page;

public class SiteController extends AController {

	@Override
	public void index() {
		System.out.println("test");
		int pageNumber = getParaToInt(0, 1);
		Page<Website> page = SiteService.service.getLinkPageAll(pageNumber);
		setAttr("page", page);
		renderAdmin("site-list");
	}

	@Override
	public void input() {
		createToken();
		Integer id = getParaToInt(0);
		if(id!=null){
			setAttr("site", Website.dao.findById(id));
		}
		renderAdmin("site-input");
	}

	@Override
	public void save() {
		validateToken();
		Website link = getModel(Website.class, "site");
		if (SiteService.service.AddOrUpdate(link)) {
			renderSuccess("添加成功!");
		} else {
			renderError("添加失败！");
		}
	}

	@Override
	public void del() {

		Integer[] ids = getParaValuesToInt("id");
		for (int id : ids) {
			SiteService.service.del(id);
		}
		renderJson(true);

	}

}
