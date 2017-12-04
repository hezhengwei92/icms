package com.icms.common.vo;

import javax.servlet.http.HttpServletRequest;

import com.icms.common.session.BTGSession;
import com.icms.common.session.kit.SessionKit;

public class BTGSessionVo {

    HttpServletRequest request = null;
    BTGSession session = null;

    public BTGSessionVo(HttpServletRequest request) {
        this.session = SessionKit.getSession(request.getAttribute("BTGSessionId") == null ? null : (String) request.getAttribute("BTGSessionId"));
    }

    public Object get(String key) {
        if (session == null) {
            return null;
        } else {
            return session.getAttribute(key);
        }

    }

}
