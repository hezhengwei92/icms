package com.icms.common.install;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.io.FileUtils;

import com.icms.common.shiro.PasswordHelper;
import com.icms.common.util.CmsUtil;
import com.jfinal.plugin.druid.DruidPlugin;

public class Install {

    static String url = "jdbc:mysql://{host}:{port}/{name}?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull";
    static String driverClass = "com.mysql.jdbc.Driver";

    public static void createProp(String fileName, String dbHost, String dbPort, String dbName, String dbUser,
                                  String dbPassword) throws Exception {
        String s = FileUtils.readFileToString(new File(fileName));
        s = s.replace("DB_HOST", dbHost);
        s = s.replace("DB_PORT", dbPort);
        s = s.replace("DB_NAME", dbName);
        s = s.replace("DB_USER", dbUser);
        s = s.replace("DB_PASSWORD", dbPassword);
        s = s.replace("false", "true");
        FileUtils.writeStringToFile(new File(fileName), s);
    }

    public static void copyProp(String fromFile, String toFile) throws Exception {
        FileUtils.copyFile(new File(fromFile), new File(toFile));
    }

    public static DataSource getDataSource(String dbHost, String dbPort, String dbName, String dbUser,
                                           String dbPassword) {
        DruidPlugin druidPlugin = new DruidPlugin(
                url.replace("{host}", dbHost).replace("{port}", dbPort).replace("{name}", dbName), dbUser, dbPassword,
                driverClass);
        druidPlugin.start();
        return druidPlugin.getDataSource();
    }

    public static Connection getConn(String dbHost, String dbPort, String dbName, String dbUser, String dbPassword)
            throws Exception {

        return getDataSource(dbHost, dbPort, dbName, dbUser, dbPassword).getConnection();
    }

    /**
     * 创建数据库
     *
     * @param dbHost
     * @param dbName
     * @param dbPort
     * @param dbUser
     * @param dbPassword
     * @throws Exception
     */
    public static void createDb(String dbHost, String dbPort, String dbName, String dbUser, String dbPassword)
            throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        String connStr = "jdbc:mysql://" + dbHost + ":" + dbPort + "?user=" + dbUser + "&password=" + dbPassword
                + "&characterEncoding=UTF8";
        Connection conn = DriverManager.getConnection(connStr);
        Statement stat = conn.createStatement();
        String sql = "drop database if exists " + dbName;
        stat.execute(sql);
        sql = "create database " + dbName + " CHARACTER SET UTF8";
        stat.execute(sql);
        stat.close();
        conn.close();
    }

    public static void changeDbCharset(String dbHost, String dbPort, String dbName, String dbUser, String dbPassword)
            throws Exception {
        Connection conn = getConn(dbHost, dbPort, dbName, dbUser, dbPassword);
        Statement stat = conn.createStatement();
        String sql = "ALTER DATABASE " + dbName + " CHARACTER SET UTF8";
        stat.execute(sql);
        stat.close();
        conn.close();
    }

    /**
     * 创建表
     *
     * @param dbHost
     * @param dbName
     * @param dbPort
     * @param dbUser
     * @param dbPassword
     * @param sqlList
     * @throws Exception
     */
    public static void createTable(String dbHost, String dbPort, String dbName, String dbUser, String dbPassword,
                                   List<String> sqlList) throws Exception {
        Connection conn = getConn(dbHost, dbPort, dbName, dbUser, dbPassword);
        Statement stat = conn.createStatement();
        for (String dllsql : sqlList) {
            System.out.println(dllsql);
            stat.execute(dllsql);
        }
        stat.close();
        conn.close();
    }

    /**
     * 更新配置
     *
     * @param dbHost
     * @param dbName
     * @param dbPort
     * @param dbUser
     * @param dbPassword
     * @param domain
     * @param cxtPath
     * @param port
     * @throws Exception
     */
    public static void updateConfig(String dbHost, String dbPort, String dbName, String dbUser, String dbPassword,
                                    String domain, String username, String password, String email) throws Exception {
        Connection conn = getConn(dbHost, dbPort, dbName, dbUser, dbPassword);
        Statement stat = conn.createStatement();
        String salt = CmsUtil.getUUID();
        String passwords = PasswordHelper.encodePassword(password, username, salt);
        String sql = "update ic_website set domain='" + domain + "' where site_id= 2";
        String sq2 = "update ic_admin set username='" + username + "', password='" + passwords + "' ,salt ='" + salt
                + "', email = '" + email + "' where admin_id= 9";
        stat.executeUpdate(sql);
        stat.executeUpdate(sq2);
        stat.close();
        conn.close();
    }

    /**
     * 读取sql语句。“/*”开头为注释，“;”为sql结束。
     *
     * @param fileName sql文件地址
     * @return list of sql
     * @throws Exception
     */
    public static List<String> readSql(String fileName) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(fileName), "UTF-8"));
        List<String> sqlList = new ArrayList<String>();
        StringBuilder sqlSb = new StringBuilder();
        String s = null;
        while ((s = br.readLine()) != null) {
            if (s.startsWith("/*") || s.startsWith("#") || CmsUtil.isBlank(s)) {
                continue;
            }
            if (s.endsWith(";")) {
                sqlSb.append(s);
                sqlSb.setLength(sqlSb.length() - 1);
                sqlList.add(sqlSb.toString());
                sqlSb.setLength(0);
            } else {
                sqlSb.append(s);
            }
        }
        br.close();
        return sqlList;
    }

    public static void main(String[] args) {
        try {
            String s = FileUtils.readFileToString(
                    new File("E:\\webapp\\icms\\icms\\target\\classes\\application-sample.properties"), "UTF-8");
            System.out.println(s);
            s = s.replace("DB_HOST", "127.0.0.1");
            FileUtils.writeStringToFile(new File("E:\\webapp\\icms\\icms\\target\\classes\\application2.properties"), s,
                    "UTF-8", false);

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
