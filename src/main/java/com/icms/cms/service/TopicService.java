package com.icms.cms.service;

import java.util.List;

import com.icms.cms.base.BaseService;
import com.icms.cms.model.Topic;
import com.icms.common.util.SQLUtil;
import com.icms.config.AppConfig;
import com.icms.config.AppConst;
import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinal.plugin.ehcache.CacheKit;

public class TopicService extends BaseService {

    public static final TopicService service = Enhancer.enhance(TopicService.class, Tx.class);
    private final String table = " ic_topic ";
    private final String cacheName = "topic_cache";

    public boolean AddOrUpdate(Topic t) {
        if (t.getTopicId() == null) {
            clearCacheAll();
            return t.save();
        }
        CacheKit.remove(cacheName, t.getTopicId());
        return t.update();
    }

    public Topic getTopicByTopicId(int topicId) {
        String sql = SQLUtil.me().select("*").from(table).where("topic_id = ?").exec();
        return Topic.dao.findFirstByCache(cacheName, topicId, sql, topicId);
    }

    public Page<Topic> getPageAll(int pageNumber) {
        String select = SQLUtil.me().select("*").exec();
        String sqlExceptSelect = SQLUtil.me().from(table).exec();
        return Topic.dao.paginateByCache(cacheName, "page_" + pageNumber, pageNumber, AppConfig.system_config.getInt(AppConst.PAGE_SIZE), select, sqlExceptSelect);
    }

    public boolean delByTopicId(int topicId) {
        clearCacheAll();
        return Topic.dao.deleteById(topicId);
    }

    public List<Topic> getTopicListBySize(int size) {
        String sql = "select * from ic_topic limit 0,?";
        return Topic.dao.findByCache(cacheName, "topic_size_" + size, sql, size);
    }

    public List<Topic> getTopicListBySizeAndOrderByTopicId(int size) {
        String sql = "select * from ic_topic order by `topic_id` desc limit 0,?";
        return Topic.dao.findByCache(cacheName, "topic_size_" + size, sql, size);
    }


    @Override
    public void clearCacheAll() {
        CacheKit.removeAll(cacheName);
    }

}
