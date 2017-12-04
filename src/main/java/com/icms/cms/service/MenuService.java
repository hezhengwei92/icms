package com.icms.cms.service;

import java.util.List;

import com.icms.cms.base.BaseService;
import com.icms.cms.model.Menu;
import com.icms.common.util.SQLUtil;
import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinal.plugin.ehcache.CacheKit;

public class MenuService extends BaseService {

    public static final MenuService service = Enhancer.enhance(MenuService.class, Tx.class);
    private final String table = "ic_menu";
    private final String cacheName = "menu_cache";

    public boolean AddOrUpdate(Menu menu) {
        clearCacheAll();
        if (menu.getMenuId() == null) {

            return menu.save();
        }
        return menu.update();
    }

    public Page<Menu> getMenuPageAll(int pageNumber) {
        return Menu.dao.paginateByCache(cacheName, "page_" + pageNumber, pageNumber, 2, "SELECT *",
                " from " + table + " where pid = 0");
    }

    public List<Menu> getMenuByParentId(int pid) {
        String sql = SQLUtil.me().select("*").from(table).where("pid = ?").exec();
        return Menu.dao.findByCache(cacheName, "parentId_" + pid, sql, pid);
    }

    public boolean del(int id) {
        clearCacheAll();
        return Menu.dao.deleteById(id);

    }

    @Override
    public void clearCacheAll() {
        CacheKit.removeAll(cacheName);
    }

}
