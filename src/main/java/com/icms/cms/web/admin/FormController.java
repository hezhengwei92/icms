package com.icms.cms.web.admin;

import java.util.List;

import com.icms.cms.base.AController;
import com.icms.cms.model.Form;
import com.icms.cms.model.Model;
import com.icms.cms.model.ModelFiled;
import com.icms.cms.service.FormService;
import com.icms.cms.service.ModelFiledService;
import com.icms.cms.service.ModelService;
import com.icms.common.shiro.ShiroUtil;
import com.icms.common.util.CmsUtil;
import com.icms.config.AppConfig;
import com.icms.config.AppConst;
import com.jfinal.core.ActionKey;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

public class FormController extends AController {

	@Override
	public void index() {
		int pageNumber = getParaToInt(0, 1);
		Page<Form> page = FormService.service.getFormPageAll(pageNumber);
		setAttr("url", AppConfig.http_protocol+"://"+getDomain());
		setAttr("page", page);
		renderAdmin("form-list");
	}

	@Override
	public void input() {
		createToken();
		Integer siteId = (Integer) ShiroUtil.getSessionAttr(AppConst.SITE_ID);
		Integer id = getParaToInt(0);
		List<Model> models = ModelService.service.getModelListBySiteId(siteId, 1, 0);
		if (id != null) {
			setAttr("form", Form.dao.findById(id));
		}

		setAttr("models", models);
		renderAdmin("form-input");
	}

	@Override
	public void save() {
		validateToken();
		Form form = getModel(Form.class, "form");
		form.setActionkey(CmsUtil.getUUID());
		if (FormService.service.AddOrUpdate(form)) {
			renderSuccess("添加成功!");
		} else {
			renderError("添加失败！");
		}
	}

	@Override
	public void del() {

		Integer[] ids = getParaValuesToInt("lid");
		for (int id : ids) {
			FormService.service.del(id);
		}
		renderJson(true);

	}
	
	public void list(){
		int modelId = getParaToInt(0);
		int pageNumber = getParaToInt(1,1);
		Model model = ModelService.service.getModelByModelId(modelId);
		List<ModelFiled> mf = ModelFiledService.service.getModelFiledByModelId(modelId);
		String formTableName = model.getTableName();
		Page<Record> page = FormService.service.getFormListByFormTabkeName("ic_form_"+formTableName, pageNumber);
		setAttr("page", page);
		setAttr("mfs", mf);
		setAttr("modelId", modelId);
		renderAdmin("form-table-list");
		
	}
	
	public void delform(){
		int modelId = getParaToInt(0);
		int id =  getParaToInt(1);
		Model model = ModelService.service.getModelByModelId(modelId);
		String tableName = model.getTableName();
		Db.deleteById(tableName, id);

		renderJson(true);
		
	}

	@ActionKey("/form")
	public void add(){
		
	}
	
}
