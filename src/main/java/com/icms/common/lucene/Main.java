package com.icms.common.lucene;

import org.apache.lucene.document.Document;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexableField;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.search.Filter;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.highlight.InvalidTokenOffsetsException;
import org.apache.lucene.store.Directory;

import com.icms.common.lucene.common.FilterMaker;
import com.icms.common.lucene.common.LuceneUtil;
import com.icms.common.lucene.common.QueryUtil;
import com.icms.common.lucene.common.SearchResultEntity;

import java.io.IOException;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Main {
    public static void main(String[] args)
            throws IOException, ParseException, SQLException, InvalidTokenOffsetsException {
        String json = "{\"name\": \"李成铭\",\"title\": \"开发工程师\",\"education\": [\"电科技大学\",\"列五高中\"],     \"career\": [         \"数联寻英\",         \"数之联\"     ],     \"sex\": \"男\",     \"location\": \"成都\",     \"tags\": {         \"计算机\": \"200\",         \"科学\": \"10\",       "
                + "  \"技术\": \"120\"     } }";
        // String json1 = "{\"name\": \"李成铭\",\"title\":
        // \"开发工程师\",\"education\": [\"电科技大学\",\"列五高中\"], \"career\": [
        // \"数联寻英\", \"数之联\" ], \"sex\": \"女\", \"location\": \"成都\", \"tags\":
        // { \"计算机\": \"200\", \"科学\": \"10\", " +
        // " \"技术\": \"120\" } }";
        //
        // UserIndexEntity entity = JsonConvert.jsonToEntity(json,
        // UserIndexEntity.class);
        // UserIndexEntity entity1 = JsonConvert.jsonToEntity(json1,
        // UserIndexEntity.class);
        //
        // String s = "java 开发工程师^7 123^2 \"456\"^3 \"abc\"^4";
        // s = CommonUtils.ikAnalysis(s);
        // System.out.println(s);
        //

        // Index.indexUserEntity(entity);
        // Index.indexUserEntity(entity1);

        printAllIndexDocs("E:\\webapp\\icms\\icms\\WEB-INF\\lucene");

        // TermQuery tq = new TermQuery(new Term("field", "value"));
        // BooleanQuery bq = new BooleanQuery();
        // bq.add(tq, BooleanClause.Occur.MUST);

        // int i = 1;
        //
        //
        //
        Map<String, String> filterMap = new HashMap<String, String>();
        //
        //
        //
        int page = 1;
        String keywords = "主要特性";
        /**
         * 构造Searcher
         */
        IndexSearcher searcher = LuceneDao.IndexManager.getSearcher();
        /**
         * 构造查询
         */
        Query query = QueryUtil.ContentQuery(keywords, "title", "content");
        /**
         * 构造筛选条件
         */
        Filter filter = null;
        if (!filterMap.isEmpty()) {
            filter = FilterMaker.makeFilter(filterMap);
        }
        SearchResultEntity result = LuceneDao.search(searcher, query, page, LuceneDao.PAGE_SIZE, filter, null, query,
                SearchResultEntity.class);

        for (Map<String, String> s : result.getDocs()) {
            System.out.println(s.toString());
        }

    }

    public static void printAllIndexDocs(String indexPath) throws IOException {
        try {
            Directory dir = LuceneUtil.getDirectory(indexPath);
            IndexReader reader = DirectoryReader.open(dir);
            IndexSearcher searcher = new IndexSearcher(reader);
            System.out.println(reader.maxDoc());
            for (int i = 0; i < reader.maxDoc(); i++) {
                Document doc = searcher.doc(i);
                for (IndexableField field : doc.getFields()) {
                    System.out.print(field.name() + ":" + field.stringValue() + "   ");
                }
                System.out.println();
            }
        } catch (CorruptIndexException e) {
            e.printStackTrace();
        }
    }

    public static void printIndexDocsCount(String indexPath) throws IOException {
        try {
            Directory dir = LuceneUtil.getDirectory(indexPath);
            IndexReader reader = DirectoryReader.open(dir);
            IndexSearcher searcher = new IndexSearcher(reader);
            System.out.println(reader.maxDoc());
        } catch (CorruptIndexException e) {
            e.printStackTrace();
        }
    }

}
