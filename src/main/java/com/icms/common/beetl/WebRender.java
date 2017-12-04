package com.icms.common.beetl;

import java.io.IOException;
import java.io.OutputStream;
import java.io.Writer;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.beetl.core.GroupTemplate;
import org.beetl.core.Template;
import org.beetl.core.exception.BeetlException;
import org.beetl.ext.web.ParameterWrapper;
import org.beetl.ext.web.SessionWrapper;
import org.beetl.ext.web.WebRenderExt;
import org.beetl.ext.web.WebVariable;

import com.icms.common.util.ServletUtil;
import com.icms.common.vo.BTGSessionVo;
import com.icms.config.AppConfig;

public class WebRender {

    GroupTemplate gt = null;

    public WebRender(GroupTemplate gt) {
        this.gt = gt;
    }

    /**
     * @param key      模板资源id
     * @param request
     * @param response
     * @param args     其他参数，将会传给modifyTemplate方法
     */
    public void render(String key, HttpServletRequest request, HttpServletResponse response, Object... args) {
        Writer writer = null;
        OutputStream os = null;
        String ajaxId = null;
        Template template = null;
        boolean isError = false;
        try

        {
            // response.setContentType(contentType);
            int ajaxIdIndex = key.lastIndexOf("#");
            if (ajaxIdIndex != -1) {
                ajaxId = key.substring(ajaxIdIndex + 1);
                key = key.substring(0, ajaxIdIndex);
                template = gt.getAjaxTemplate(key, ajaxId);

            } else {
                template = gt.getTemplate(key);
            }

            Enumeration<String> attrs = request.getAttributeNames();

            while (attrs.hasMoreElements()) {
                String attrName = attrs.nextElement();
                //全局变量通过template.binding传入变量  这些变量能在模板的任何地方访问
                /**
                 template.binding("list",service.getUserList());
                 //在模板里
                 <%
                 for(user in list){
                 %>
                 hello,${user.name};
                 <% } %>
                 */
                template.binding(attrName, request.getAttribute(attrName));

            }
            WebVariable webVariable = new WebVariable();
            webVariable.setRequest(request);
            webVariable.setResponse(response);
            template.binding("session", new SessionWrapper(request, request.getSession(false)));
            if (AppConfig.is_install) {
                template.binding("BTGSession", new BTGSessionVo(request));
            }
            template.binding("servlet", webVariable);
            template.binding("request", request);
            template.binding("res", AppConfig.http_protocol + "://" + ServletUtil.getDomain(request) + "/r");
            template.binding("basePath", AppConfig.http_protocol + "://" + ServletUtil.getDomain(request));
            template.binding("managePath", AppConfig.http_protocol + "://" + ServletUtil.getDomain(request) + "/" + AppConfig.manage_path);
            template.binding("ctxPath", request.getContextPath());
            template.binding("$page", new HashMap<Object, Object>());
            template.binding("parameter", new ParameterWrapper(request));
            modifyTemplate(template, key, request, response, args);

            String strWebAppExt = gt.getConf().getWebAppExt();
            if (strWebAppExt != null) {
                WebRenderExt renderExt = this.getWebRenderExt(strWebAppExt);
                renderExt.modify(template, gt, request, response);
            }

            if (gt.getConf().isDirectByteOutput()) {
                os = response.getOutputStream();
                template.renderTo(os);
            } else {
                writer = response.getWriter();
                template.renderTo(writer);
            }

        } catch (IOException e) {
            isError = true;
            handleClientError(e);
        } catch (BeetlException e) {
            isError = true;
            // response.setStatus(500);
            //
            handleBeetlException(e);
        } finally {
            try {

                if (!isError && writer != null)
                    writer.flush();
                if (!isError && os != null) {
                    os.flush();
                }
            } catch (IOException e) {
                handleClientError(e);
            }
        }
    }

    /**
     * 可以添加更多的绑定
     *
     * @param template 模板
     * @param key      模板的资源id
     * @param request
     * @param response
     * @param args     调用render的时候传的参数
     */
    protected void modifyTemplate(Template template, String key, HttpServletRequest request,
                                  HttpServletResponse response, Object... args) {

    }

    /**
     * 处理客户端抛出的IO异常
     *
     * @param ex
     */
    protected void handleClientError(IOException ex) {
        // do nothing
    }

    /**
     * 处理客户端抛出的IO异常
     *
     * @param ex
     */
    protected void handleBeetlException(BeetlException ex) {
        throw ex;
    }

    protected WebRenderExt getWebRenderExt(String clsName) {
        // 有效率问题，没有必要每次都初始化一个类
        try {
            WebRenderExt render = (WebRenderExt) Class.forName(clsName).newInstance();
            return render;
        } catch (Exception ex) {
            throw new RuntimeException("加载WebRenderExt错误，检查配置项WEBAPP_EXT:" + ex.getMessage(), ex);
        }

    }

}
