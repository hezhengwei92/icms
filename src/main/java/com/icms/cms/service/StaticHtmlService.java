package com.icms.cms.service;

import java.util.HashMap;
import java.util.Map;

import com.icms.cms.model.Category;
import com.icms.cms.model.Content;
import com.icms.cms.model.Model;
import com.icms.cms.model.Website;
import com.icms.common.beetl.BeetlHtmlUtil;
import com.icms.common.util.CmsUtil;
import com.icms.config.AppConfig;
import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

public class StaticHtmlService {

    public static final StaticHtmlService service = Enhancer.enhance(StaticHtmlService.class);

    public void IndexStatic(final String domain, final int siteId, final String theme, final String tpl) {
        BeetlHtmlUtil bhu = new BeetlHtmlUtil(domain, siteId);
        Map<String, Object> attr = new HashMap<String, Object>();
        attr.put("categoryId", 5l);
        attr.put("contentId", 2l);
        bhu.create("index", attr, theme, tpl);

    }

    public void ContentStatic(final Website site, final Category category, final long contentId) {

        BeetlHtmlUtil bhu = new BeetlHtmlUtil(site.getDomain(), site.getSiteId());
        Map<String, Object> attr = new HashMap<String, Object>();
        Model model = ModelService.service.getModelByModelId(category.getModelId());
        Record content = ContentService.service.getContentByContentIdAndTableName(contentId, model.getTableName());
        attr.put("site", site.getSitename());
        attr.put("title", content.getStr("title"));
        attr.put("keyword", content.getStr("keywords"));
        attr.put("description", content.getStr("description"));
        bhu.create(category.getShortname() + "-c-" + content.getLong("content_id"), attr, site.getTemplate(),
                category.getContentTpl());

    }

    public void ChannelStatic(final Website site, final Category category) {
        AppConfig.is_static = true;
        BeetlHtmlUtil bhu = new BeetlHtmlUtil(site.getDomain(), site.getSiteId());
        Map<String, Object> attr = new HashMap<String, Object>();
        attr.put("site", site.getSitename());
        attr.put("title", category.getCategoryName());
        attr.put("keyword", site.getKeyword());
        attr.put("description", site.getDescription());
        attr.put("channelId", 9l);
        attr.put("contentId", 34l);
        // 判断是否为单页面
        if (category.getAlone()) {
            attr.put("content", category.getContent());
        }
        // 如果分类为外部链接则不生成静态
        if (CmsUtil.isBlank(category.getUrl())) {
            bhu.create(category.getShortname(), attr, site.getTemplate(), category.getIndexTpl());
        }

    }

    public void ListStatic(final Website site, int pageNumber, final Category category) {

        Page<Content> page = ContentService.service.getContentPageByCatId(pageNumber, category.getCategoryId());
        BeetlHtmlUtil bhu = new BeetlHtmlUtil(site.getDomain(), site.getSiteId());
        Map<String, Object> attr = new HashMap<String, Object>();
        attr.put("site", site.getSitename());
        attr.put("title", category.getCategoryName());
        attr.put("keyword", site.getKeyword());
        attr.put("description", site.getDescription());
        attr.put("channelId", category.getCategoryId());
        attr.put("siteId", site.getSiteId());
        attr.put("page", page);
        bhu.create(category.getShortname(), attr, site.getTemplate(), category.getContentTpl());

    }

}
