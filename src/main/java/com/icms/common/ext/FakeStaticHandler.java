package com.icms.common.ext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icms.common.util.CmsUtil;
import com.icms.config.AppConfig;
import com.jfinal.handler.Handler;

public class FakeStaticHandler extends Handler {

    public void handle(String target, HttpServletRequest request, HttpServletResponse response, boolean[] isHandled) {
        int index = target.lastIndexOf(CmsUtil.isBlank(AppConfig.dynamic_suffix) ? ".php" : AppConfig.dynamic_suffix);
        if (index != -1) {
            target = target.substring(0, index);
        }
        next.handle(target, request, response, isHandled);
    }
}
