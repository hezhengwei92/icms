package com.icms.common.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import com.jfinal.core.Controller;

public class ServletUtil {

    public static String getDomain(HttpServletRequest request) {
        String path = request.getContextPath();
        String domain = request.getServerName();
        if (request.getServerPort() == 80) {
            domain += path;
        } else {
            domain += ":" + request.getServerPort() + path;
        }
        return domain;
    }

    public static String getIpAddr(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }

    public static boolean isPost(Controller c) {
        String requersMethod = c.getRequest().getMethod();
        if (requersMethod.equals("POST") || "POST".equals(requersMethod)) {
            return true;
        }
        return false;
    }

    public static String getCookie(String name, HttpServletRequest request) {
        Cookie cookie = getCookieObject(name, request);
        return cookie != null ? cookie.getValue() : null;
    }

    public static String getCookie(String name, String defaultValue, HttpServletRequest request) {
        Cookie cookie = getCookieObject(name, request);
        return cookie != null ? cookie.getValue() : defaultValue;
    }

    public static Cookie getCookieObject(String name, HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null)
            for (Cookie cookie : cookies)
                if (cookie.getName().equals(name))
                    return cookie;
        return null;
    }
}
