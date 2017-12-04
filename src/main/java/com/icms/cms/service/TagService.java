package com.icms.cms.service;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.icms.cms.base.BaseService;
import com.icms.cms.model.Tag;
import com.icms.cms.model.TagContent;
import com.icms.common.util.SQLUtil;
import com.icms.common.util.CmsUtil;
import com.icms.config.AppConfig;
import com.icms.config.AppConst;
import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinal.plugin.ehcache.CacheKit;

public class TagService extends BaseService {

    public static final TagService service = Enhancer.enhance(TagService.class, Tx.class);

    private final String cacheName = "TAG_CACHE";
    private final String table = " ic_tag ";

    public void TagSave(Map<String, Object> params, Long contentId) {
        for (Entry<String, Object> entry : params.entrySet()) {
            Tag tag = getTagByName(entry.getKey());
            if (CmsUtil.isNullOrEmpty(tag)) {
                tag = new Tag();
                tag.setTagName(entry.getKey());
                tag.setLetter((String) entry.getValue());
                tag.setCount(1);
                tag.save();
                TagContent tc = new TagContent();
                tc.setTagId(tag.getTagId());
                tc.setContentId(contentId);
                tc.save();
                clearCacheAll();
            } else {
                TagContent tc = getTagContentByTagIdAndContentId(tag.getTagId(), contentId);
                if (CmsUtil.isNullOrEmpty(tc)) {
                    tc = new TagContent();
                    tc.setTagId(tag.getTagId());
                    tc.setContentId(contentId);
                    tc.save();
                }
                tag.setCount(tag.getCount() + 1);
                tag.update();
                clearCacheAll();
            }
        }

    }

    public boolean delByTagId(int tagId) {
        clearCacheAll();
        return Tag.dao.deleteById(tagId);
    }

    public Tag getTagByName(String name) {
        String sql = SQLUtil.me().select("*").from(table).where(" tag_name=?  ").exec();
        return Tag.dao.findFirstByCache(cacheName, "tag_name_catid" + name, sql, name);
    }

    /**
     * tag分页
     *
     * @param pageNumber
     * @return
     */
    public Page<Tag> getTagPageNumbaeAll(int pageNumber) {
        return Tag.dao.paginateByCache(cacheName, "tag_pageNumber_" + pageNumber, pageNumber, AppConfig.system_config.getInt(AppConst.PAGE_SIZE),
                SQLUtil.me().select("*").exec(), SQLUtil.me().from(table).exec());

    }

    public TagContent getTagContentByTagIdAndContentId(int tagId, Long contentId) {
        String sql = SQLUtil.me().select("*").from("ic_tag_content").where("tag_id = ?").and("content_id = ?").exec();
        return TagContent.dao.findFirstByCache(cacheName, "tagContent_tagId_contentId" + tagId + contentId, sql, tagId,
                contentId);
    }

    public Page<Tag> getTagPageByTagId(int tagId, int pageNumber) {

        String select = SQLUtil.me().select("t.tag_id,c.*").exec();
        String sqlExceptSelect = SQLUtil.me().from("from `ic_tag` t,ic_tag_content tc, ic_content c")
                .where("t.tag_id = tc.tag_id and tc.content_id = c.content_id and t.tag_id =?").exec();

        return Tag.dao.paginateByCache(cacheName, "tag_page_tagId_pageNumber" + tagId + pageNumber, pageNumber,
                AppConfig.system_config.getInt(AppConst.PAGE_SIZE), select, sqlExceptSelect, tagId);
    }

    public List<Tag> getTagListBySize(int size) {
        String sql = "select * from ic_tag limit 0,?";
        return Tag.dao.findByCache(cacheName, "tag_size_" + size, sql, size);
    }

    public List<Tag> getTagListBySizeAndOrderByCounter(int size) {
        String sql = "select * from ic_tag order by `count` desc limit 0,?";
        return Tag.dao.findByCache(cacheName, "tag_size_" + size, sql, size);
    }

    public Long getTagCount() {
        return Tag.dao.findFirstByCache(cacheName, "count", "select count(*) as c from " + table).getLong("c");

    }

    @Override
    public void clearCacheAll() {
        CacheKit.removeAll(cacheName);
    }

}
