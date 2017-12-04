package com.icms.cms.service;

import java.io.IOException;

import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import com.icms.cms.base.BaseService;
import com.icms.cms.base.ContentListener;
import com.icms.cms.model.Category;
import com.icms.cms.model.Content;
import com.icms.cms.model.SearchWords;
import com.icms.cms.model.Website;
import com.icms.common.lucene.LuceneDao;
import com.icms.common.lucene.common.QueryUtil;
import com.icms.common.lucene.common.SearchResultEntity;
import com.icms.common.lucene.entity.ContentIndexEntity;
import com.icms.common.util.CmsUtil;
import com.icms.common.util.SQLUtil;
import com.icms.config.AppConfig;
import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

public class LuceneService extends BaseService implements ContentListener {

    public static final LuceneService service = Enhancer.enhance(LuceneService.class, Tx.class);
    private final String table = "ic_search_words";
    private final String cacheName = "search_words_cache";

    @Override
    public void save(Content content) {
        Category cat = CategoryService.service.getCategoryByCatId(content.getCategoryId());
        Website site = SiteService.service.getWebsiteBySiteId(cat.getSiteId());
        String url = AppConfig.http_protocol + "://" + site.getDomain();
        if (AppConfig.is_static) {
            url += "/html/" + site.getSiteId() + "/" + cat.getShortname() + "-c-" + content.getContentId();
        } else {
            url += "/" + cat.getShortname() + "-c-" + content.getContentId();
        }
        ContentIndexEntity contentIndex = new ContentIndexEntity();
        contentIndex.setContentId(content.getContentId() + "");
        contentIndex.setContent(content.getContent());
        contentIndex.setTitle(content.getTitle());
        if (CmsUtil.isBlank(content.getUrl())) {
            contentIndex.setUrl(url);
        } else {
            contentIndex.setUrl(content.getUrl());
        }
        LuceneDao.addIndexContentEntity(contentIndex);
    }


    @Override
    public void delete(Long contentId) {
        ContentIndexEntity contentIndex = new ContentIndexEntity();
        contentIndex.setContentId(contentId + "");
        LuceneDao.delIndexContentEntity(contentIndex);
    }

    public void deleteAll() {
        try {
            LuceneDao.IndexManager.getWriter().deleteAll();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public SearchResultEntity saerch(String keywords, int pageNumber) {
        IndexSearcher searcher = LuceneDao.IndexManager.getSearcher();
        SearchResultEntity result = null;
        try {
            Query query = QueryUtil.ContentQuery(keywords, "title", "content");
            result = LuceneDao.search(searcher, query, pageNumber, 10, null, null, query, SearchResultEntity.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean updateSearchKeyWord(String keywords, int siteId) {

        String sql = SQLUtil.me().select("*").from(table).where("name = ?").exec();

        SearchWords sw = SearchWords.dao.findFirstByCache(cacheName, keywords, sql);
        if (CmsUtil.isNullOrEmpty(sw)) {
            sw = new SearchWords();
            sw.setName(keywords);
            sw.setSiteId(siteId);
            sw.setHitCount(0);
            sw.setIsRecommend(false);
            return sw.save();
        }
        sw.setHitCount(sw.getHitCount() + 1);
        return sw.update();

    }

    @Override
    public void clearCacheAll() {

    }


}
