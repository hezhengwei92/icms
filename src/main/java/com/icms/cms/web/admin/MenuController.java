package com.icms.cms.web.admin;

import java.util.List;

import com.icms.cms.base.AController;
import com.icms.cms.model.Menu;
import com.icms.cms.service.MenuService;
import com.icms.common.util.CmsUtil;
import com.jfinal.plugin.activerecord.Page;

public class MenuController extends AController {

	@Override
	public void index() {
		int pageNumber = getParaToInt(0, 1);
		Page<Menu> page = MenuService.service.getMenuPageAll(pageNumber);
		setAttr("page", page);
		renderAdmin("menu-list");
	}

	@Override
	public void input() {
		createToken();
		Integer id = getParaToInt(0);
		if (id != null) {
			Menu menu = Menu.dao.findById(id);
			if (!CmsUtil.isBlank(menu.getIcon())) {
				menu.setIcon(menu.getIcon().replace("&", "&amp;"));
			}
			setAttr("menu", menu);
		}
		List<Menu> ps = MenuService.service.getMenuByParentId(0);
		setAttr("ps", ps);
		renderAdmin("menu-input");
	}

	@Override
	public void save() {
		validateToken();
		Menu menu = getModel(Menu.class, "menu");
		if (!CmsUtil.isBlank(menu.getIcon())) {
			menu.setIcon(menu.getIcon().replace("&amp;", "&"));
		}
		if (MenuService.service.AddOrUpdate(menu)) {
			renderSuccess("添加成功!");
		} else {
			renderError("添加失败！");
		}
	}

	@Override
	public void del() {

		Integer[] ids = getParaValuesToInt("id");
		for (int id : ids) {
			MenuService.service.del(id);
		}
		renderJson(true);
	}

}
