package com.icms.common.lucene.common;

import java.io.File;
import java.io.IOException;
import java.io.StringReader;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.tokenattributes.CharTermAttribute;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import com.icms.common.lucene.LuceneDao;

public class LuceneUtil {


	public static Directory getDirectory(String path) {
		Directory index = null;
		try {
			index = FSDirectory.open(new File(path));
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		return index;
	}

	/**
	 * 将字符串分词，最终每个词用空格隔开
	 */
	public static String ikAnalysis(String s) throws IOException {
		Analyzer analyzer = LuceneDao.ANALYZER_SMART;

		StringReader reader = new StringReader(s);
		/**
		 * 分词
		 */
		TokenStream ts = analyzer.tokenStream("", reader);
		ts.reset();
		CharTermAttribute term = ts.getAttribute(CharTermAttribute.class);

		StringBuilder builder = new StringBuilder();
		/**
		 * 提取分词结果
		 */
		while (ts.incrementToken()) {
			builder.append(term.toString());
			builder.append(" ");
		}
		reader.close();
		ts.close();
		return builder.toString().trim();
	}
}
