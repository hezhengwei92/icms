package com.icms.cms.service;

import com.icms.cms.base.BaseService;
import com.icms.cms.model.Ad;
import com.icms.config.AppConfig;
import com.icms.config.AppConst;
import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;

public class AdService extends BaseService {

    public static final AdService service = Enhancer.enhance(AdService.class);
    private final String cacheName = "ad_cache";
    private final String table = "ic_ad";

    public Page<Ad> getLinkPageAll(int pageNumber) {
        return Ad.dao.paginateByCache(cacheName, "page_" + pageNumber, pageNumber, AppConfig.system_config.getInt(AppConst.PAGE_SIZE), "SELECT *",
                " from " + table);
    }

    public boolean AddOrUpdate(Ad ad) {
        clearCacheAll();
        if (ad.getId() == null) {

            return ad.save();
        }
        return ad.update();
    }

    public boolean del(int id) {
        clearCacheAll();
        return Ad.dao.deleteById(id);

    }

    @Override
    public void clearCacheAll() {
        CacheKit.removeAll(cacheName);
    }

}
