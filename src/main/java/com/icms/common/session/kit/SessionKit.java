package com.icms.common.session.kit;

import com.icms.common.session.BTGSession;
import com.icms.common.session.BTGSessionManager;

/**
 * session操作工具类，提供sessionManager的静态访问接口
 */
public class SessionKit {

    private static BTGSessionManager sessionManager;

    public static BTGSessionManager getSessionManager() {
        return sessionManager;
    }

    public static void setSessionManager(BTGSessionManager sessionManager) {
        SessionKit.sessionManager = sessionManager;
    }

    public static BTGSession getSession(String sessiongId) {
        return sessionManager.getSession(sessiongId);
    }

    public static BTGSession getNewSession() {
        return sessionManager.getNewSession();
    }

    public static void addSession(BTGSession session) {
        sessionManager.addSession(session);
    }

    public static void removeSession(String sessionId) {
        sessionManager.removeSession(sessionId);
    }

    public static String getSessionIdKey() {
        return sessionManager.getSessionIdKey();
    }

    public static long getSessionTimeout() {
        return sessionManager.getSessionTimeout();
    }

}
