package com.icms.common.beetl.function;

import org.beetl.core.Context;
import org.beetl.core.Function;

import com.icms.cms.service.MenuService;

public class GetChildMenuByPid implements Function {

	@Override
	public Object call(Object[] paras, Context ctx) {
		Integer pid = (Integer) paras[0];
		return MenuService.service.getMenuByParentId(pid);
	}

}
