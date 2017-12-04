package com.icms.common.interceptor;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import com.icms.cms.model.Admin;
import com.icms.cms.model.Website;
import com.icms.cms.service.AdminService;
import com.icms.cms.service.SiteService;
import com.icms.common.util.ServletUtil;
import com.icms.common.util.CmsUtil;
import com.icms.config.AppConfig;
import com.icms.config.AppConst;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.jfinal.kit.LogKit;
import com.jfinal.plugin.ehcache.CacheKit;

public class SystemInterceptor implements Interceptor {

    private String url;
    private String loginUrl;
    private String logoutUrl;

    public SystemInterceptor() {
        this.url = AppConfig.manage_path;
        this.loginUrl = AppConfig.manage_path + "/login";
        this.logoutUrl = AppConfig.manage_path + "/logout";
    }

    public void intercept(Invocation inv) {
        LogKit.info("############# 系统拦截器  #############");
        String actionKey = inv.getActionKey();
        Controller controller = inv.getController();
        Subject currentUser = SecurityUtils.getSubject();

        if (loginUrl.equalsIgnoreCase(actionKey) && currentUser.isAuthenticated()) {
            controller.redirect(url);
            return;
        }

        if (!actionKey.equals(logoutUrl) && !ServletUtil.isPost(controller)) {
            if (actionKey.indexOf(url) != -1) {
                Integer siteId = (Integer) currentUser.getSession().getAttribute(AppConst.SITE_ID);
                String username = (String) currentUser.getSession().getAttribute(AppConst.SESSION_ADMIN);
                Website site = SiteService.service.getWebsiteByDomain(ServletUtil.getDomain(controller.getRequest()));
                if (CmsUtil.isBlank(username)) {
                    username = (String) currentUser.getPrincipal();
                    if (CmsUtil.isBlank(username)) {
                        if (CmsUtil.isNullOrEmpty(site)) {
                            LogKit.info("当前域名没有后台权限  - " + ServletUtil.getDomain(controller.getRequest()));
                            controller.renderError(404);
                            return;
                        }
                        inv.invoke();
                        return;
                    }
                }

                LogKit.info("############# 系统拦截器 -> 登陆用户：" + username + "  #############");
                Admin admin = AdminService.service.getAdminByUsername(username);
                if (currentUser.isRemembered() && !currentUser.isAuthenticated()) {
                    controller.setAttr("username", admin.getUsername());
                    controller.setAttr("msg", "已记住登录名，请入密码确认登陆！");
                    renderAdmin(controller, "login");
                    return;
                }
                if (admin != null) {
                    LogKit.info("############# 系统拦截器 -> 用户站点编号：" + admin.getSiteId() + "  #############");
                    LogKit.info("############# 系统拦截器 -> 当前站点编号：" + site.getSiteId() + "  #############");
                    // 没有权限
                    if (admin.getSiteId() != 0 && !admin.getSiteId().equals(site.getSiteId())) {
                        LogKit.info("############# 系统拦截器 -> 用户：" + username + "，没有此站点的权限  #############");
                        currentUser.logout();
                        controller.setAttr("errorMsg", "对不起，您没有访问此网站后台的权限！");
                        controller.setAttr("errorCode", "401");
                        controller.render("/common/error.html");
                        return;
                    }
                    // 首次登陆验证成功
                    if (siteId == null) {
                        LogKit.info("############# 系统拦截器 -> 用户：" + username + "，首次登陆  #############");
                        // 记录登录状态以及次数
                        admin.setLastip(ServletUtil.getIpAddr(controller.getRequest()));
                        admin.setLoginsum(admin.getLoginsum() + 1);
                        admin.update();
                        CacheKit.removeAll(AppConst.SYSTEM_CACHE);
                        CacheKit.removeAll(AppConst.SERVICE_CACHE[AppConst.ADMIN_CACHE]);
                        // 将SiteId保存session已备后用
                        currentUser.getSession().setAttribute(AppConst.SITE_ID, admin.getSiteId());
                    }

                }

            }
        }
        inv.invoke();
    }

    private void renderAdmin(Controller c, String template) {
        c.render("/system/" + template + ".html");
    }

}
