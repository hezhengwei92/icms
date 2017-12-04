package com.icms.cms.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.icms.cms.base.BaseService;
import com.icms.cms.model.AdminRole;
import com.icms.cms.model.Role;
import com.icms.common.util.CmsUtil;
import com.icms.common.util.SQLUtil;
import com.icms.config.AppConfig;
import com.icms.config.AppConst;
import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinal.plugin.ehcache.CacheKit;

public class RoleService extends BaseService {

    public static final RoleService service = Enhancer.enhance(RoleService.class, Tx.class);
    private final String cacheName = AppConst.SERVICE_CACHE[6];
    private final String table = "ic_role";

    public int AddOrUpdate(Role role) {
        clearCacheAll();
        if (role.getRoleId() == null) {
            role.save();
            return role.getRoleId();
        }
        role.update();
        return role.getRoleId();
    }

    public Set<String> getRolesByUsername(String username) {
        String sql = "select r.* " + "from ic_admin a, ic_role r, ic_admin_role ar "
                + "where a.admin_id= ar.admin_id and r.role_id = ar.role_id and a.username  = ?";
        Set<String> set = new HashSet<String>();
        List<Role> roles = Role.dao.findByCache(cacheName, "roles" + username, sql, username);
        for (Role r : roles) {
            set.add(r.getStr("rolename"));
        }
        return set;
    }

    public List<Role> getRoleListAll() {
        return Role.dao.findByCache(cacheName, "all", SQLUtil.me().select("*").from(table).exec());
    }

    public Page<Role> getRolePageAll(int pageNumber) {
        String select = SQLUtil.me().select("*").exec();
        String sqlExceptSelect = SQLUtil.me().from(table).exec();

        return Role.dao.paginateByCache(cacheName, "all_page_" + pageNumber, pageNumber, AppConfig.system_config.getInt(AppConst.PAGE_SIZE), select,
                sqlExceptSelect);
    }

    public boolean del(int id) {
        if (id > 1) {
            String arSql = SQLUtil.me().delect().from("ic_admin_role").where("role_id=?").exec();
            String rpSql = SQLUtil.me().delect().from("ic_role_permission").where("role_id=?").exec();
            Db.update(arSql, id);
            Db.update(rpSql, id);
            clearCacheAll();
            return Role.dao.deleteById(id);
        }
        return false;

    }

    public Role getRoleById(int roleId) {
        return Role.dao.findById(roleId);
    }

    public String getRoleAdminNameByRoleId(int roleId) {
        String ars = "";
        String sql = SQLUtil.me().select("*").from("ic_admin a ,ic_admin_role ar").where("a.admin_id = ar.admin_id ")
                .and("role_id = ?").exec();
        List<AdminRole> ar = AdminRole.dao.find(sql, roleId);
        if (CmsUtil.isNullOrEmpty(ar)) {
            return "N/A";
        }
        for (int i = 0; i < ar.size(); i++) {
            ars += ar.get(i).get("username");
            if (i < ar.size() - 1) {
                ars += " , ";
            }
        }
        return ars;

    }

    public Role getRoleByRoleName(String roleName) {
        String sql = SQLUtil.me().select("*").from(table).where("rolename = ?").exec();
        return Role.dao.findFirst(sql, roleName);
    }

    @Override
    public void clearCacheAll() {
        CacheKit.removeAll(cacheName);
    }
}
