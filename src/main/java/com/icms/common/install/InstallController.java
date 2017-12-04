package com.icms.common.install;

import java.io.File;

import java.util.List;

import com.icms.cms.base.BaseController;
import com.icms.common.util.CmsUtil;
import com.jfinal.kit.PathKit;

public class InstallController extends BaseController {

    public void index() {
        createToken();
        render("/install/index.html");
    }

    public void installed() throws Exception {
        if (validateToken()) {
            renderText("系统安装中......");
        } else {
            String dbHost = getPara("dbhost");
            String dbPort = getPara("dbport");
            String dbUser = getPara("dbuser");
            String dbPassword = getPara("dbpw");
            String dbName = getPara("dbname");
            String username = getPara("username");
            String password = getPara("password");
            String email = getPara("email");
            String fromFile = PathKit.getRootClassPath() + File.separator + "application-sample.properties";
            String toFile = PathKit.getRootClassPath() + File.separator + "application2.properties";
            String msg = null;
            try {
                System.out.println(1);
                Install.createDb(dbHost, dbPort, dbName, dbUser, dbPassword);
                System.out.println(2);
                Install.changeDbCharset(dbHost, dbPort, dbName, dbUser, dbPassword);
                List<String> tableSql = Install.readSql(PathKit.getWebRootPath() + File.separator + "r" + File.separator
                        + "install" + File.separator + "sql" + File.separator + "cms.sql");
                System.out.println(3);
                Install.createTable(dbHost, dbPort, dbName, dbUser, dbPassword, tableSql);
                List<String> dataSql = Install.readSql(PathKit.getWebRootPath() + File.separator + "r" + File.separator
                        + "install" + File.separator + "sql" + File.separator + "data.sql");
                System.out.println(4);
                Install.createTable(dbHost, dbPort, dbName, dbUser, dbPassword, dataSql);
                Install.copyProp(fromFile, toFile);
                Install.createProp(toFile, dbHost, dbPort, dbName, dbUser, dbPassword);
                Install.updateConfig(dbHost, dbPort, dbName, dbUser, dbPassword, this.getDomain(), username, password,
                        email);
            } catch (Exception e) {
                msg = e.getMessage();
            }
            if (CmsUtil.isBlank(msg)) {
                renderText("系统安装成功，请重新启动Tomcat或者Jetty！");
            } else {
                setAttr("msg", msg);
                render("/install/index.html");
            }
        }
    }
}
