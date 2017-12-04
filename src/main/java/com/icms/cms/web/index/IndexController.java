package com.icms.cms.web.index;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.jfinal.aop.Before;
import com.jfinal.kit.LogKit;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.ehcache.CacheName;
import com.icms.cms.base.MController;
import com.icms.cms.model.Category;
import com.icms.cms.model.Content;
import com.icms.cms.model.Model;
import com.icms.cms.model.ModelFiled;
import com.icms.cms.model.Tag;
import com.icms.cms.model.Topic;
import com.icms.cms.model.Website;
import com.icms.cms.service.CategoryService;
import com.icms.cms.service.ContentService;
import com.icms.cms.service.LuceneService;
import com.icms.cms.service.ModelFiledService;
import com.icms.cms.service.ModelService;
import com.icms.cms.service.SiteService;
import com.icms.cms.service.StaticHtmlService;
import com.icms.cms.service.TagService;
import com.icms.cms.service.TopicService;
import com.icms.common.ext.CacheInterceptor;
import com.icms.common.lucene.common.SearchResultEntity;
import com.icms.common.oauth.OauthQQ;
import com.icms.common.util.CmsUtil;
import com.icms.config.AppConfig;
import com.icms.config.AppConst;

/**
 * 首页控制器
 */
public class IndexController extends MController {

	/**
	 * 首页分发
	 *
	 * 首页样式:http://localhost 频道页样式:http://localhost/news
	 * 列表页样式:http://localhost/news-l-pageId 内容页样式:http://localhost/news-c-Id
	 *
	 */
	@Before(CacheInterceptor.class)
	@CacheName(AppConst.INDEX_CACHE)
	public void index() {
		String domain = getDomain();
		String channel = getPara(0);
		String action = getPara(1);
		Category category = null;
		Website site = SiteService.service.getWebsiteByDomain(domain);
		// 站点不存在
		if (site != null) {
			// 如果当前站点存在,则设置title keyword...等属性
			setAttr("siteId", site.getSiteId());
			setAttr("title", site.getSitename());
			setAttr("keyword", site.getKeyword());
			setAttr("description", site.getDescription());
			// 判断是否生成静态
			File file = new File(STATIC_HTML_PATH + site.getSiteId() + "/index.html");
			LogKit.debug("##########是否生成静态:" + file.exists() + "#################");
			if (file.exists() && AppConfig.is_static) {
				redirect("/html/" + site.getSiteId() + "/index.html");
				return;
			}

			// 判断访问类型
			if (CmsUtil.isBlank(channel)) {
				LogKit.info("请求类型：首页访问");
				home(site);
				return;
			} else {
				category = CategoryService.service.getCategoryBySiteIdAndCategoryName(site.getSiteId(), channel);
				setAttr("channelId", category.getCategoryId());
				if (category != null) {
					setAttr("channelName", category.getCategoryName());
					if (CmsUtil.isBlank(action)) {
						LogKit.info("请求类型：频道访问");
						channel(site, category);
						return;
					} else if (CmsUtil.StrEquals(action, LIST_ACTION)) {
						LogKit.info("请求类型：列表访问");
						list(site, category);
						return;
					} else if (CmsUtil.StrEquals(action, CONTENT_ACTION)) {
						LogKit.info("请求类型：内容访问");
						content(site, category);
						return;
					} else {
						renderError(404);
					}
				}
			}

		}
		renderError(404);
	}

	/**
	 * 首页
	 *
	 * @param site
	 */
	private void home(final Website site) {
		setAttr("channelId", 0l);
		// 判断是否为手机端访问
		if (isMobile() && site.getIsMobile()) {
			renderPath(site.getMobileTpl(), INDEX_TPL);
		} else {
			renderPath(site.getTemplate(), INDEX_TPL);
		}
	}

	/**
	 * 频道页面
	 *
	 * @param site
	 * @param category
	 */

	private void channel(final Website site, final Category category) {

		if (!CmsUtil.isBlank(category.getUrl())) {
			redirect(category.getUrl());
		}
		// 判断是否为单页面
		if (category.getAlone()) {
			setAttr("content", category.getContent());
		}

		int pageNumber = getParaToInt(2, 1);
		Page<Content> page = ContentService.service.getContentPageByCatId(pageNumber, category.getCategoryId());
		setAttr("page", page);

		if (isMobile() && site.getIsMobile()) {
			renderPath(site.getMobileTpl(), category.getIndexTpl());
		} else {
			renderPath(site.getTemplate(), category.getIndexTpl());
		}

	}

	/**
	 * 列表页面
	 *
	 * @param site
	 * @param category
	 * @param channel
	 */

	private void list(final Website site, final Category category) {
		int pageNumber = getParaToInt(2, 1);
		Page<Content> page = ContentService.service.getContentPageByCatId(pageNumber, category.getCategoryId());
		setAttr("page", page);
		if (isMobile() && site.getIsMobile()) {
			renderPath(site.getMobileTpl(), category.getListTpl());
		} else {
			renderPath(site.getTemplate(), category.getListTpl());
		}
	}

	/**
	 * 内容页面
	 *
	 * @param site
	 * @param category
	 */
	private void content(final Website site, final Category category) {
		Long contentId = getParaToLong(2);
		Model model = ModelService.service.getModelByModelId(category.getModelId());
		Record content = ContentService.service.getContentByContentIdAndTableName(contentId, model.getTableName());
		// 当前内容不存在直接返回404
		isNullRender(content);
		if (!CmsUtil.isBlank(content.getStr("url"))) {
			redirect(content.getStr("url"));
			return;
		}
		// 当前内容存在
		setAttr("channelId", category.getCategoryId());
		setAttr("site", site.getSitename());
		setAttr("title", content.getStr("title"));
		setAttr("keyword", content.getStr("keywords"));
		setAttr("description", content.getStr("description"));
		setAttr("content", content.getStr("content"));
		setAttr("date", content.getDate("inputdate"));
		setAttr("c", content);
		if (isMobile() && site.getIsMobile()) {
			renderPath(site.getMobileTpl(), category.getContentTpl());
		} else {
			renderPath(site.getTemplate(), category.getContentTpl());
		}
	}

	/**
	 * 搜索 m 和 c 为空表示关键字查询 m 和 c 不为空表示模型字段查询
	 */
	public void search() {
		String domain = getDomain();
		int modelId = getParaToInt("m", 0);
		int pageNumber = getParaToInt("p", 1);
		long catId = getParaToLong("c", 0l);
		String keyWord = getPara("keyword");
		Map<String, Object> param = new HashMap<String, Object>();
		String action = AppConfig.http_protocol + "://" + domain;
		Website site = SiteService.service.getWebsiteByDomain(domain);
		// 判断是否为模型字段查询
		if (modelId > 0 && catId > 0) {
			action += "/search?m=" + modelId + "&c=" + catId;
			Category category = CategoryService.service.getCategoryBySiteIdAndCategoryId(site.getSiteId(), catId);
			Model model = ModelService.service.getModelByModelId(modelId);
			List<ModelFiled> modelFileds = ModelFiledService.service.getModelFiledByModelId(modelId);
			// 循环检索获取filedName和fildValue
			for (ModelFiled filed : modelFileds) {
				String filedValue = getPara(filed.getFiledName());
				if (!CmsUtil.isBlank(filedValue)) {
					param.put(filed.getFiledName(), filedValue);
					action += "&" + filed.getFiledName() + "=" + filedValue;
				}
			}
			// 查询输出
			Page<Record> page = ContentService.service.getContentByModelIdAndFiledNames(pageNumber,
					model.getTableName(), modelId, param);
			setAttr("page", page);
			setAttr("siteId", site.getSiteId());
			setAttr("param", param);
			setAttr("action", action);
			if (isMobile()) {
				renderPath(site.getMobileTpl(),
						CmsUtil.isBlank(category.getListTpl()) ? (LIST_TPL) : category.getListTpl());
			} else {
				renderPath(site.getTemplate(), category.getListTpl());
			}
		} else {
			if (CmsUtil.isBlank(keyWord)) {
				renderText("请输入要查询的关键字");
				return;
			}
			action += "/search?keyword=" + keyWord;
			SearchResultEntity page = LuceneService.service.saerch(keyWord, pageNumber);
			setAttr("keyword", keyWord);
			setAttr("page", page);
			setAttr("action", action);
			renderPath(site.getTemplate(), "search.html");
		}
	}

	/**
	 * tag
	 */
	public void tag() {
		Integer tagId = getParaToInt(0);
		Integer pageNumber = getParaToInt(1, 1);
		Website site = SiteService.service.getWebsiteByDomain(getDomain());
		setAttr("siteName", site.getSitename());
		setAttr("keyword", site.getKeyword());
		setAttr("description", site.getDescription());
		if (tagId != null) {
			Page<Tag> page = TagService.service.getTagPageByTagId(tagId, pageNumber);
			setAttr("page", page);
			setAttr("title", "Tag列表");
			renderPath(site.getTemplate(), "tag_list.html");
		} else {
			setAttr("title", "Tag");
			setAttr("tagCount", TagService.service.getTagCount());
			renderPath(site.getTemplate(), "tag.html");
		}

	}

	/**
	 * 专题
	 */
	public void topic() {
		int topicId = getParaToInt(0);
		Website site = SiteService.service.getWebsiteByDomain(getDomain());
		Topic topic = TopicService.service.getTopicByTopicId(topicId);
		setAttr("topic", topic);
		renderPath(site.getTemplate(), topic.getTplContent());

	}

	/**
	 * 第三方登陆
	 */
	public void oauth() {
		String q = OauthQQ.me().getAuthorizeUrl("123");
		System.out.println(q);
		redirect(q);
		// renderText(q);
	}

	/**
	 * 第三方登陆回调
	 */
	public void callback() {
		String code = getPara("code");
		renderText(OauthQQ.me().getUserInfoByCode(code).toJSONString());
	}

	public void h() {
		Website site = SiteService.service.getWebsiteByDomain(getDomain());
		StaticHtmlService.service.IndexStatic(getDomain(), site.getSiteId(), site.getTemplate(), INDEX_TPL);
		renderText("生成静态成功");
	}

	public void ss() {
		HttpServletResponse resp = getResponse();
		try {
			resp.getWriter().print("<Script Language=\"JavaScript\">alert('123');</Script>");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}