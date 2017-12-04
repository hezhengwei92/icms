package com.icms.common.session.impl;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import com.icms.common.session.BTGSession;
import com.icms.common.session.BTGSessionDao;

/**
 * 基于本地容器的session存储实现
 */
public class BTGLocalSessionDao implements BTGSessionDao {

    //session容器
    private static Map<String, BTGSession> sessionMap = new ConcurrentHashMap<String, BTGSession>();

    @Override
    public void saveSession(BTGSession session) {
        if (null != session) {
            sessionMap.put(session.getId(), session);
        }
    }

    @Override
    public void deleteSession(String sessionId) {
        if (null != sessionId && sessionId.length() > 0) {
            sessionMap.remove(sessionId);
        }
    }

    @Override
    public BTGSession getSession(String sessionId) {
        if (null != sessionId && sessionId.length() > 0) {
            return sessionMap.get(sessionId);
        }
        return null;
    }

    @Override
    public void refreshSession(BTGSession session) {
        sessionMap.put(session.getId(), session);
    }
}
