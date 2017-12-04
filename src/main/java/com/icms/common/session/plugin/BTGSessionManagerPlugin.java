package com.icms.common.session.plugin;

import com.icms.common.session.BTGSessionManager;
import com.icms.common.session.kit.SessionKit;
import com.jfinal.plugin.IPlugin;

/**
 * session管理插件
 */
public class BTGSessionManagerPlugin implements IPlugin {

    private static BTGSessionManager sessionManager;

    public BTGSessionManagerPlugin(BTGSessionManager sessionManager) {
        BTGSessionManagerPlugin.sessionManager = sessionManager;
    }

    @Override
    public boolean start() {
        SessionKit.setSessionManager(sessionManager);
        return true;
    }

    @Override
    public boolean stop() {
        return true;
    }

}
