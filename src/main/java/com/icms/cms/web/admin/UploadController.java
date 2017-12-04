package com.icms.cms.web.admin;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.icms.cms.base.BaseController;
import com.icms.cms.model.Website;
import com.icms.cms.service.SiteService;
import com.icms.common.shiro.ShiroUtil;
import com.icms.common.util.UploadUtil;
import com.icms.config.AppConfig;
import com.icms.config.AppConst;
import com.jfinal.core.ActionKey;


public class UploadController extends BaseController {

//@ActionKey("/system/file/upload")注解 可以让原来的路径变为 /system/file/upload
	@SuppressWarnings("unchecked")
	@ActionKey("/system/file/upload")
	public void upload() {
		
		JSONObject result = new JSONObject();
		Integer siteId = (Integer) ShiroUtil.getSessionAttr(AppConst.SITE_ID);
		Website site = SiteService.service.getWebsiteBySiteId(siteId);
		String domian = AppConfig.http_protocol+"://"+site.getDomain();
		
		try {
			
			Map<String, Object> rs = UploadUtil.uploadFiles(getFiles(),domian);
			int errorCount = Integer.parseInt(String.valueOf(rs.get("errorCount"))) ;
			if (errorCount>0) {
				renderText("上传失败");

			} else {
				//暫時湊活一下
				List<String> ss = (List<String>) rs.get("filePath");
				result.put("status", 1);
				result.put("info","上传成功!");
				for (String s : ss) {
					result.put("url",s);
				}
			renderJson(result);
			}
		} catch (Exception e) {
			renderText(e.getMessage());
		}

	}
	@SuppressWarnings("unchecked")
	@ActionKey("/system/wangeditor/upload")
	public void WangEditorUpload() {
		Integer siteId = (Integer) ShiroUtil.getSessionAttr(AppConst.SITE_ID);
		Website site = SiteService.service.getWebsiteBySiteId(siteId);
		String domian = AppConfig.http_protocol+"://"+site.getDomain();
		String result = null;
		try {
			Map<String, Object> rs = UploadUtil.uploadFiles(getFiles(),domian);
			int errorCount = Integer.parseInt(String.valueOf(rs.get("errorCount"))) ;
			if (errorCount>0) {
				renderText("上传失败");

			} else {
				List<String> ss = (List<String>) rs.get("filePath");
				for (String s : ss) {
					result=s;
				}
			renderJson(result);
			}
		} catch (Exception e) {
			renderText(e.getMessage());
		}

	}
}
