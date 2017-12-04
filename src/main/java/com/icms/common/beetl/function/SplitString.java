package com.icms.common.beetl.function;

import org.beetl.core.Context;
import org.beetl.core.Function;

public class SplitString implements Function {

	@Override
	public Object call(Object[] paras, Context ctx) {
		String str = (String) paras[0];
		String split = (String)paras[1];
		return str.split(split);
	}

}
