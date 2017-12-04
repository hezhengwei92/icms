package com.icms.common.lucene.highlight;

import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.index.IndexableField;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.highlight.Formatter;
import org.apache.lucene.search.highlight.InvalidTokenOffsetsException;
import org.apache.lucene.search.highlight.QueryScorer;
import com.icms.common.lucene.LuceneDao;
import java.io.IOException;
import java.io.StringReader;
import java.util.LinkedList;
import java.util.List;
import java.util.regex.Pattern;

/**
 * 搜索高亮器
 */
public class Highlighter {
    public static Pattern pattern = Pattern.compile(".*<[^<>]+>.*");


    /**
     * 根据查询query，将匹配的doc中相关字段高亮
     */
    public static List<Document> highlightDoc(Formatter formatter, Query query, Document... docs) throws IOException, InvalidTokenOffsetsException {
        org.apache.lucene.search.highlight.Highlighter highlighter = new org.apache.lucene.search.highlight.Highlighter(formatter, new QueryScorer(query));


        List<Document> result = null;
        if (docs != null) {
            result = new LinkedList<>();
            for (Document doc : docs) {
                if (doc == null) {
                    continue;
                }
                Document temp = new Document();
                result.add(temp);

                StringBuilder bingoTag = new StringBuilder();
                StringBuilder otherTag = new StringBuilder();

                for (IndexableField f : doc.getFields()) {
                    if (f.name().equals("id")) {
                        temp.add(new StringField(f.name(), f.stringValue(), Field.Store.NO));
                        continue;
                    }
                    TokenStream tokenStream = LuceneDao.ANALYZER_SMART.tokenStream(f.name(), new StringReader(doc.get(f.name())));
                    String str = highlighter.getBestFragment(tokenStream, doc.get(f.name()));


                    if (f.name().startsWith("field")) {
                        if (str == null) {
                            otherTag.append(f.stringValue());
                            otherTag.append("|||");
                        } else {
                            String[] tags = str.split("\\|{3,}");

                            for (String tag : tags) {
                                if (pattern.matcher(tag).matches()) {
                                    bingoTag.append(tag);
                                    bingoTag.append("|||");
                                } else {
                                    otherTag.append(tag);
                                    otherTag.append("|||");
                                }
                            }
                        }
                    } else {
                        str = str == null ? f.stringValue() : str;
                        temp.add(new StringField(f.name(), str, Field.Store.NO));
                    }

                }
                String bt = bingoTag.toString();
                String ot = otherTag.toString();

                bt = bt.equals("") ? bt : bt.substring(0, bt.length() - 3);
                ot = ot.equals("") ? ot : ot.substring(0, ot.length() - 3);

                temp.add(new StringField("bingoTag", bt, Field.Store.NO));
                temp.add(new StringField("otherTag", ot, Field.Store.NO));
            }
        }
        return result;
    }

    public static List<Document> hightlightDocWithBoldRed(Query query, Document... docs) throws IOException, InvalidTokenOffsetsException {
        return highlightDoc(HTMLFormatter.boldRedFormatter, query, docs);
    }

    public static List<Document> hightlightDocWithBoldBlue(Query query, Document... docs) throws IOException, InvalidTokenOffsetsException {
        return highlightDoc(HTMLFormatter.boldBlueFormatter, query, docs);
    }

    public static List<Document> hightlightDocWithBoldOrange(Query query, Document... docs) throws IOException, InvalidTokenOffsetsException {
        return highlightDoc(HTMLFormatter.boldOrangeFormatter, query, docs);
    }
}
