package com.icms.cms.web.admin;

import java.util.List;

import com.icms.cms.base.AController;
import com.icms.cms.model.Category;
import com.icms.cms.model.Model;
import com.icms.cms.service.CategoryService;
import com.icms.cms.service.ModelService;
import com.icms.common.shiro.ShiroUtil;
import com.icms.config.AppConfig;
import com.icms.config.AppConst;
import com.jfinal.render.JsonRender;

/**
 * 秋来相顾尚飘蓬，未就丹砂愧葛洪 痛饮狂歌空度日，飞扬跋扈为谁雄
 */
public class CategoryController extends AController {

	public void index() {
		renderAdmin("category-list");
	}

	public void input() {
		Long catId = getParaToLong(0);
		Integer siteId = (Integer) ShiroUtil.getSessionAttr(AppConst.SITE_ID);
		if (catId != null) {
			Category category = CategoryService.service.getCategoryByCatId(catId);
			setAttr("category", category);
		}
		List<Category> categorylist = CategoryService.service.getCategoryListBySiteId(siteId);
		List<Model> modelList = ModelService.service.getModelListBySiteId(siteId, 1,1);
		createToken();
		setAttr("siteId", siteId);
		setAttr("cats", categorylist);
		setAttr("models", modelList);
		renderAdmin("category-input");
	}

	public void save() {
		Category category = getModel(Category.class);
		if (validateToken() && CategoryService.service.AddOrUpdateModel(category)) {
			renderRefreshIframe("success", "操作成功", "/"+AppConfig.system_config.getString("admin_path")+"/category");
		} else {
			renderRefreshIframe("error", "操作失败", "/"+AppConfig.system_config.getString("admin_path")+"/category");
		}
	}

	public void del() {
		Long catId = getParaToLong(0);
		if (CategoryService.service.DeleteCategoryByCategoryId(catId)) {
			renderRefreshIframe("success", "操作成功", "/"+AppConfig.system_config.getString("admin_path")+"/category");
		} else {
			renderRefreshIframe("error", "操作失败,请删除当前栏目下文章！", "/"+AppConfig.system_config.getString("admin_path")+"/category");
		}

	}

	public void getCategoryList() {
		Integer siteId = (Integer) ShiroUtil.getSessionAttr(AppConst.SITE_ID);
		StringBuffer result = new StringBuffer();
		List<Category> list = null;
		result.append("[");
		result.append("{id:0, pId:0, name:\"栏目分类\", open:true},");
		list = CategoryService.service.getCategoryAllBySiteId(siteId);
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
		System.out.println(result.toString());
		render(new JsonRender(result.toString()).forIE());
	}

	public void valiname() {
		String name = getPara("category.category_name");
		if (CategoryService.service.getCategoryByCatName(name) == null) {
			renderJson(true);
		} else {
			renderJson(false);
		}
	}

	public void valishortname() {
		String name = getPara("category.shortname");
		if (CategoryService.service.getCategoryByshortname(name) == null) {
			renderJson(true);
		} else {
			renderJson(false);
		}
	}
}
