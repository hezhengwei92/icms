package com.icms.common.beetl;

import java.io.IOException;
import java.io.Writer;

import org.beetl.core.exception.BeetlException;
import org.beetl.core.exception.ErrorInfo;

public class WebErrorHandler implements org.beetl.core.ErrorHandler {

    // private final String VERSION = "Powered by ICMS";


    public void processExcption(BeetlException ex, Writer writer) {
        ErrorInfo err = new ErrorInfo(ex);
        StringBuffer content = new StringBuffer();
        content.append("<!DOCTYPE html>");
        content.append("<html>");
        content.append("<head>");
        content.append("<meta charset=\"UTF-8\">");
        content.append("<title>模板加载错误</title>");
        content.append("</head>");
        content.append("<body>");
        content.append("<p style=\"font-size:22px;padding-left:10px;\"><b>模板解析错误</b></p>");
        content.append("<p style=\"font-size:18px;padding-left:10px;\">描述 : " + err.getType() + "</p>");
        content.append("<p style=\"font-size:18px;padding-left:10px;\">位置 : " + err.getResourceCallStack() + " - [ " + err.getErrorTokenLine() + " ]</p>");
        content.append("</body>");
        content.append("</html>");
        try {
            writer.write(content.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
