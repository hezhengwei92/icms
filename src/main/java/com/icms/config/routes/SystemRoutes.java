package com.icms.config.routes;

import com.icms.cms.web.admin.AdController;
import com.icms.cms.web.admin.AdminController;
import com.icms.cms.web.admin.CategoryController;
import com.icms.cms.web.admin.ContentController;
import com.icms.cms.web.admin.FormController;
import com.icms.cms.web.admin.HtmlController;
import com.icms.cms.web.admin.MenuController;
import com.icms.cms.web.admin.ModelController;
import com.icms.cms.web.admin.ModelFiledController;
import com.icms.cms.web.admin.PermissionController;
import com.icms.cms.web.admin.RoleController;
import com.icms.cms.web.admin.SiteController;
import com.icms.cms.web.admin.SystemController;
import com.icms.cms.web.admin.TagController;
import com.icms.cms.web.admin.TopicController;
import com.icms.cms.web.admin.linkController;
import com.icms.config.AppConfig;
import com.jfinal.config.Routes;
import com.jfinal.core.Controller;

public class SystemRoutes extends Routes {

    @Override
    public void config() {
        add("/", SystemController.class);
        add("/model", ModelController.class);
        add("/model/filed", ModelFiledController.class);
        add("/category", CategoryController.class);
        add("/content", ContentController.class);
        add("/tag", TagController.class);
        add("/admin", AdminController.class);
        add("/role", RoleController.class);
        add("/topic", TopicController.class);
        add("/link", linkController.class);
        add("/site", SiteController.class);
        add("/menu", MenuController.class);
        add("/ad", AdController.class);
        add("/permission", PermissionController.class);
        add("/form", FormController.class);
        add("/html", HtmlController.class);
    }

    @Override
    public Routes add(String controllerKey, Class<? extends Controller> controllerClass) {
        controllerKey = controllerKey.equals("/") ? AppConfig.manage_path : AppConfig.manage_path + controllerKey;
        return super.add(controllerKey, controllerClass);
    }
}
