package com.icms.common.shiro;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

public class ShiroUtil {

    public static Subject getSubject() {
        return SecurityUtils.getSubject();
    }

    public static Session getSession() {
        return SecurityUtils.getSubject().getSession();
    }

    public static Object getSessionAttr(Object key) {
        return SecurityUtils.getSubject().getSession().getAttribute(key);
    }

    public static void setSessionAttr(Object key, Object value) {
        SecurityUtils.getSubject().getSession().setAttribute(key, value);
    }
}
