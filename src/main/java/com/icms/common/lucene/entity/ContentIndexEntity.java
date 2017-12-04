package com.icms.common.lucene.entity;

import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.FieldType;

public class ContentIndexEntity extends IndexEntity {

	private String contentId;
	private String title;
	private String content;
	private String url;

	public String getContentId() {
		return contentId;
	}

	public void setContentId(String contentId) {
		this.contentId = contentId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public Document toDoc() {
		/**
		 * 索引设置
		 */
		FieldType fieldType = new FieldType();
		fieldType.setIndexed(true);
		fieldType.setStored(true);
		fieldType.setTokenized(true);
		Document doc = new Document();
		doc.add(new Field("title", getTitle(), fieldType));
		doc.add(new Field("content", getContent(), fieldType));
		doc.add(new Field("url", getUrl(), fieldType));

		return doc;
	}

	@Override
	public String getId() {
		return getContentId();
	}
}
