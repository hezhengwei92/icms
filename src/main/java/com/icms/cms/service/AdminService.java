package com.icms.cms.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;

import com.icms.cms.base.BaseService;
import com.icms.cms.model.Admin;
import com.icms.cms.model.AdminRole;
import com.icms.common.shiro.PasswordHelper;
import com.icms.common.util.CmsUtil;
import com.icms.common.util.SQLUtil;
import com.icms.config.AppConfig;
import com.icms.config.AppConst;
import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinal.plugin.ehcache.CacheKit;

public class AdminService extends BaseService {

    public static final AdminService service = Enhancer.enhance(AdminService.class, Tx.class);
    private final String table = " ic_admin ";
    private final String cacheName = AppConst.SERVICE_CACHE[AppConst.ADMIN_CACHE];

    public boolean AddOrUpdate(Admin admin, int roleId) {
        clearCacheAll();
        String salt = CmsUtil.getUUID();
        String password = PasswordHelper.encodePassword(admin.getPassword(), admin.getUsername(), salt);
        admin.setSalt(salt);
        admin.setPassword(password);
        if (admin.getAdminId() == null) {
            admin.save();
            return addOrUpdateAdminRole(admin.getAdminId(), roleId);
        }
        addOrUpdateAdminRole(admin.getAdminId(), roleId);
        return admin.update();
    }

    public Admin getAdminByUsername(String username) {
        String sql = "select * from " + table + "  where username = ?";
        return Admin.dao.findFirstByCache(cacheName, "username" + username, sql, username);
    }

    public Admin getAdminByAdminId(int adminId) {
        String sql = "select * from " + table + "  where admin_id = ?";
        return Admin.dao.findFirstByCache(cacheName, "admin_id" + adminId, sql, adminId);
    }

    public Map<String, Object> login(String username, String password, boolean remberme) throws LockedAccountException {
        Subject currentUser = SecurityUtils.getSubject();
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("success", false);
        UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken(username, password);
        if (remberme) {
            usernamePasswordToken.setRememberMe(true);
        }
        try {
            currentUser.login(usernamePasswordToken);
            currentUser.getSession().setAttribute(AppConst.SESSION_ADMIN, username);
            result.put("success", true);
            result.put("msg", "登录成功！");
//		} catch (UnknownAccountException e) {
//			e.printStackTrace();
//			result.put("msg", "账号输入错误！");
//		} catch (IncorrectCredentialsException e){
//			result.put("msg", "密码输入错误！");
        } catch (LockedAccountException e) {
            e.printStackTrace();
            result.put("msg", "当前账号已被停用！");

        } catch (AuthenticationException ae) {
            result.put("msg", "账号或者密码输入错误！");

        }
        return result;

    }

    public Page<Admin> getAdminPageAll(int pageNumber) {
        String select = SQLUtil.me().select("*").exec();
        String sqlExceptSelect = SQLUtil.me().from("ic_admin").exec();
        return Admin.dao.paginateByCache(cacheName, "admin_page_all_pagenumber_" + pageNumber, pageNumber,
                AppConfig.system_config.getInt(AppConst.PAGE_SIZE), select, sqlExceptSelect);

    }

    public boolean del(int adminId) {
        clearCacheAll();
        Long count = Admin.dao.findFirst(SQLUtil.me().select("count(*) as count").from(table).exec()).getLong("count");
        if (count > 1)
            return Admin.dao.deleteById(adminId);
        return false;
    }

    public boolean updateSatus(int adminId) {
        clearCacheAll();
        Admin admin = Admin.dao.findById(adminId);
        if (admin.getStatus()) {
            admin.setStatus(false);
        } else {
            admin.setStatus(true);
        }
        return admin.update();
    }

    public boolean addOrUpdateAdminRole(int adminId, int roleId) {
        System.out.println("adminId:" + adminId);
        String sql = SQLUtil.me().select("*").from("ic_admin_role").where("admin_id=?").exec();
        AdminRole ar = AdminRole.dao.findFirstByCache(cacheName, "adminRole_adminId", sql, adminId);
        if (CmsUtil.isNullOrEmpty(ar)) {
            ar = new AdminRole();
            ar.setAdminId(adminId);
            ar.setRoleId(roleId);
            return ar.save();
        } else {
            ar.setRoleId(roleId);
            return ar.update();
        }

    }

    @Override
    public void clearCacheAll() {
        CacheKit.removeAll(cacheName);
    }
}
