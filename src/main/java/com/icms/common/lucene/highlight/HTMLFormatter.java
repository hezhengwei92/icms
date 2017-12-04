package com.icms.common.lucene.highlight;

import org.apache.lucene.search.highlight.SimpleHTMLFormatter;

/**
 * Created by AbnerLee on 15-2-3.
 */
public class HTMLFormatter {
    private final static String[] boldRed = {"<font color=\"red\"><b>", "</b></font>"};
    private final static String[] boldBlue = {"<font color=\"blue\"><b>", "</b></font>"};
    private final static String[] boldOrange = {"<font color=\"#f9b34e\"><b>", "</b></font>"};

    public final static SimpleHTMLFormatter boldRedFormatter = new SimpleHTMLFormatter(boldRed[0], boldRed[1]);
    public final static SimpleHTMLFormatter boldBlueFormatter = new SimpleHTMLFormatter(boldBlue[0], boldBlue[1]);
    public final static SimpleHTMLFormatter boldOrangeFormatter = new SimpleHTMLFormatter(boldOrange[0], boldOrange[1]);


}
