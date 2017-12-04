package com.icms.cms.service;

import java.util.List;

import com.icms.cms.base.BaseService;
import com.icms.cms.model.Config;
import com.icms.common.util.SQLUtil;
import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.ehcache.CacheKit;

public class ConfigService extends BaseService {

    public static final ConfigService service = Enhancer.enhance(ConfigService.class);
    private final String table = " ic_config ";
    private final String cacheName = "CONFIG_CACHE";


    public List<Config> getConfigListAll() {
        String sql = SQLUtil.me().select("*").from(table).exec();
        return Config.dao.find(sql);
    }

    @Override
    public void clearCacheAll() {
        CacheKit.removeAll(cacheName);
    }
}
