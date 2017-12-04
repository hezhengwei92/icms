package com.icms.cms.service;

import java.util.List;

import com.icms.cms.base.BaseService;
import com.icms.cms.model.ModelFiled;
import com.icms.common.util.DbTableUtil;
import com.icms.config.AppConst;
import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinal.plugin.ehcache.CacheKit;

public class ModelFiledService extends BaseService {

    public static final ModelFiledService service = Enhancer.enhance(ModelFiledService.class, Tx.class);

    private final String cacheName = AppConst.SERVICE_CACHE[AppConst.MODEL_CACHE];
    private final String table = "ic_model_filed";

    /**
     * 添加或者更新modelFiled
     *
     * @param modelFiled
     * @return
     */
    public boolean AddOrUpdateModelFiled(ModelFiled modelFiled) {
        clearCacheAll();
        if (modelFiled.getFiledId() == null) {
            return modelFiled.save();
        }
        return modelFiled.update();
    }

    /**
     * 查找modelFiled
     *
     * @param modelId
     * @return
     */
    public List<ModelFiled> getModelFiledByModelId(int modelId) {
        String sql = "select * from " + table + " where model_id = ?";
        return ModelFiled.dao.findByCache(cacheName, "modelfiled_list_modelId" + modelId, sql, modelId);
    }


    /**
     * 查找modelFiled
     *
     * @param filedId
     * @return
     */
    public ModelFiled getModelFiledByFiledId(int filedId) {
        return ModelFiled.dao.findFirstByCache(cacheName, "modelFiled_filedId" + filedId,
                "select * from " + table + " where filed_id = ?", filedId);
    }

    /**
     * @param filedName
     * @return
     */
    public ModelFiled getModelFiledByFiledName(String filedName) {
        return ModelFiled.dao.findFirstByCache(cacheName, "modelFiled_filedName_" + filedName,
                "select * from " + table + " where filed_name = ?", filedName);
    }

    public ModelFiled getModelFiledByFiledClass(int modelId, String filedName) {
        return ModelFiled.dao.findFirstByCache(cacheName, "modelFiled_Class_" + modelId + filedName,
                "select * from " + table + " where filed_class = ? and model_id = ?", filedName, modelId);
    }

    /**
     * @param modelFiledId
     * @return
     */
    public boolean deleteByModelFiledId(int modelFiledId) {
        clearCacheAll();
        if (ModelFiled.dao.deleteById(modelFiledId)) {
            return true;
        }
        return false;
    }

    /**
     * @param modelFiled
     * @return
     */
    public boolean createModelFiled(ModelFiled modelFiled) {

        String tableName = ModelService.service.getModelByModelId(modelFiled.getModelId()).getTableName();
        boolean isContent = ModelService.service.getModelByModelId(modelFiled.getModelId()).getIsContent();
        String filedName = modelFiled.getFiledName();
        String filedClass = modelFiled.getFiledClass();
        String filedType = modelFiled.getFiledType();
        boolean notNull = modelFiled.getNotNull() == null ? false : true;
        int filedLength = modelFiled.getFiledLength() == null ? 0 : modelFiled.getFiledLength();
        log.info("tableName:" + tableName);
        if (filedClass != null && filedType != null) {
            if (filedType.equals("none")) {
                if (filedClass.equals("input")) {
                    DbTableUtil.me(isContent).addTableFiled(tableName, filedName, DbTableUtil.VARCHAR_TYPE, 255, notNull, null);
                }
                if (filedClass.equals("textarea")) {
                    DbTableUtil.me(isContent).addTableFiled(tableName, filedName, DbTableUtil.TEXT_TYPE, 0, notNull, null);
                }
                if (filedClass.equals("editor")) {
                    DbTableUtil.me(isContent).addTableFiled(tableName, filedName, DbTableUtil.TEXT_TYPE, 0, notNull, null);
                }
                if (filedClass.equals("file")) {
                    DbTableUtil.me(isContent).addTableFiled(tableName, filedName, DbTableUtil.VARCHAR_TYPE, 255, notNull, null);
                }
                if (filedClass.equals("radio")) {
                    DbTableUtil.me(isContent).addTableFiled(tableName, filedName, DbTableUtil.VARCHAR_TYPE, 255, notNull, null);
                }
                if (filedClass.equals("none")) {
                    DbTableUtil.me(isContent).addTableFiled(tableName, filedName, DbTableUtil.VARCHAR_TYPE, 255, notNull, null);
                }
            } else {
                DbTableUtil.me(isContent).addTableFiled(tableName, filedName, filedType, filedLength, notNull, null);
            }
        }
        clearCacheAll();
        return AddOrUpdateModelFiled(modelFiled);
    }

    @Override
    public void clearCacheAll() {
        CacheKit.removeAll(cacheName);

    }
}
