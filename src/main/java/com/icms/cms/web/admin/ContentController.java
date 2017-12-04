package com.icms.cms.web.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.icms.cms.base.AController;
import com.icms.cms.model.Category;
import com.icms.cms.model.Content;
import com.icms.cms.model.Model;
import com.icms.cms.model.ModelFiled;
import com.icms.cms.service.CategoryService;
import com.icms.cms.service.ContentService;
import com.icms.cms.service.ModelFiledService;
import com.icms.cms.service.ModelService;
import com.icms.cms.service.TagService;
import com.icms.common.shiro.ShiroUtil;
import com.icms.common.util.PinyinUtil;
import com.icms.common.util.CmsUtil;
import com.icms.config.AppConst;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.render.JsonRender;

public class ContentController extends AController {

	public void index() {
		renderAdmin("content-main");
	}

	public void list() {
		long catId = getParaToLong(0, 0L);
		int pageNumber = getParaToInt(1, 1);
		boolean isParent = false;
		Integer siteId = (Integer) ShiroUtil.getSessionAttr(AppConst.SITE_ID);
		int status = getParaToInt("status", 3);
		String mindate = getPara("mindate");
		String maxdate = getPara("maxdate");
		String keyword = getPara("keyword");
		Page<Content> contentPage = null;
		Category category = null;
		String view = "content-list";
		if (catId > 0) {
			category = CategoryService.service.getCategoryByCatId(catId);
			setAttr("catName", category.getCategoryName());
//			// 如果是单页内容，去分类修改，暂时无用
//			if (category.getAlone()) {
//				view = "category-input";
//				setAttr("category", category);
//				List<Category> categorylist = CategoryService.service.getCategoryListBySiteId(siteId);
//				List<Model> modelList = ModelService.service.getModelListBySiteId(siteId, 1, 1);
//				createToken();
//				setAttr("siteId", siteId);
//				setAttr("cats", categorylist);
//				setAttr("models", modelList);
//			} else {
				List<Category> childs = CategoryService.service.getCategoryBySiteIdAndParentId(siteId,
						category.getCategoryId());
				if (!CmsUtil.isNullOrEmpty(childs)) {
					String childId = "";
					for (Category child : childs) {
						childId += child.getCategoryId() + ",";
					}
					childId = childId.substring(0, childId.length() - 1);
					System.out.println("childId:" + childId);
					contentPage = ContentService.service.getContentPageByParentId(pageNumber, childId, mindate, maxdate,
							keyword, status);
					setAttr("contentPage", contentPage);
					isParent = true;
				} else {
					contentPage = ContentService.service.getContentPageByCatId(pageNumber, catId, mindate, maxdate,
							keyword, status);
					setAttr("contentPage", contentPage);
				}
//			}
		} else {
			contentPage = ContentService.service.getContentAllPage(pageNumber, mindate, maxdate, keyword, status);
			setAttr("contentPage", contentPage);
		}
		setAttr("mindate", mindate);
		setAttr("maxdate", maxdate);
		setAttr("keyword", keyword);
		setAttr("status", status);
		setAttr("catId", catId);
		setAttr("isParent", isParent);
		renderAdmin(view);
	}

	public void input() {
		long catId = getParaToLong(0,0L);
		long contentId = getParaToLong(1, 0L);
		Category category = CategoryService.service.getCategoryByCatId(catId);
		isNullRender(category);
		Model model = ModelService.service.getModelByModelId(category.getModelId());
		if (contentId > 0L) {
			Record record = ContentService.service.getContentByContentIdAndTableName(contentId, model.getTableName());
			setAttr("content", record);
		}
		List<ModelFiled> modelFileds = ModelFiledService.service.getModelFiledByModelId(model.getModelId());
		setAttr("tableName", model.getTableName());
		setAttr("modelFileds", modelFileds);
		setAttr("catId", catId);
		setAttr("modelId", category.getModelId());
		setAttr("catName", category.getCategoryName());
		renderAdmin("content-input");
	}

	public void save() {
		String tableName = getPara("tableName");
		String[] tags = CmsUtil.isNullOrEmpty(getPara("tag")) ? null : getPara("tag").split("#");
		Content content = getModel(Content.class, "Content");
		System.out.println(content.getModelId());
		List<ModelFiled> modelFileds = ModelFiledService.service.getModelFiledByModelId(content.getModelId());
		Map<String, Object> param = new HashMap<String, Object>();
		Map<String, Object> tagParam = new HashMap<String, Object>();
		// 循环检索获取filedName和fildValue
		for (ModelFiled filed : modelFileds) {
			String filedValue = getPara(filed.getFiledName());
			if (!CmsUtil.isBlank(filedValue)) {
				param.put(filed.getFiledName(), filedValue);
			}
		}
		if (ContentService.service.AddOrUpdateContent(param, tableName, content)) {
			// 循环检索获取Tag
			if (!CmsUtil.isNullOrEmpty(tags)) {
				for (String tag : tags) {
					tagParam.put(tag, PinyinUtil.convertLower(tag));
				}
				TagService.service.TagSave(tagParam, content.getContentId());
			}
			renderSuccess("保存成功！");
		} else {
			renderError("保存失败！");
		}
	}

	// 回收站
	public void recovery() {
		long catId = getParaToLong(0, 0L);
		int pageNumber = getParaToInt(1, 1);
		if (catId > 0) {
			Page<Content> contentPage = ContentService.service.getContentPageIsDelByCatId(pageNumber, catId);
			setAttr("contentPage", contentPage);

		} else {
			Page<Content> contentPage = ContentService.service.getContentPageIsDelAll(pageNumber);
			setAttr("contentPage", contentPage);
		}
		setAttr("catId", catId);
		renderAdmin("content-recovery");
	}

	public void del() {
		Long contentId = getParaToLong(0);
		ContentService.service.del(contentId);
		renderNull();
	}

	public void getCategoryList() {
		Integer siteId = (Integer) ShiroUtil.getSessionAttr(AppConst.SITE_ID);
		StringBuffer result = new StringBuffer();
		List<Category> list = null;
		result.append("[");
		result.append("{id:0, pId:0, name:\"栏目分类\", open:true},");
		list = CategoryService.service.getCategoryListBySiteIdAndNotAloneAndUrlIsNull(siteId);
		for (int i = 0; i < list.size(); i++) {
			Category category = list.get(i);
			String jsonStr = "id:'" + category.getCategoryId() + "',name:'" + " [" + category.getCategoryId() + "] "
					+ category.getCategoryName() + "',pId:" + category.getParentId();
			result.append("{");
			result.append(jsonStr + ", open:true");
			result.append("}");
			if (i < list.size() - 1) {
				result.append(",");
			}
		}
		result.append("]");
		render(new JsonRender(result.toString()).forIE());
	}

	// 审核
	public void status() {
		Long contentId = getParaToLong(0);
		renderJson(ContentService.service.updateContentStatus(contentId));

	}

	public void isdel() {
		Long contentId = getParaToLong("contentId");
		renderJson(ContentService.service.updateContentIsDel(contentId));
	}
}
