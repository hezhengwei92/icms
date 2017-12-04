package com.icms.cms.web.admin;

import java.util.List;

import com.icms.cms.base.BaseController;
import com.icms.cms.model.Category;
import com.icms.cms.model.Content;
import com.icms.cms.model.Website;
import com.icms.cms.service.CategoryService;
import com.icms.cms.service.ContentService;
import com.icms.cms.service.SiteService;
import com.icms.cms.service.StaticHtmlService;
import com.icms.common.thread.HtmlThread;
import com.jfinal.plugin.activerecord.Page;

public class HtmlController extends BaseController {

	public void index() {
		String domain = getDomain();
		Website site = SiteService.service.getWebsiteByDomain(domain);
		StaticHtmlService.service.IndexStatic(domain, site.getSiteId(), site.getTemplate(), "index");
	}

	public void channel() {
		Long channelId = getParaToLong(0, 0l);
		String domain = getDomain();
		Website site = SiteService.service.getWebsiteByDomain(domain);
		if (channelId > 0) {
			Category category = CategoryService.service.getCategoryByCatId(channelId);
			StaticHtmlService.service.ChannelStatic(site, category);
		} else {
			List<Category> categorys = CategoryService.service.getCategoryListBySiteId(site.getSiteId());
			for (Category category : categorys) {
				StaticHtmlService.service.ChannelStatic(site, category);
			}
		}
		 if(HtmlThread.isEmpty()){
			 renderSuccess("生成成功！");
		 }
	}

	public void list() {
		Long channelId = getParaToLong(0, 0l);
		String domain = getDomain();
		Website site = SiteService.service.getWebsiteByDomain(domain);
		if (channelId > 0) {
			Category category = CategoryService.service.getCategoryByCatId(channelId);
			int pageNumber = 1;
			Page<Content> page = ContentService.service.getContentPageByCatId(pageNumber, category.getCategoryId());
			for (int i = 0; i <= page.getTotalPage(); i++) {
				StaticHtmlService.service.ListStatic(site, pageNumber, category);
				pageNumber++;
			}
		} else {
			List<Category> categorys = CategoryService.service.getCategoryListBySiteId(site.getSiteId());
			for (Category category : categorys) {
				int pageNumber = 1;
				Page<Content> page = ContentService.service.getContentPageByCatId(pageNumber, category.getCategoryId());
				for (int i = 0; i < page.getTotalPage(); i++) {
					StaticHtmlService.service.ListStatic(site, pageNumber, category);
					pageNumber++;
				}
			}
		}
		
	 if(HtmlThread.isEmpty()){
		 renderSuccess("生成成功！");
	 }

	}

	public void content() {
		Long contentId = getParaToLong(1, 0l);
		Long channelId = getParaToLong(0, 0l);
		String domain = getDomain();
		Website site = SiteService.service.getWebsiteByDomain(domain);
		if (contentId > 0) {
			Category category = CategoryService.service.getCategoryByCatId(channelId);

			StaticHtmlService.service.ContentStatic(site, category, contentId);

		} else if (channelId > 0) {
			Category category = CategoryService.service.getCategoryByCatId(channelId);
			List<Content> list = ContentService.service.getContentListBySiteIdAndCatId(site.getSiteId(),
					category.getCategoryId(), 0, 0, 0);
			for (Content content : list) {
				StaticHtmlService.service.ContentStatic(site, category, content.getContentId());
			}
		} else {
			List<Category> categorys = CategoryService.service.getCategoryListBySiteId(site.getSiteId());
			for (Category category : categorys) {
				List<Content> list = ContentService.service.getContentListBySiteIdAndCatId(site.getSiteId(),
						category.getCategoryId(), 0, 0, 0);
				for (Content content : list) {
					StaticHtmlService.service.ContentStatic(site, category, content.getCategoryId());
				}
			}
		}

	}
}
