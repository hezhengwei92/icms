package com.icms.cms.base;

import com.icms.cms.model.Content;
import com.icms.common.lucene.common.SearchResultEntity;

public interface ContentListener {

    public void save(Content content);


    public void deleteAll();


    public void delete(Long contentId);

    public SearchResultEntity saerch(String keywords, int pageNumber);
}
