package com.icms.cms.base;

import com.icms.common.session.BTGSession;
import com.icms.common.session.kit.SessionKit;
import com.icms.common.util.CmsUtil;
import com.jfinal.core.Controller;

/**
 * 前台父类
 */
public class MController extends BaseController {

    public Controller setBTGSessionAttr(String key, Object value) {
        BTGSession session = SessionKit.getNewSession();
        session.setAttribute(key, value);
        // session.setMaxInactiveInterval(60* 1000);
        SessionKit.addSession(session);
        setAttr("BTGSessionId", session.getId());
        return setCookie(SessionKit.getSessionIdKey(), session.getId(), 30 * 60);
        // return setCookie(SessionKit.getSessionIdKey(), session.getId(), 60);
    }

    public BTGSession getBTGSession() {
        String sessionId = getCookie(SessionKit.getSessionIdKey());
        BTGSession session = SessionKit.getSession(sessionId);
        return session;
    }

    @SuppressWarnings("unchecked")
    public <T> T getBTGSessionAttr(String key) {
        String sessionId = getCookie(SessionKit.getSessionIdKey());
        BTGSession session = SessionKit.getSession(sessionId);
        return session != null ? (T) session.getAttribute(key) : null;
    }

    public Controller removeBTGSession() {
        String sessionId = getCookie(SessionKit.getSessionIdKey());
        if (!CmsUtil.isBlank(sessionId)) {
            setCookie(SessionKit.getSessionIdKey(), null, 0);
            setAttr("BTGSessionId", null);
            SessionKit.removeSession(sessionId);
        }
        return this;
    }

    protected void renderUcenter(String template) {
        render("/" + UCENTER_PATH + "/" + template + "." + DEFAULT_HTML_SUFFIX);
    }

}
