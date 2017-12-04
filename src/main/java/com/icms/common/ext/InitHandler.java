package com.icms.common.ext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icms.common.session.kit.SessionKit;
import com.icms.common.util.ServletUtil;
import com.icms.common.util.CmsUtil;
import com.jfinal.handler.Handler;
import com.jfinal.kit.LogKit;

public class InitHandler extends Handler {

    @Override
    public void handle(String target, HttpServletRequest request, HttpServletResponse response, boolean[] isHandled) {
        long startTime = System.currentTimeMillis();
        // 在request中获取BTGSessionId，如果当前request中不存在则去Cookie中获取
        String BTGSessionId = (String) request.getAttribute("BTGSessionId");
        if (CmsUtil.isBlank(BTGSessionId)) {
            String CookieSessionId = (String) ServletUtil.getCookie(SessionKit.getSessionIdKey(), request);
            if (!CmsUtil.isBlank(CookieSessionId)) {
                request.setAttribute("BTGSessionId", CookieSessionId);
            }
        }
        next.handle(target, request, response, isHandled);
        LogKit.info("processTime:" + (System.currentTimeMillis() - startTime) + "ms");
    }

}
