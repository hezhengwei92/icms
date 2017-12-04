package com.icms.common.lucene.common;


import org.apache.lucene.document.Document;

import java.util.List;
import java.util.Map;

/**
 * 这个是搜索结果统一的结果封装类
 * 其他的搜索结果类，必须继承这个类
 */
public class BaseSearchResultEntity {
	
    private List<Document> documents;
    private List<Map<String, String>> docs;
    private int totalRow;
	private int pageNumber;
	private int pageSize;
    private int totalPage;
    
    public int getTotalRow() {
  		return totalRow;
  	}

  	public void setTotalRow(int totalRow) {
  		this.totalRow = totalRow;
  	}
    
    public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}



    public void setDocuments(List<Document> documents) {
        this.documents = documents;
    }

    public List<Map<String, String>> getDocs() {
        if (docs == null) {
            this.setDocs(this.documents);
        }
        return docs;
    }

    public void setDocs(List<Document> documents) {
        this.docs = Doc2Map.parse(documents);
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

}
