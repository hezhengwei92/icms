package com.icms.cms.service;

import com.icms.cms.base.BaseService;
import com.icms.cms.model.Form;
import com.icms.common.util.SQLUtil;
import com.icms.config.AppConfig;
import com.icms.config.AppConst;
import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.ehcache.CacheKit;

public class FormService extends BaseService {

    public static final FormService service = Enhancer.enhance(FormService.class);
    private final String cacheName = "form_cache";
    private final String table = "ic_form";

    public Page<Form> getFormPageAll(int pageNumber) {
        return Form.dao.paginateByCache(cacheName, "page_" + pageNumber, pageNumber, AppConfig.system_config.getInt(AppConst.PAGE_SIZE), "SELECT *",
                " from " + table);
    }

    public boolean AddOrUpdate(Form form) {
        clearCacheAll();
        if (form.getFormId() == null) {
            return form.save();
        }
        return form.update();
    }

    public boolean del(int id) {
        return Form.dao.deleteById(id);

    }

    public Page<Record> getFormListByFormTabkeName(String tableName, int pageNumber) {
        return Db.paginate(pageNumber, AppConfig.system_config.getInt(AppConst.PAGE_SIZE), SQLUtil.me().select("*").exec(), SQLUtil.me().from(tableName).exec());
    }

    @Override
    public void clearCacheAll() {
        CacheKit.removeAll(cacheName);
    }

}
