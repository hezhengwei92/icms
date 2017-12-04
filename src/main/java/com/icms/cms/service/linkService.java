package com.icms.cms.service;

import java.util.List;

import com.icms.cms.base.BaseService;
import com.icms.cms.model.Link;
import com.icms.config.AppConfig;
import com.icms.config.AppConst;
import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;

public class linkService extends BaseService {

    public static final linkService service = Enhancer.enhance(linkService.class);
    private final String cacheName = "link_cache";
    private final String table = "ic_link";

    public Page<Link> getLinkPageAll(int pageNumber) {
        return Link.dao.paginateByCache(cacheName, "page_" + pageNumber, pageNumber, AppConfig.system_config.getInt(AppConst.PAGE_SIZE), "SELECT *",
                " from " + table);
    }

    public boolean AddOrUpdate(Link link) {
        clearCacheAll();
        if (link.getLinkId() == null) {

            return link.save();
        }
        return link.update();
    }

    public boolean del(int id) {
        return Link.dao.deleteById(id);

    }

    public List<Link> getLinkList(int count) {

        String sql = "select * from `ic_link` where img is null limit 0,?";

        return Link.dao.findByCache(cacheName, "link" + count, sql, count);

    }

    public List<Link> getLinkListWithImg(int count) {
        String sql = "select * from `ic_link` where img is not null limit 0,?";

        return Link.dao.findByCache(cacheName, "link_not" + count, sql, count);


    }

    @Override
    public void clearCacheAll() {
        CacheKit.removeAll(cacheName);
    }

}
