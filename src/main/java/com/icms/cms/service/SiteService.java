package com.icms.cms.service;

import java.util.List;

import com.icms.cms.base.BaseService;
import com.icms.cms.model.Link;
import com.icms.cms.model.Website;
import com.icms.common.util.SQLUtil;
import com.icms.config.AppConfig;
import com.icms.config.AppConst;
import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;

public class SiteService extends BaseService {

    public static final SiteService service = Enhancer.enhance(SiteService.class);
    public static final String table = "ic_website";
    public static final String cacheName = AppConst.SERVICE_CACHE[AppConst.SITE_CACHE];

    public Website getWebsiteByDomain(String domain) {
        String sql = "select * from " + table + " where domain=?";
        return Website.dao.findFirstByCache(cacheName, "website_domain" + domain, sql, domain);
    }

    public Website getWebsiteBySiteId(int siteId) {
        String sql = "select * from " + table + " where site_id=?";
        return Website.dao.findFirstByCache(cacheName, "website_siteId" + siteId, sql, siteId);
    }

    public List<Website> getWebsiteAll() {
        String sql = SQLUtil.me().select("*").from(table).exec();
        return Website.dao.findByCache(cacheName, "all", sql);
    }

    public Page<Website> getLinkPageAll(int pageNumber) {
        return Website.dao.paginateByCache(cacheName, "page_" + pageNumber, pageNumber, AppConfig.system_config.getInt(AppConst.PAGE_SIZE), "SELECT *",
                " from " + table);
    }

    public boolean AddOrUpdate(Website Website) {
        clearCacheAll();
        if (Website.getSiteId() == null) {

            return Website.save();
        }
        return Website.update();
    }

    public boolean del(int id) {
        clearCacheAll();
        if (id > 1)
            return Website.dao.deleteById(id);
        return false;

    }

    @Override
    public void clearCacheAll() {
        CacheKit.removeAll(cacheName);
    }
}
