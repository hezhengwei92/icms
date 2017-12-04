package com.icms.common.lucene.common;

import org.apache.lucene.document.Document;
import org.apache.lucene.index.IndexableField;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 *
 * Document转化成Map的工具类
 */
public class Doc2Map {
    /**
     * Document 转换成 Map<String, String>
     */
    public static Map<String, String> parse(Document doc) {
        Map<String, String> result = new HashMap<String, String>();
        for (IndexableField field : doc.getFields()) {
            result.put(field.name(), field.stringValue());
        }
        return result;
    }

    /**
     * Documents 转换成 List<Map<String, String>>
     */
    public static List<Map<String, String>> parse(List<Document> docs) {
        List<Map<String, String>> result = new LinkedList<Map<String, String>>();
        for (Document doc : docs) {
            result.add(parse(doc));
        }
        return result;
    }
}
