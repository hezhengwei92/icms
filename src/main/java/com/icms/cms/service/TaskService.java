package com.icms.cms.service;

import java.util.List;

import com.icms.cms.base.BaseService;
import com.icms.cms.model.TaskContent;
import com.icms.common.util.SQLUtil;
import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.ehcache.CacheKit;

public class TaskService extends BaseService {

    public static final TaskService service = Enhancer.enhance(TaskService.class);
    private final String cacheName = "TASK_CACHE";
    private final String table = " ic_task_content ";

    public List<TaskContent> getTaskAll() {
        return TaskContent.dao.findByCache(cacheName, "all", SQLUtil.me().select("*").from(table).where("status = 1").exec());
    }

    @Override
    public void clearCacheAll() {
        CacheKit.removeAll(cacheName);
    }

}
