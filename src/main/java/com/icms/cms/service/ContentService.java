package com.icms.cms.service;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.icms.cms.base.BaseService;
import com.icms.cms.model.Content;
import com.icms.common.util.SQLUtil;
import com.icms.common.util.CmsUtil;
import com.icms.config.AppConfig;
import com.icms.config.AppConst;
import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.DbPro;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinal.plugin.ehcache.CacheKit;

public class ContentService extends BaseService {

    public static final ContentService service = Enhancer.enhance(ContentService.class, Tx.class);
    private final String table = " ic_content ";
    private final String cacheName = AppConst.SERVICE_CACHE[AppConst.CONTENT_CACHE];

    /**
     * 不带条件查询
     *
     * @param pageNumber
     * @param catid
     * @param mindate
     * @param maxdate
     * @param keyword
     * @return
     */
    public Page<Content> getContentPageByCatId(int pageNumber, long catid) {
        String select = "select * ";
        String sqlExceptSelect = "from " + table + " where category_id = ? and status <> 0 and is_del <> 1";
        return Content.dao.paginateByCache(cacheName, "content_page_catid" + pageNumber + catid, pageNumber,
                AppConfig.system_config.getInt(AppConst.PAGE_SIZE), select, sqlExceptSelect, catid);
    }

    /**
     * 带条件查询
     *
     * @param pageNumber
     * @param catid
     * @param mindate
     * @param maxdate
     * @param keyword
     * @return
     */
    public Page<Content> getContentPageByCatId(int pageNumber, long catid, String mindate, String maxdate,
                                               String keyword, int status) {
        String select = "select * ";
        String sqlExceptSelect = "from " + table + " where category_id = ? and is_del <> 1";
        if (!CmsUtil.isBlank(mindate)) {
            sqlExceptSelect += " and inputdate  like '%" + mindate + "%'";
        }

        if (!CmsUtil.isBlank(maxdate)) {
            sqlExceptSelect += " and inputdate  like '%" + maxdate + "%'";
        }

        if (!CmsUtil.isBlank(keyword)) {
            sqlExceptSelect += " and title like '%" + keyword.trim() + "%'";
        }
        if (status < 2) {
            sqlExceptSelect += " and   status =" + status;
        }
        System.out.println("sql " + sqlExceptSelect);
        return Content.dao.paginateByCache(cacheName,
                "content_page_catid" + mindate + maxdate + keyword + pageNumber + catid + status, pageNumber,
                AppConfig.system_config.getInt(AppConst.PAGE_SIZE), select, sqlExceptSelect, catid);
    }

    public Page<Content> getContentPageByParentId(int pageNumber, String childId, String mindate, String maxdate,
                                                  String keyword, int status) {
        String select = "select * ";
        String sqlExceptSelect = "from " + table + " where category_id in ( " + childId + " ) and is_del <> 1";
        if (!CmsUtil.isBlank(mindate)) {
            sqlExceptSelect += " and inputdate  like '%" + mindate + "%'";
        }

        if (!CmsUtil.isBlank(maxdate)) {
            sqlExceptSelect += " and inputdate  like '%" + maxdate + "%'";
        }

        if (!CmsUtil.isBlank(keyword)) {
            sqlExceptSelect += " and title like '%" + keyword.trim() + "%'";
        }
        if (status < 2) {
            sqlExceptSelect += " and   status =" + status;
        }
        System.out.println("sql " + sqlExceptSelect);
        return Content.dao.paginateByCache(cacheName,
                "content_page_catid" + mindate + maxdate + keyword + pageNumber + childId + status, pageNumber,
                AppConfig.system_config.getInt(AppConst.PAGE_SIZE), select, sqlExceptSelect);
    }

    public Page<Content> getContentPageIsDelByCatId(int pageNumber, long catid) {
        String select = "select * ";
        String sqlExceptSelect = "from " + table + " where category_id = ? and is_del = 1";
        return Content.dao.paginateByCache(cacheName, "content_page_IsDel_catid" + pageNumber + catid, pageNumber,
                AppConfig.system_config.getInt(AppConst.PAGE_SIZE), select, sqlExceptSelect, catid);
    }

    public Page<Content> getContentPageIsDelAll(int pageNumber) {
        String select = "select * ";
        String sqlExceptSelect = "from " + table + " where  is_del = 1";
        return Content.dao.paginateByCache(cacheName, "content_page_isDel_All" + pageNumber, pageNumber,
                AppConfig.system_config.getInt(AppConst.PAGE_SIZE), select, sqlExceptSelect);
    }

    public Page<Content> getContentAllPage(int pageNumber, String mindate, String maxdate, String keyword, int status) {
        String select = "select * ";
        String sqlExceptSelect = "from " + table + " where  is_del <> 1";
        if (!CmsUtil.isBlank(mindate)) {
            sqlExceptSelect += " and inputdate like '%" + mindate + "%'";
        }

        if (!CmsUtil.isBlank(maxdate)) {
            sqlExceptSelect += " and inputdate  like '%" + maxdate + "%'";
        }

        if (!CmsUtil.isBlank(keyword)) {
            sqlExceptSelect += " and   title  like '%" + keyword.trim() + "%'";
        }

        if (status < 2) {
            sqlExceptSelect += " and   status =" + status;
        }
        return Content.dao.paginateByCache(cacheName,
                "content_all_page_search" + mindate + maxdate + keyword + pageNumber + status, pageNumber,
                AppConfig.system_config.getInt(AppConst.PAGE_SIZE), select, sqlExceptSelect);
    }

    public Page<Content> getContentAllPage(int pageNumber) {
        String select = "select * ";
        String sqlExceptSelect = "from " + table;
        return Content.dao.paginateByCache(cacheName, "content_all_page" + pageNumber, pageNumber, AppConfig.system_config.getInt(AppConst.PAGE_SIZE),
                select, sqlExceptSelect);
    }

    /**
     * 获取自定义模型表的
     *
     * @param pageNumber
     * @param tableName
     * @param modelId
     * @param keys
     * @return
     */
    public Page<Record> getContentByModelIdAndFiledNames(int pageNumber, String tableName, int modelId,
                                                         Map<String, Object> keys) {
        String where = "1=1";
        String selectFiled = "";
        String key = "";
        // 遍历找出modelFiled值
        for (Entry<String, Object> entry : keys.entrySet()) {
            where += " and " + entry.getKey() + " = " + "'" + entry.getValue() + "'";
            selectFiled += "n." + entry.getKey() + ",";
            key += entry.getValue();
        }
        // 拼接查询
        String select = SQLUtil.me().select(selectFiled + "c.*").exec();
        String sqlExceptSelect = SQLUtil.me().empty().from("ic_content_" + tableName + " n").join("ic_content c ")
                .on("n.content_id = c.content_id").where(where).exec();
        return Db.paginateByCache(cacheName, "content_ModelId_FiledNames_page_" + pageNumber + key, pageNumber,
                AppConfig.system_config.getInt(AppConst.PAGE_SIZE), select, sqlExceptSelect);
    }

    public List<Content> getContentListByCatId(long catId) {
        return Content.dao.findByCache(cacheName, "content_list_catId" + catId,
                "select * from " + table + " where category_id = ? ", catId);
    }

    public Content getContentByContentId(Long contentId) {

        return Content.dao.findFirstByCache(cacheName, "content_contentId_" + contentId,
                "select * from " + table + "where content_id = ? and status = 1 and is_del<> 1", contentId);

    }

    /**
     * 获取自定义模型表和内容表的信息
     *
     * @param contentId
     * @param tableName
     * @return
     */
    public Record getContentByContentIdAndTableName(Long contentId, String tableName) {
        String sql = SQLUtil.me()
                .select(" c.title,c.model_id,c.keywords,c.content,c.description,c.thumb,c.inputdate,c.updatedate,c.url,c.username,m.* ")
                .from("ic_content c ").join("ic_content_" + tableName + "  m  ").on("  c.content_id = m.content_id  ")
                .where("  c.content_id = ? ").exec();
        Record record = Db.findFirstByCache(cacheName, "content_id_tableName" + contentId + tableName, sql, contentId);
        if (!CmsUtil.isNullOrEmpty(record)) {
            Content content = Content.dao.findById(contentId);
            content.setViewNum(content.getViewNum() + 1);
            content.update();
        }
        return record;

    }

    /**
     * 查询内容列表
     *
     * @param SiteId
     * @param catId
     * @return
     */
    public List<Content> getContentListBySiteIdAndCatId(long SiteId, long catId, int recommend, int orderBy,
                                                        int isHot) {
        String sql = SQLUtil.me().select("*").from("ic_category cat").join(" ic_content  c ")
                .on("cat.category_id = c.category_id").where("site_id = ?").and("cat.category_id = ?").and("status = 1")
                .and("is_del <> 1").and("c.recommend = ?").exec();
        if (isHot == 0)
            sql += SQLUtil.me().orderBy("c.content_id", 1).exec();
        else
            sql += SQLUtil.me().orderBy("c.view_num", 1).exec();
        log.info("sql:" + sql);
        return Content.dao.findByCache(cacheName, "content_list_catId_siteId" + catId + SiteId, sql, SiteId, catId,
                recommend);
    }

    /***
     * 查询内容列表
     *
     * @param SiteId
     * @param catId
     * @return
     */
    public List<Content> getContentListBySiteIdAndParentId(long SiteId, long catId, int recommend, int orderBy) {

        String sql = "select * " + "from ic_category as cat inner join ic_content as c "
                + "on cat.category_id = c.category_id " + "where " + "site_id = ? " + "and " + "cat.parent_id = ? "
                + " or " + "cat.category_id = ? " + "order by content_id ";
        if (orderBy == 1) {
            sql += " desc ";
        }
        return Content.dao.findByCache(cacheName, "content_list_siteId_catId" + catId + SiteId, sql, SiteId, catId,
                catId, recommend);
    }

    /**
     * 查询自定义模型字段是否和content表的字段相同
     *
     * @param name
     * @return
     */
    public boolean getContentCloumNameIsNull(String name) {
        // return CmsUtil.isNullOrEmpty(
        // Db.findFirst("select ic.COLUMN_NAME from information_schema.COLUMNS
        // ic where ic.table_name= ic_content and table_schema= 'cms' and
        // ic.COLUMN_NAME = ?"
        // ,name));
        boolean isNull = false;
        String sql = "select `" + name + "` from " + table;
        try {
            DbPro.use().queryColumn(sql);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            isNull = true;
        }
        return isNull;
    }

    /**
     * 添加或更新Content
     *
     * @param category
     * @return
     */
    public boolean AddOrUpdateContent(Map<String, Object> prams, String tableName, Content content) {
        clearCacheAll();
        if (content.getContentId() == null) {
            content.save();
            LuceneService.service.save(content);
            return AddOrUpdateContentModel(prams, tableName, content.getContentId(), false);
        }
        content.update();
        LuceneService.service.save(content);
        return AddOrUpdateContentModel(prams, tableName, content.getContentId(), true);
    }

    /**
     * 添加更新model表
     *
     * @param prams
     * @param tableName
     * @param contentId
     * @param isUpdate
     * @return
     */
    public boolean AddOrUpdateContentModel(Map<String, Object> prams, String tableName, Long contentId,
                                           boolean isUpdate) {
        Record record = new Record();
        record.set("content_id", contentId);
        for (Entry<String, Object> entry : prams.entrySet()) {
            record.set(entry.getKey(), entry.getValue());
        }
        if (isUpdate)
            return Db.update("ic_content_" + tableName, "content_id", record);
        return Db.save("ic_content_" + tableName, record);

    }

    /**
     * 更新内容的发布状态
     *
     * @param contentId
     */
    public boolean updateContentStatus(Long contentId) {
        clearCacheAll();
        String sql = SQLUtil.me().select("*").from(table).where("content_id = ?").exec();
        Content content = Content.dao.findFirstByCache(cacheName, contentId, sql, contentId);
        if (content.getStatus()) {
            content.setStatus(false);

        } else {
            content.setStatus(true);
        }
        return content.update();
    }

    /**
     * 更新内容的删除状态
     *
     * @param contentId
     */
    public boolean updateContentIsDel(Long contentId) {
        clearCacheAll();
        String sql = SQLUtil.me().select("*").from(table).where("content_id = ?").exec();
        Content content = Content.dao.findFirstByCache(cacheName, "contentId_" + contentId, sql, contentId);
        System.out.println("zhuangtai: " + content.getTitle());
        if (content.getIsDel()) {
            content.setIsDel(false);
        } else {
            content.setIsDel(true);
            LuceneService.service.delete(contentId);
        }
        return content.update();
    }

    /**
     * 从数据库中删除
     *
     * @param contentId
     * @return
     */
    public boolean del(Long contentId) {
        Content content = Content.dao.findById(contentId);
        String tableName = ModelService.service.getModelByModelId(content.getModelId()).getTableName();
        if (content.delete()) {
            clearCacheAll();
            return Db.deleteById("ic_content_" + tableName, "content_id", contentId);
        }
        return false;
    }

    public List<Content> getContentByTopicCats(String cats) {
        String sql = "select * from `ic_content` where category_id IN(" + cats + ")";
        return Content.dao.findByCache(cacheName, "cats_" + cats, sql);

    }

    public List<Content> getContentByTopicCatsAndRecommend(String cats) {
        String sql = "select * from `ic_content` where category_id IN(" + cats + ") and recommend = 1";
        return Content.dao.findByCache(cacheName, "cats_" + cats, sql);

    }

    @Override
    public void clearCacheAll() {
        CacheKit.removeAll(cacheName);
    }

}
