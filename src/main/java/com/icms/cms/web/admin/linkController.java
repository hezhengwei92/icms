package com.icms.cms.web.admin;

import com.icms.cms.base.AController;
import com.icms.cms.model.Link;
import com.icms.cms.service.linkService;
import com.jfinal.plugin.activerecord.Page;

public class linkController extends AController {

	@Override
	public void index() {
		int pageNumber = getParaToInt(0, 1);
		Page<Link> page = linkService.service.getLinkPageAll(pageNumber);
		System.out.println(linkService.service.getLinkPageAll(pageNumber) instanceof Page);
		setAttr("page", page);
		renderAdmin("link-list");
	}

	@Override
	public void input() {
		createToken();
		Integer id = getParaToInt(0);
		if(id!=null){
			setAttr("link", Link.dao.findById(id));
		}
		renderAdmin("link-input");
	}

	@Override
	public void save() {
		validateToken();
		Link link = getModel(Link.class, "link");
		if (linkService.service.AddOrUpdate(link)) {
			renderSuccess("添加成功!");
		} else {
			renderError("添加失败！");
		}
	}

	@Override
	public void del() {

		Integer[] ids = getParaValuesToInt("lid");
		for (int id : ids) {
			linkService.service.del(id);
		}
		renderJson(true);

	}

}
