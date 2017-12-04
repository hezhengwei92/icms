package com.icms.cms.web.admin;

import java.util.List;

import com.icms.cms.base.AController;
import com.icms.cms.model.Category;
import com.icms.cms.model.Topic;
import com.icms.cms.service.CategoryService;
import com.icms.cms.service.TopicService;
import com.icms.common.shiro.ShiroUtil;
import com.icms.common.util.CmsUtil;
import com.icms.config.AppConst;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.render.JsonRender;

public class TopicController extends AController {

	@Override
	public void index() {
       int pageNumber = getParaToInt(0,1);
       Page<Topic> pages = TopicService.service.getPageAll(pageNumber);
       setAttr("pages", pages);
       renderAdmin("topic-list");
	}

	@Override
	public void input() {
		Integer topicId = getParaToInt(0);
		if(topicId!=null){
			Topic t = TopicService.service.getTopicByTopicId(topicId);
			setAttr("topic", t);
		}
		renderAdmin("topic-input");
		
	}

	@Override
	public void save() {
		Topic topic = getModel(Topic.class, "Topic");
		if(TopicService.service.AddOrUpdate(topic)){
			renderSuccess("保存成功！");
		} else {
			renderError("保存失败！");
		}
		
	}

	@Override
	public void del() {
		Integer topicId = getParaToInt(0);
		if(TopicService.service.delByTopicId(topicId)){
			renderJson(true);
		} else {
			renderJson(false);
		}
		
	}
	
	//获取分类列表
	public void getCategoryList() {
		Integer siteId = (Integer) ShiroUtil.getSessionAttr(AppConst.SITE_ID);
		StringBuffer result = new StringBuffer();
		List<Category> list = null;
		result.append("[");
		result.append("{id:0, pId:0, name:\"栏目分类\", open:true,nocheck:true},");
		list = CategoryService.service.getCategoryListBySiteId(siteId);
		for (int i = 0; i < list.size(); i++) {
			Category category = list.get(i);
			String jsonStr = "id:'" + category.getCategoryId() + "',name:'"+category.getCategoryName() + "',pId:"
					+ category.getParentId();
			result.append("{");
			if(!CmsUtil.isNullOrEmpty(CategoryService.service.getCategoryBySiteIdAndParentId(siteId, category.getCategoryId()))){
				jsonStr+=",nocheck:true";
			}
			result.append(jsonStr+=",open:true");
			result.append("}");
			if (i < list.size() - 1) {
				result.append(",");
			}
		}
		result.append("]");
		render(new JsonRender(result.toString()).forIE());
	}

}
