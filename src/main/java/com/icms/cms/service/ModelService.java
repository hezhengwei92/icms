package com.icms.cms.service;

import java.util.List;

import com.icms.cms.base.BaseService;
import com.icms.cms.model.Model;
import com.icms.config.AppConfig;
import com.icms.config.AppConst;
import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinal.plugin.ehcache.CacheKit;

public class ModelService extends BaseService {

    public static final ModelService service = Enhancer.enhance(ModelService.class, Tx.class);
    private final String table = "ic_model";
    private final String cacheName = AppConst.SERVICE_CACHE[AppConst.MODEL_CACHE];

    /**
     * 添加或者更新model
     *
     * @param model
     * @return
     */
    public boolean AddOrUpdateModel(Model model) {
        CacheKit.removeAll(cacheName);
        if (model.getModelId() == null) {
            return model.save();
        }
        return model.update();
    }

    /**
     * id查询model
     *
     * @param modelId
     * @return
     */
    public Model getModelByModelId(int modelId) {
        return Model.dao.findFirstByCache(cacheName, "model_modelId" + modelId,
                "select * from " + table + " where model_id = ?", modelId);
    }

    /**
     * @param modelName
     * @return
     */
    public Model getModelByModelName(String modelName) {
        return Model.dao.findFirstByCache(cacheName, "model_modelName" + modelName,
                "select * from " + table + " where model_name = ?", modelName);
    }

    /**
     * @param tableName
     * @return
     */
    public Model getModelByTableName(String tableName) {
        return Model.dao.findFirstByCache(cacheName, "model_tablename" + tableName,
                "select * from " + table + " where table_name = ?", tableName);
    }

    public List<Model> getModelListBySiteId(Integer siteId) {
        return Model.dao.findByCache(cacheName, "model_siteId" + siteId,
                "select * from " + table + " where site_id = ?", siteId);
    }


    /**
     * model 分页
     *
     * @param pageNumber
     * @param siteId
     * @return
     */
    public Page<Model> getModelPageBySiteId(int pageNumber, int siteId) {
        return Model.dao.paginateByCache(cacheName, "model_page_siteId" + pageNumber + siteId, pageNumber,
                AppConfig.system_config.getInt(AppConst.PAGE_SIZE), "select *", " from " + table + " where site_id  = ?", siteId);
    }

    /**
     * 刪除Model
     *
     * @param id
     * @return
     */
    public boolean deleteByModelId(int modelId) {
        if (Model.dao.deleteById(modelId)) {
            clearCacheAll();
            return true;
        }
        return false;

    }

    /**
     * 获取表单模型列表
     *
     * @param siteId
     * @param status
     * @param isContent
     * @return
     */
    public List<Model> getModelListBySiteId(Integer siteId, Integer status, int isContent) {
        return Model.dao.findByCache(cacheName, "model_list_siteId_status_iscontent" + status + siteId + isContent,
                "select * from " + table + " where site_id = ? and status = ? and is_content = ?", siteId, status,
                isContent);
    }

    @Override
    public void clearCacheAll() {
        CacheKit.removeAll(cacheName);
    }

}
