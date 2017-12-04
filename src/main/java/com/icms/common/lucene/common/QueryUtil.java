package com.icms.common.lucene.common;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.BooleanQuery;
import org.apache.lucene.search.Query;

import com.icms.common.lucene.LuceneDao;

import java.io.IOException;

/**
 * Query生成器
 */
public class QueryUtil {
    /**
     * 过滤掉非法字符
     */
    private static String queryStringFilter(String query) {
        return query.replace("/", " ").replace("\\", " ");
    }


    public static Query query(String query, Analyzer analyzer, String... fields) throws ParseException {
        BooleanQuery.setMaxClauseCount(32768);
        query = queryStringFilter(query);  // 过滤非法字符
        MultiFieldQueryParser parser = new MultiFieldQueryParser(fields, analyzer);
        parser.setDefaultOperator(QueryParser.Operator.OR);
        return parser.parse(query);
    }


    public static Query ContentQuery(String desc, String... extralField) throws IOException, ParseException {
    	return query(desc, LuceneDao.ANALYZER_SMART, extralField);
    }

 
}
