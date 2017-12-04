package com.icms.common.lucene;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.FloatField;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.search.Filter;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.Sort;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.highlight.InvalidTokenOffsetsException;
import org.wltea.analyzer.lucene.IKAnalyzer;

import com.icms.common.lucene.common.BaseSearchResultEntity;
import com.icms.common.lucene.common.QueryUtil;
import com.icms.common.lucene.common.SearchResultEntity;
import com.icms.common.lucene.entity.ContentIndexEntity;
import com.icms.common.lucene.entity.IndexEntity;
import com.icms.common.lucene.highlight.Highlighter;
import com.icms.common.lucene.manager.IndexManager;
import com.jfinal.kit.PathKit;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

public class LuceneDao {

    public static final String INDEX_PATH = PathKit.getWebRootPath() + "/WEB-INF/lucene";
    public static final Analyzer ANALYZER_SMART = new IKAnalyzer(true);
    public static final Analyzer ANALYZER_FALSE = new IKAnalyzer(false);
    public static final int PAGE_SIZE = 10;
    public static final int MAX_TAGS = 100;
    public static final IndexManager IndexManager = new IndexManager(INDEX_PATH);

    @SuppressWarnings("unchecked")
    public static <Entity extends IndexEntity> void add(IndexWriter indexWriter, Entity... entities)
            throws IOException {
        /**
         * 用写索引向索引库中写入文档
         */
        if (entities != null) {
            for (Entity entity : entities) {
                Document doc = entity.toDocument();
                System.out.println(doc.toString());
                indexWriter.updateDocument(new Term("id", entity.getId()), doc);
            }
        }
        indexWriter.commit();
    }

    @SuppressWarnings("unchecked")
    public static <Entity extends IndexEntity> void del(IndexWriter indexWriter, Entity... entities)
            throws IOException {
        if (entities != null) {
            for (Entity entity : entities) {
                indexWriter.deleteDocuments(new Term("id", entity.getId()));
            }
        }
        indexWriter.commit();
    }

    public static boolean addIndexContentEntity(ContentIndexEntity... entities) {
        boolean status = true;
        try {
            add(IndexManager.getWriter(), entities);
        } catch (IOException e) {
            e.printStackTrace();
            status = false;
        }
        return status;
    }

    public static boolean delIndexContentEntity(ContentIndexEntity... entities) {
        boolean status = true;
        try {
            del(IndexManager.getWriter(), entities);
        } catch (IOException e) {
            e.printStackTrace();
            status = false;
        }
        return status;
    }

    /**
     * 从指定的索引库searcher中搜索满足条件query并且经过过滤filter的总共total个记录，排序按照sort 返回结果TopDocs
     */
    private static TopDocs searchTopDocs(IndexSearcher searcher, Query query, Filter filter, int total, Sort sort)
            throws IOException {
        TopDocs topDocs = null;
        if (sort != null) {
            topDocs = searcher.search(query, filter, total, sort);
        } else {
            topDocs = searcher.search(query, filter, total);
        }
        return topDocs;
    }

    /**
     * 从指定索引库searcher中，取出搜索结果TopDocs中start-end之间的Document
     */
    private static List<Document> fetchDocument(IndexSearcher searcher, TopDocs topDocs, int start, int end)
            throws IOException {
        end = Math.min(topDocs.totalHits, end);
        assert start >= 0;
        assert end >= 0;
        assert start <= end;
        assert topDocs != null;

        List<Document> result = new LinkedList<>();

        for (int i = start; i < end; i++) {
            ScoreDoc scoreDoc = topDocs.scoreDocs[i];
            Document doc = searcher.doc(scoreDoc.doc);
            doc.add(new FloatField("score", scoreDoc.score, Field.Store.NO));
            result.add(doc);
        }
        return result;
    }

    /**
     * 从searcher中执行query，结果按照sort排序，同时经过filter，最终只取第page页的pageSize个结果，将结果信息封装在t中
     * 返回结果继承自ResultBasePojo，封装了必要的信息
     */
    public static <T extends BaseSearchResultEntity> T search(IndexSearcher searcher, Query query, int pageNumber,
                                                              int pageSize, Filter filter, Sort sort, Query highlightQuery, Class<T> resultType)
            throws IOException, InvalidTokenOffsetsException {
        /**
         * 取出总共的条目数，方便知道是否下一页是否还有数据
         */
        int total = pageNumber * pageSize;
        int totalPage = 0;
        System.out.println(query.toString());

        /**
         * 搜索
         */
        TopDocs topDocs = searchTopDocs(searcher, query, filter, total, null);

        totalPage = (int) (topDocs.totalHits / pageSize);

        if (topDocs.totalHits % pageSize != 0) {
            totalPage++;
        }

        System.out.println("totalPage:" + totalPage);
        /**
         * 取出命中document
         */
        List<Document> data = fetchDocument(searcher, topDocs, total - pageSize, total);

        /**
         * 高亮命中词
         */
        Document[] dataArray = new Document[data.size()];
        data.toArray(dataArray);
        data = Highlighter.hightlightDocWithBoldOrange(highlightQuery, dataArray);

        /**
         * 封装返回的数据
         */
        T t = null;
        try {
            t = resultType.newInstance();
            t.setDocuments(data);
            t.setDocs(data);
            t.setTotalRow(topDocs.totalHits);
            t.setPageNumber(pageNumber);
            t.setPageSize(pageSize);
            t.setTotalPage(totalPage);
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return t;

    }

    public static void main(String[] args) {
        ContentIndexEntity c = new ContentIndexEntity();
        c.setContentId("1");
        c.setTitle("ONE");
        c.setContent("内容");
        ContentIndexEntity c1 = new ContentIndexEntity();
        c1.setContentId("2");
        c1.setTitle("简洁的 Markdown 编辑器 Smark");
        c1.setContent(
                "说白了只是为了自己方便使用，并没什么新奇的东西。我使用 pandoc 来转化 markdown，但是我不想在修改文件时总是在编辑器、文字终端和浏览器间换来换去，因此我写了一个简单的编辑器，它在后台调用 pandoc 将当前编辑的 markdown 内容转化为 HTML，而后将 HTML 在 smark 中的浏览器中显示出来，就是这么回事。Smark 依赖于 pandoc、Qt 4.8 和 MathJax，在此向上述软件包开发者们致敬。请注意继承于 pandoc 的发布协议，Smark 同样遵循 GPL，如有任何疑问请联系 elerao.ao@gmail.com，我将尽快做出回复。"
                        + "主要特性：Windows / Linux 等主流系统跨平台支持；完美支持 LaTex 数学公式、脚注、尾注等，支持使用本地 MathJax 调用，不需要在线访问 MathJax CDN；"
                        + "用户可配置的 Markdown 语法高亮显示，美观整洁；"
                        + "多种格式文件导出支持，可将当前 Markdown 文件另存为 HTML、 Miscrosoft Word、OpenOffice / LibreOffice ODT Document、Latex、PDF、reStructured Text、Media Wiki markup、epub 以及 plain txt 等格式文件输出；"
                        + "可通过用户指明 CSS 文件定义显示式样；" + "简洁友好的界面布局，尽可能地凸显正在编辑的内容；系统、完备的各类快捷键，极大地提高了工作效率；");
        ContentIndexEntity c2 = new ContentIndexEntity();
        c2.setContentId("3");
        c2.setTitle("标题测试3");
        c2.setContent("内容3");
        boolean addIndexContentEntity = LuceneDao.addIndexContentEntity(c, c1, c2);
    }

}
