package com.icms.common.lucene.entity;

import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.FieldType;

public abstract class IndexEntity {
    public String id;

    /**
     * 实体转换成可索引的文档
     */
    public abstract Document toDoc();

    /**
     * 获取实体的唯一标识
     */
    public abstract String getId();

    public void setId(String id) {
        this.id = id;
    }


    /**
     * 为在toDoc的方法基础上，添加ID域
     */
    public Document toDocument() {
        Document doc = toDoc();

        FieldType fieldType = new FieldType();
        fieldType.setIndexed(true);  // 能够被索引, 用来在索引数据时好做到唯一性
        fieldType.setStored(true);  // 需要存储，得到id后需要去数据库中取具体的值
        fieldType.setTokenized(false);  // 不用分词，因为是id，不用分词

        doc.add((new Field("id", getId(), fieldType)));

        return doc;
    }
}
