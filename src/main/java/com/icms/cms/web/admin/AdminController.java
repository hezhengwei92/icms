package com.icms.cms.web.admin;

import java.util.List;

import com.icms.cms.base.AController;
import com.icms.cms.model.Admin;
import com.icms.cms.model.Role;
import com.icms.cms.model.Website;
import com.icms.cms.service.AdminService;
import com.icms.cms.service.RoleService;
import com.icms.cms.service.SiteService;
import com.jfinal.plugin.activerecord.Page;

/**
 * 管理员
 */
public class AdminController extends AController {

	public void index() {
		int pageNumber = getParaToInt(0, 1);
		Page<Admin> page = AdminService.service.getAdminPageAll(pageNumber);
		setAttr("pages", page);
		renderAdmin("admin-list");
	}

	public void input() {
		int adminId = getParaToInt(0, 0);
		if (adminId > 0) {
			Admin admin = AdminService.service.getAdminByAdminId(adminId);
			setAttr("admin", admin);
		}
		List<Role> roles = RoleService.service.getRoleListAll();
		List<Website> sites = SiteService.service.getWebsiteAll();
		setAttr("roles", roles);
		setAttr("sites", sites);
		renderAdmin("admin-input");
	}

	public void save(){
		int roleId = getParaToInt("roleId");
		Admin admin = getModel(Admin.class,"Admin");
		if(AdminService.service.AddOrUpdate(admin, roleId)){
			renderSuccess("保存成功！");
		} else {
			renderError("保存失败！");
		}
		
		
	}

	public void del() {
		int adminId = getParaToInt(0);
		if (AdminService.service.del(adminId)) {
			renderJson(true);
		} else {
			renderJson(false);
		}
	}
	
	public void status(){
		int adminId = getParaToInt(0);
		if (AdminService.service.updateSatus(adminId)) {
			renderJson(true);
		} else {
			renderJson(false);
		}
	}
	
	public void validateName() {
		String adminName = getPara("Admin.username");
		if (AdminService.service.getAdminByUsername(adminName)!=null) {
			renderJson(false);
		} else {
			renderJson(true);
		}
	}
}
