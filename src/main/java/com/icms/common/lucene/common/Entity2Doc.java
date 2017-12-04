package com.icms.common.lucene.common;


import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StoredField;
import org.apache.lucene.document.TextField;

import com.icms.common.lucene.entity.IndexEntity;

import java.lang.reflect.Method;


/**
 * 
 * 实体转化成Document的工具类
 */
public class Entity2Doc {

    /**
     * 将entity转化成document，只适用于简单的doc和pojo映射
     * 要求属性有get方法，设置权值可以设置boost+属性名（开头字母大写）方法
     * 对于具有复杂的entity映射doc，请自己实现
     */
    public static <T extends IndexEntity> Document pojo2doc(T pojo) {
        Document document = new Document();
        java.lang.reflect.Field[] fields = pojo.getClass().getDeclaredFields();
        for (java.lang.reflect.Field field : fields) {
            String getMethodName = field.getName().substring(0, 1).toUpperCase() + field.getName().substring(1);
            try {
                Method getMethod = pojo.getClass().getMethod("get" + getMethodName);
                float boost = 1.0f;
                try {
                    Method boostMethod = pojo.getClass().getMethod("boost" + getMethodName);
                    boost = (Float) boostMethod.invoke(pojo);
                } catch (Exception e) {
                    boost = 1.0f;  // 没有设置域权值的情况下，就默认设置成1
                }
                Field f = null;
                if (field.getName().equals("id")) {
                    f = new StoredField("id", (String) getMethod.invoke(pojo));
                } else {
                    f = new TextField(field.getName(), (String) getMethod.invoke(pojo), Field.Store.YES);
                    f.setBoost(boost);

                }
                document.add(f);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return document;
    }
}
