package com.icms.cms.web.admin;

import java.util.List;

import com.icms.cms.base.AController;
import com.icms.cms.model.Permission;
import com.icms.cms.service.PermissionService;
import com.jfinal.plugin.activerecord.Page;

public class PermissionController extends AController {

	@Override
	public void index() {
		int pageNumber = getParaToInt(0, 1);
		Page<Permission> page = PermissionService.service.getPermissionPageAll(pageNumber);
		setAttr("page", page);
		renderAdmin("permission-list");
	}

	@Override
	public void input() {
		createToken();
		Integer id = getParaToInt(0);
		if (id != null) {
			setAttr("permission", Permission.dao.findById(id));
		}
		List<Permission> ps = PermissionService.service.getPermissionByParentId(0);
		setAttr("ps", ps);
		renderAdmin("permission-input");
	}

	@Override
	public void save() {
		validateToken();
		Permission permission = getModel(Permission.class, "permission");
		if (PermissionService.service.AddOrUpdate(permission)) {
			renderSuccess("添加成功!");
		} else {
			renderError("添加失败！");
		}
	}

	@Override
	public void del() {
 
		Integer[] ids = getParaValuesToInt("lid");
		for (int id : ids) {
			PermissionService.service.del(id);
		}
		renderJson(true);

	}

}
