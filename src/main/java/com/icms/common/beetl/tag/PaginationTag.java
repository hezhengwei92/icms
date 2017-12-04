package com.icms.common.beetl.tag;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.beetl.core.GeneralVarTagBinding;

import com.icms.cms.model.Content;
import com.icms.cms.model.Website;
import com.icms.cms.service.CategoryService;
import com.icms.cms.service.SiteService;
import com.icms.common.lucene.common.BaseSearchResultEntity;
import com.icms.common.lucene.common.SearchResultEntity;
import com.icms.common.util.CmsUtil;
import com.icms.common.vo.PageActionVo;
import com.icms.common.vo.PaginateVo;
import com.icms.config.AppConfig;
import com.jfinal.plugin.activerecord.Page;

public class PaginationTag extends GeneralVarTagBinding {

	private final Logger log = Logger.getLogger(PaginationTag.class);

	@SuppressWarnings("unchecked")
	@Override
	public void render() {
		int siteId = this.getAttributeValue("siteId") == null ? 0 : (Integer) this.getAttributeValue("siteId");
		long channelId = this.getAttributeValue("channelId") == null ? 0L : (Long) this.getAttributeValue("channelId");
		String action = (String) this.getAttributeValue("action");

		if (this.getAttributeValue("page") instanceof Page) {
			Page<Content> contentPage = (Page<Content>) this.getAttributeValue("page");
			Website site = SiteService.service.getWebsiteBySiteId(siteId);
			if (CmsUtil.isBlank(action)) {
				action = AppConfig.http_protocol + "://" + site.getDomain() + "/";
				if (AppConfig.is_static) {
					action += "html/" + site.getSiteId() + "/";
				}
				action += CategoryService.service.getCategoryByCatId(channelId).getShortname() + "-l-{pageNumber}"
						+ AppConfig.dynamic_suffix;
			} else {
				action += "&p={pageNumber}";
			}
			PaginateVo page = paging(contentPage.getPageNumber(), contentPage.getTotalPage(),
					contentPage.getPageNumber(), action);
			log.info(page.getCurrent());
			this.binds(page);
			this.doBodyRender();
		} else if (this.getAttributeValue("page") instanceof BaseSearchResultEntity) {

			SearchResultEntity searchPage = (SearchResultEntity) this.getAttributeValue("page");
			action += "&p={pageNumber}";
			System.out.println("action"+action);
			PaginateVo page = paging(searchPage.getPageNumber(), searchPage.getTotalPage(), searchPage.getPageNumber(),
					action);
			log.info(page.getCurrent());
			this.binds(page);
			this.doBodyRender();

		}

	}

	/***
	 * 分页包装方法
	 * 
	 * @param page
	 * @param url
	 * @param channel
	 * @return 分页对象
	 */
	public PaginateVo paging(int currentPage, int totalPage, int pageNumber, String url) {

		PaginateVo paging = new PaginateVo();

		String lastPage = "<a href=\"" + url + "\">上一页</a>";
		String changeStr = "<a href=\"" + url + "\">{pageNumber}</a>";
		String nextPage = "<a href=\"" + url + "\">下一页</a>";
		List<PageActionVo> changeLink = new ArrayList<PageActionVo>();

		paging.setCurrent(currentPage);
		paging.setTotal(totalPage);

		if (totalPage <= 0 || pageNumber > totalPage) {
			return null;
		}

		int startPage = currentPage - 4;
		int endPage = currentPage + 4;

		if (startPage < 1) {
			startPage = 1;
		}

		if (endPage > totalPage) {
			endPage = totalPage;
		}

		if (currentPage <= 8) {
			startPage = 1;
		}

		if (totalPage - currentPage < 8) {
			endPage = totalPage;
		}

		if (currentPage == 1) {
			lastPage = "上一页";
		} else {
			lastPage = lastPage.replace("{pageNumber}", (currentPage - 1) + "");
		}

		paging.setLast(lastPage);

		if (currentPage > 8) {

			// 第一页
			PageActionVo p1 = new PageActionVo();
			p1.setPageNumber(1);
			p1.setUrl(changeStr.replace("{pageNumber}", "1"));
			p1.setLink(true);
			changeLink.add(p1);
			// 第二页
			PageActionVo p2 = new PageActionVo();
			p1.setPageNumber(2);
			p1.setUrl(changeStr.replace("{pageNumber}", "2"));
			p1.setLink(true);
			changeLink.add(p2);
			// 更多字符串.....
			PageActionVo more = new PageActionVo();
			more.setLink(false);
			more.setValue("...");
			changeLink.add(more);
		}

		int index = startPage;

		while (index <= endPage) {
			PageActionVo pageCurrent = new PageActionVo();
			if (currentPage == index) {
				pageCurrent.setLink(false);
				pageCurrent.setValue(index + "");
				changeLink.add(pageCurrent);
			} else {
				pageCurrent.setLink(true);
				pageCurrent.setPageNumber(index);
				pageCurrent.setUrl(changeStr.replace("{pageNumber}", index + ""));
				changeLink.add(pageCurrent);
			}
			index = index + 1;
		}

		if ((totalPage - currentPage) >= 8) {

			// 更多字符串.....
			PageActionVo more1 = new PageActionVo();
			more1.setLink(false);
			more1.setValue("...");
			changeLink.add(more1);
			// 第一页
			PageActionVo p11 = new PageActionVo();
			p11.setPageNumber(totalPage - 1);
			p11.setUrl(changeStr.replace("{pageNumber}", (totalPage - 1) + ""));
			p11.setLink(true);
			changeLink.add(p11);
			// 第二页
			PageActionVo p22 = new PageActionVo();
			p22.setPageNumber(totalPage);
			p22.setUrl(changeStr.replace("{pageNumber}", totalPage + ""));
			p22.setLink(true);
			changeLink.add(p22);

		}

		paging.setChangePage(changeLink);

		if (currentPage == totalPage) {
			nextPage = "下一页";
		} else {
			nextPage = nextPage.replace("{pageNumber}", (currentPage + 1) + "");

		}
		paging.setNext(nextPage);
		return paging;

	}

}
