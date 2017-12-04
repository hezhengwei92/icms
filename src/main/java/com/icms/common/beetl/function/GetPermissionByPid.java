package com.icms.common.beetl.function;

import org.beetl.core.Context;
import org.beetl.core.Function;
import com.icms.cms.service.PermissionService;

public class GetPermissionByPid implements Function {

	@Override
	public Object call(Object[] paras, Context ctx) {
		Integer pid = (Integer) paras[0];
		return PermissionService.service.getPermissionByParentId(pid);
	}

}
