package com.icms.cms.web.admin;

import com.icms.cms.base.AController;
import com.icms.cms.model.Model;
import com.icms.cms.service.ModelService;
import com.icms.common.shiro.ShiroUtil;
import com.icms.common.util.DbTableUtil;
import com.icms.config.AppConst;
import com.jfinal.plugin.activerecord.Page;

public class ModelController extends AController {

	public void index() {
		Integer siteId = (Integer) ShiroUtil.getSessionAttr(AppConst.SITE_ID);
		Integer pageNumber = getParaToInt(0, 1);
		Page<Model> page = ModelService.service.getModelPageBySiteId(pageNumber, siteId);
		setAttr("page", page);
		renderAdmin("model-list");
	}

	public void input() {
		Integer modelId = getParaToInt(0);
		if (modelId != null) {
			Model model = ModelService.service.getModelByModelId(modelId);
			setAttr("model", model);
		}
		renderAdmin("model-input");
	}
//getModel用来接收页面表单域传递过来的model对象  表单名称以 modelName.attrName方式命名
	//getModel使用的attrName必须与数据表字段名完全一样
	public void save() {
		Model model = getModel(Model.class);
		boolean isContent = model.getIsContent();
		boolean status;
		if (model.getIsContent()) {
			status = DbTableUtil.me(true).initContentTable(model.getTableName());
			System.out.println("創建表單："+isContent);
			boolean s =  ModelService.service.AddOrUpdateModel(model);
			System.out.println("保存状态："+s);
			if (status&&s) {
				renderSuccess("操作成功");
			} else {
				renderError("操作失败");
			}
		} else {
			status = DbTableUtil.me(false).initFormTable(model.getTableName());
			if (status && ModelService.service.AddOrUpdateModel(model)) {
				renderSuccess("操作成功");
			} else {
				renderError("操作失败");
			}
		}
	}

	public void del() {
		Integer modelId = getParaToInt(0);
		String tableName = ModelService.service.getModelByModelId(modelId).getTableName();
		boolean isContent = ModelService.service.getModelByModelId(modelId).getIsContent();
		if (ModelService.service.deleteByModelId(modelId)) {
			DbTableUtil.me(isContent).dropDbtable(tableName);
			renderJson(true);
		} else {
			renderJson(false);
		}
	}

	public void status() {
		int modelId = getParaToInt(0);
		Model model = ModelService.service.getModelByModelId(modelId);
		if (model.getStatus()) {
			model.setStatus(false);
		} else {
			model.setStatus(true);
		}
		ModelService.service.AddOrUpdateModel(model);
		renderJson(true);
	}

	public void validateModelname() {
		String modelName = getPara("model.model_name");
		if (ModelService.service.getModelByModelName(modelName) == null) {
			renderJson("true");
		} else {
			renderJson("false");
		}
	}

	public void validateTablename() {
		String tableName = getPara("model.table_name");
		if (ModelService.service.getModelByModelName(tableName) == null) {
			renderJson("true");
		} else {
			renderJson("false");
		}
	}

}
