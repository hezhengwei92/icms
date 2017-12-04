package com.icms.cms.web.admin;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.io.FileUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;

import com.icms.cms.base.AController;
import com.icms.cms.model.Admin;
import com.icms.cms.model.Category;
import com.icms.cms.model.Config;
import com.icms.cms.model.Menu;
import com.icms.cms.service.AdminService;
import com.icms.cms.service.CategoryService;
import com.icms.cms.service.MenuService;
import com.icms.cms.service.SystemService;
import com.icms.common.ext.CacheInterceptor;
import com.icms.common.shiro.ShiroUtil;
import com.icms.config.AppConfig;
import com.icms.config.AppConst;
import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.jfinal.kit.PathKit;
import com.jfinal.plugin.ehcache.CacheName;
import com.jfinal.render.CaptchaRender;
import com.jfinal.render.JsonRender;

public class SystemController extends AController {

	@RequiresPermissions("admin:add")
	public void index() {
		Integer siteId = (Integer) ShiroUtil.getSessionAttr(AppConst.SITE_ID);
		List<Menu> menus = MenuService.service.getMenuByParentId(0);
		List<Category> list = CategoryService.service.getCategoryListBySiteId(siteId);
		setAttr("catlist", list);
		setAttr("menus", menus);
		renderAdmin("index");
	}

	public void login() {
		if (isGet()) {
			renderAdmin(LOGIN);
		} else {
			//getPara方法是对HttpServletRequest.getParameter(String name)的封装
			//参数String类型的将获取表单或url中问好挂参的值。int或无参将获取urlPara中的参数值
			String username = getPara("username");
			String password = getPara("password");
			Boolean remberme = getPara("remberme") == null ? false : true;
			Map<String, Object> result = AdminService.service.login(username, password, remberme);
			render(new JsonRender(result).forIE());
		}
	}

	public void logout() {
		String username = (String) ShiroUtil.getSessionAttr(AppConst.SESSION_ADMIN);
		System.out.println("username :" + username);
		Admin admin = AdminService.service.getAdminByUsername(username);
		isNullRender(admin);
		admin.setLastdate(new Date());
		admin.update();
		ShiroUtil.getSubject().logout();
		redirect("/" + AppConfig.manage_path);
	}

	@ActionKey(value = "/verify/captchaImg")
	public void verifyImage() {
		renderCaptcha();
	}

	@ActionKey(value = "/verify/validateCaptchaImage")
	public void validateImage() {
		String verifyCode = getPara("verifycode");
		if (CaptchaRender.validate(this, verifyCode)) {
			renderJson(true);
		} else {
			renderJson(false);
		}
	}
//配置Method级别的拦截器 将拦截本方法
	@Before(CacheInterceptor.class)
	@CacheName(AppConst.SYSTEM_CACHE)
	public void welcome() {
		Map<String, Object> system = new HashMap<String, Object>();
		String username = (String) ShiroUtil.getSessionAttr(AppConst.SESSION_ADMIN);
		Admin admin = AdminService.service.getAdminByUsername(username);
		Properties props = System.getProperties(); // 获得系统属性集
		system.put("domain", getDomain());
		system.put("ip", this.getHostIp());
		system.put("host", this.getHost());
		system.put("osName", props.getProperty("os.name"));
		system.put("osArch", props.getProperty("os.arch"));
		system.put("osVersion", props.getProperty("os.version"));
		system.put("javaHome", props.getProperty("java.home"));
		system.put("javaVersion", props.getProperty("java.version"));
		system.put("userName", props.getProperty("user.name"));
		system.put("userHome", props.getProperty("user.home"));
		system.put("userDir", props.getProperty("user.dir"));
		system.put("appDir", PathKit.getWebRootPath());
		system.put("serverDate", new Date());
		setAttr("system", system);
		setAttr("lastIp", admin.getLastip());
		setAttr("loginSum", admin.getLoginsum());
		setAttr("lastDate", admin.getLastdate());
		renderAdmin("welcome");
	}

	@Override
	public void input() {
		Config config = SystemService.service.getConfigById(1);
		setAttr("config", config);
		renderAdmin("system-input");
	}

	@Override
	public void save() {
		Config config = getModel(Config.class, "config");
		String adminPath = config.getAdminPath();
		if (SystemService.service.AddOrUpdate(config)) {
			String shiroIniFile = PathKit.getRootClassPath() + File.separator + "shiro-sample.ini";
			String shiroIniFile2 = PathKit.getRootClassPath() + File.separator + "shiro-2.ini";
			try {
				String s = FileUtils.readFileToString(new File(shiroIniFile));
				s = s.replace("{adminPath}", adminPath);
				FileUtils.writeStringToFile(new File(shiroIniFile2), s);
				ShiroUtil.getSubject().logout();
				renderSuccess("设置成功,请重新启动Tomcat！");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			renderSuccess("设置失败");
		}

	}

	@Override
	public void del() {
		renderNull();
	}

}
