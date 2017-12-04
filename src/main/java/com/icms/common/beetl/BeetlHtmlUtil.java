package com.icms.common.beetl;

import java.io.File;
import java.io.StringWriter;
import java.util.Map;

import org.beetl.core.Template;

import com.icms.common.thread.HtmlThread;
import com.icms.common.vo.HtmlObject;
import com.icms.config.AppConfig;
import com.jfinal.kit.LogKit;
import com.jfinal.kit.PathKit;

public class BeetlHtmlUtil {

    private Template template;
    private StringWriter writer;
    private String domain;
    private int siteId;
    private final String STATIC_SUFFIX = ".html";

    public BeetlHtmlUtil(String domain, int siteId) {
        this.siteId = siteId;
        this.domain = domain;
    }

    public void create(String action, Map<String, Object> attr, String theme, String tpl) {
        String view = "front" + File.separator + theme + File.separator + tpl;
        LogKit.info("beetl view :" + view);
        template = BeetlRenderFactory.gt.getTemplate(view);
        writer = new StringWriter();
        LogKit.info("beetl 绑定参数");
        template.binding("res", AppConfig.http_protocol + "://" + domain + "/r");
        template.binding("basePath", AppConfig.http_protocol + "://" + domain);
        template.binding(attr);
        template.renderTo(writer);
        HtmlObject obj = new HtmlObject();
        obj.setContent(format(writer.toString()));
        obj.setFileUrl(PathKit.getWebRootPath() + File.separator + "html" + File.separator + siteId + File.separator + action + ".html");
        LogKit.info("beetl 放入线程生成静态文件");
        HtmlThread.addHtml(obj);
    }

    private String format(String page) {
        return page.replace(AppConfig.dynamic_suffix, STATIC_SUFFIX);
    }

}
