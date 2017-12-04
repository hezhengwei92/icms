package com.icms.cms.service;

import java.util.List;

import com.icms.cms.base.BaseService;
import com.icms.cms.model.Category;
import com.icms.common.util.CmsUtil;
import com.icms.config.AppConst;
import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.ehcache.CacheKit;

public class CategoryService extends BaseService {

    public static final CategoryService service = Enhancer.enhance(CategoryService.class);
    private final String table = " ic_category ";
    private final String cacheName = AppConst.SERVICE_CACHE[AppConst.CATEGORY_CACHE];

    /**
     * 添加或更新分类
     *
     * @param category
     * @return
     */
    public boolean AddOrUpdateModel(Category category) {
        clearCacheAll();
        if (category.getCategoryId() == null) {
            return category.save();
        }
        return category.update();
    }

    /**
     * 删除
     *
     * @param catId
     * @return
     */
    public boolean DeleteCategoryByCategoryId(Long catId) {
        clearCacheAll();
        if (!CmsUtil.isNullOrEmpty(ContentService.service.getContentListByCatId(catId))) {
            return false;
        }
        Db.update("delete from " + table + " where parent_id = ?", catId);
        return Category.dao.deleteById(catId);

    }

    /**
     * 根据站点查询分类配置
     *
     * @param siteId
     * @param category
     * @return
     */
    public Category getCategoryBySiteIdAndCategoryName(long siteId, String categoryName) {
        String sql = "select * from " + table + " where site_id = ? and shortname = ?";
        return Category.dao.findFirstByCache(cacheName, "category_siteId_categoryName" + siteId + categoryName, sql, siteId,
                categoryName);
    }

    /**
     * 根据站点查询分类配置
     *
     * @param siteId
     * @param category
     * @return
     */
    public Category getCategoryBySiteIdAndCategoryId(int siteId, long catId) {
        String sql = "select * from " + table + " where site_id = ? and category_id = ?";
        return Category.dao.findFirstByCache(cacheName, "category_siteId_catId" + siteId + catId, sql, siteId,
                catId);
    }

    /**
     * 根据站点查询分类配置
     *
     * @param siteId
     * @param category
     * @return
     */
    public List<Category> getCategoryBySiteIdAndParentId(long siteId, long parentId) {
        String sql = "select * from " + table + " where site_id = ?  and parent_id = ?";
        return Category.dao.findByCache(cacheName, "category_siteId_parentId" + siteId + parentId, sql, siteId,
                parentId);
    }

    /**
     * 根据站点查询分类列表
     *
     * @param siteId
     * @return
     */
    public List<Category> getCategoryListBySiteId(Integer siteId) {
        String sql = "select * from " + table + " where site_id = ? and alone <> 1";
        return Category.dao.findByCache(cacheName, "category_list_siteId" + "siteId" + siteId, sql, siteId);

    }

    /**
     * 根据站点查询分类列表
     *
     * @param siteId
     * @return
     */
    public List<Category> getCategoryAllBySiteId(Integer siteId) {
        String sql = "select * from " + table + " where site_id = ?";
        return Category.dao.findByCache(cacheName, "category_all_siteId" + "siteId" + siteId, sql, siteId);

    }

    /**
     * 根据站点查询分类列表
     *
     * @param siteId
     * @return
     */
    public List<Category> getCategoryListBySiteIdAndNotAloneAndUrlIsNull(Integer siteId) {
        String sql = "select * from `ic_category` where site_id = ? and alone <> 1 and url is null or url =''";
        return Category.dao.findByCache(cacheName, "category_list_siteId_isNull" + "siteId" + siteId, sql, siteId);

    }

    /**
     * 根据分类编号查询分类
     *
     * @param catId
     * @return
     */
    public Category getCategoryByCatId(Long catId) {
        String sql = "select * from " + table + " where category_id = ?";
        return Category.dao.findFirstByCache(cacheName, "category_catid_" + catId, sql, catId);
    }

    /**
     * 根据分类编号查询分类
     *
     * @param catId
     * @return
     */
    public List<Category> getCategoryByParentId(Long parentId, int isNav) {
        String sql = "select * from " + table + " where parent_id = ? "
                + "and is_nav = ?";
        return Category.dao.findByCache(cacheName, "category_parentId_isNav" + parentId, sql, parentId, isNav);
    }

    public Category getCategoryByCatName(String catName) {
        String sql = "select * from " + table + " where category_name = ?";
        return Category.dao.findFirstByCache(cacheName, "category_catname" + catName, sql, catName);
    }

    public Category getCategoryByshortname(String shortname) {
        String sql = "select * from " + table + " where shortname = ?";
        return Category.dao.findFirstByCache(cacheName, "category_shortname" + "shortname" + shortname, sql,
                shortname);
    }

    @Override
    public void clearCacheAll() {
        CacheKit.removeAll(cacheName);
    }
}
