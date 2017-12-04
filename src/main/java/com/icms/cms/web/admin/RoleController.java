package com.icms.cms.web.admin;

import java.util.List;

import com.icms.cms.base.AController;
import com.icms.cms.model.Permission;
import com.icms.cms.model.Role;
import com.icms.cms.service.PermissionService;
import com.icms.cms.service.RoleService;
import com.icms.common.util.CmsUtil;
import com.jfinal.plugin.activerecord.Page;

public class RoleController extends AController {

	public void index() {
		int pageNumber = getParaToInt(0, 1);
		Page<Role> page = RoleService.service.getRolePageAll(pageNumber);
		setAttr("pages", page);
		renderAdmin("admin-role");
	}

	public void input() {
		Integer roleId = getParaToInt(0, 0);
		if (roleId != null) {
			Role role = RoleService.service.getRoleById(roleId);
			setAttr("role", role);
			List<Permission> pms = PermissionService.service.getPermissionsByRoleId(roleId);
			setAttr("pms", pms);
		} 
			List<Role> roles = RoleService.service.getRoleListAll();
			List<Permission> ps = PermissionService.service.getPermissionListByPid(0);
			setAttr("ps", ps);
			setAttr("roles", roles);
	
		renderAdmin("admin-role-input");
	}

	public void save() {
       Role role = getModel(Role.class,"role");
       int roleId = RoleService.service.AddOrUpdate(role);
       String[] permission = getParaValues("permission");
       if(PermissionService.service.AddOrUpdateRolePermission(roleId, permission)){
    		renderSuccess("操作成功");
		} else {
			renderError("操作失败");
		}
	}

	public void del() {
		int roleId = getParaToInt("roleId");
		renderJson(RoleService.service.del(roleId));
	}
	
	public void validateRolename(){
		String rolename = getPara("role.rolename");
		if(CmsUtil.isNullOrEmpty(RoleService.service.getRoleByRoleName(rolename))){
			renderJson(true);
		}else{
			renderJson(false);
		}
	}
}
