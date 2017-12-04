package com.icms.cms.web.ucenter;

import com.icms.cms.base.MController;
import com.icms.config.AppConfig;

public class UcenterController extends MController {

	public void index() {
		renderUcenter("index");
	}

	public void register() {
		if (!AppConfig.system_config.getBoolean("allow_member_reg"))
			renderError("对不起，管理员关闭注册功能！", "allow_member_reg_false");
		else
		renderText("注册会员");
	}

	public void save() {

	}
}
