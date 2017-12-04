package com.icms.common.lucene.entity;

import java.util.HashMap;
import java.util.Map;

import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;

/**
 * Created by AbnerLee on 15-1-21.
 */
public class Main {

	private Map<Float, String> searchField = new HashMap<>();

	public void test() {
		for (Float f : searchField.keySet()) {
			String tags = searchField.get(f);
			System.out.println(tags);
		}
	}

	public static void main(String[] args) {
         new Main().test();
	}
	// public static void main(String[] args) {
	// String json = "{\"name\": \"李成铭\",\"title\": \"开发工程师\",\"education\":
	// [\"电科技大学\",\"列五高中\"], \"career\": [ \"数联寻英\", \"数之联\" ], \"sex\": \"男\",
	// \"location\": \"成都\", \"tags\": { \"计算机\": \"200\", \"科学\": \"10\", " +
	// " \"技术\": \"120\" } }";
	//
	// UserIndexEntity entity = JsonConvert.jsonToEntity(json,
	// UserIndexEntity.class);
	//
	// Document doc = entity.toDoc();
	//
	// int i = 0;
	//
	//
	// }
}
