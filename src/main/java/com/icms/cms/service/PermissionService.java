package com.icms.cms.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.icms.cms.base.BaseService;
import com.icms.cms.model.Permission;
import com.icms.cms.model.RolePermission;
import com.icms.common.util.CmsUtil;
import com.icms.common.util.SQLUtil;
import com.icms.config.AppConfig;
import com.icms.config.AppConst;
import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;

public class PermissionService extends BaseService {

    public static final PermissionService service = Enhancer.enhance(PermissionService.class);
    private final String cacheName = AppConst.SERVICE_CACHE[7];
    private final String table = "ic_permission";

    public boolean AddOrUpdate(Permission permission) {
        clearCacheAll();
        if (permission.getPermissionId() == null) {

            return permission.save();
        }
        return permission.update();
    }


    public Set<String> getPermissionsByUsername(String username) {
        String sql = "select p.* "
                + "from ic_admin a, ic_role r, ic_permission p,ic_admin_role ar, ic_role_permission rp "
                + "where a.admin_id = ar.admin_id and r.role_id = ar.role_id and r.role_id = rp.role_id and p.permission_id = rp.permisson_id and a.username = ?";
        List<Permission> permissions = Permission.dao.findByCache(cacheName, "permission" + username, sql, username);
        Set<String> set = new HashSet<String>();
        for (Permission p : permissions) {
            set.add(p.getStr("name"));
        }
        return set;
    }

    /**
     * 查询权限list
     *
     * @return
     */
    public List<Permission> getPermissionListAll() {
        String sql = SQLUtil.me().select("*").from("ic_permission").exec();
        return Permission.dao.findByCache(cacheName, "all", sql);
    }

    /**
     * 查询权限list
     *
     * @return
     */
    public List<Permission> getPermissionListByPid(int pid) {
        String sql = SQLUtil.me().select("*").from("ic_permission").where("pid=?").exec();
        return Permission.dao.findByCache(cacheName, "all" + pid, sql, pid);
    }

    public List<Permission> getPermissionsByRoleId(int roleId) {
        String sql = SQLUtil.me().select("p.*").from("ic_permission p").join("ic_role_permission rp")
                .on("p.permission_id = rp.permisson_id").where("role_id=?").exec();
        return Permission.dao.findByCache(cacheName, "permission_list_roleId_" + roleId, sql, roleId);
    }

    public boolean AddOrUpdateRolePermission(int roleId, String[] permission) {

        String sql = SQLUtil.me().select("*").from("ic_role_permission").where("role_id = ?").and("permisson_id = ?")
                .exec();
        boolean flag = false;
        Db.update("delete from ic_role_permission where role_id = ?", roleId);
        for (String pid : permission) {
            if (CmsUtil.isNullOrEmpty(RolePermission.dao.find(sql, roleId, pid))) {
                RolePermission rp = new RolePermission();
                rp.setRoleId(roleId);
                rp.setPermissonId(Integer.parseInt(pid));
                flag = rp.save();
            }
        }
        clearCacheAll();
        return flag;
    }

    public Page<Permission> getPermissionPageAll(int pageNumber) {
        return Permission.dao.paginateByCache(cacheName, "page_pageNumber_" + pageNumber, pageNumber,
                AppConfig.system_config.getInt(AppConst.PAGE_SIZE), "select *", "from " + table + " where pid = 0");
    }

    public List<Permission> getPermissionByParentId(int parentId) {
        String sql = SQLUtil.me().select("*").from(table).where("pid = ?").exec();
        return Permission.dao.findByCache(cacheName, "parentId_" + parentId, sql, parentId);

    }

    public boolean del(int id) {
        clearCacheAll();
        return Permission.dao.deleteById(id);
    }

    @Override
    public void clearCacheAll() {
        CacheKit.removeAll(cacheName);
    }
}
