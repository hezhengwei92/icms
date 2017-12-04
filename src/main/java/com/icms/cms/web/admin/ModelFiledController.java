package com.icms.cms.web.admin;

import java.util.List;

import com.icms.cms.base.AController;
import com.icms.cms.model.ModelFiled;
import com.icms.cms.service.ContentService;
import com.icms.cms.service.ModelFiledService;
import com.icms.cms.service.ModelService;
import com.icms.common.util.DbTableUtil;
import com.icms.common.util.CmsUtil;

public class ModelFiledController extends AController {

	public void index() {
		int modelId = getParaToInt(0);
		List<ModelFiled> list = ModelFiledService.service.getModelFiledByModelId(modelId);
		setAttr("modelId", modelId);
		setAttr("list", list);
		renderAdmin("modelfiled-list");

	}

	public void input() {
		Integer modelId = getParaToInt(0);
		Integer modelFiledId = getParaToInt(1);
		if (modelFiledId != null) {
			ModelFiled modelFiled = ModelFiledService.service.getModelFiledByFiledId(modelFiledId);
			setAttr("modelFiled", modelFiled);
		}
		setAttr("modelId", modelId);
		renderAdmin("modelFiled-input");

	}

	public void save() {

		ModelFiled modelFiled = getModel(ModelFiled.class);
		if (ModelFiledService.service.createModelFiled(modelFiled)) {
			renderSuccess("操作成功");
		} else {
			renderError("操作失败");
		}
	}

	public void del() {
		Integer modelFiledId = getParaToInt(0);
		Integer modelId = getParaToInt(1);
		String tableName = ModelService.service.getModelByModelId(modelId).getTableName();
		String filedName = ModelFiledService.service.getModelFiledByFiledId(modelFiledId).getFiledName();
		if (ModelFiledService.service.deleteByModelFiledId(modelFiledId)) {
			DbTableUtil.me(ModelService.service.getModelByModelId(modelId).getIsContent()).delTableFiled(tableName, filedName);
			renderJson(true);
		} else {
			renderJson(true);
		}
	}

	public void validateFiledname() {
		String filedName = getPara("modelFiled.filed_name");
		if (ContentService.service.getContentCloumNameIsNull(filedName)
				&& ModelFiledService.service.getModelFiledByFiledName(filedName) == null) {
			renderJson(true);
		} else {
			renderJson(false);
		}
	}

	public void validateFiledClass() {
		Integer modelId = getParaToInt(0);
		String filedClass = getPara("modelFiled.filed_class");
		if (!CmsUtil.StrEquals(filedClass, "picture")) {
			renderJson(true);
			return;
		}else if (ModelFiledService.service.getModelFiledByFiledClass(modelId, filedClass) == null) {
			renderJson(true);
		} else {
			renderJson(false);
		}
	}
}
