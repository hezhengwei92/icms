package com.icms.common.beetl.function;

import org.beetl.core.Context;
import org.beetl.core.Function;

import com.icms.cms.service.RoleService;

public class PrintAdminName implements Function {

	@Override
	public Object call(Object[] paras, Context ctx) {
		int roleId = (int) paras[0];
		return RoleService.service.getRoleAdminNameByRoleId(roleId);
	}

}
