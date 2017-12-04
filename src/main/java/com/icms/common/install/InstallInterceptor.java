package com.icms.common.install;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.kit.PropKit;

public class InstallInterceptor implements Interceptor {

    @Override
    public void intercept(Invocation inv) {

        if (PropKit.use("application.properties").getBoolean("system.install", false)) {

            inv.getController().renderText("系统安装成功，请重新启动Tomcat或Jetty！");

        } else if (inv.getActionKey().equals("/") || inv.getActionKey().equals("/installed")) {

            inv.invoke();

        } else {

            inv.getController().redirect("/");

        }
    }

}
