package com.icms.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

import java.util.Map;

import com.icms.common.util.SQLUtil;
import com.jfinal.kit.PropKit;

public class LoadDbAppConfig {

    private Map<String, Object> configs = null;

    public LoadDbAppConfig() {
        configs = process(SQLUtil.me().select("*").from(" ic_config where id = 1 ").exec());

    }

    public String getString(String key) {
        return (String) configs.get(key);
    }

    public int getInt(String key) {

        return Integer.parseInt(String.valueOf(configs.get(key)));
    }

    public Long getLong(String key) {
        return (Long) configs.get(key);
    }

    public boolean getBoolean(String key) {
        return (boolean) configs.get(key);
    }

    /**
     * 执行sql
     *
     * @param sql
     * @return
     */
    private Map<String, Object> process(final String sql) {
        Connection connection = null;
        Statement statement = null;
        ResultSet rs = null;
        Map<String, Object> result = null;
        try {
            Class.forName(AppConst.DRIVER_CLASS);
            connection = DriverManager.getConnection(
                    AppConfig.db_url,
                    PropKit.use("application.properties").get("db.user"),
                    PropKit.use("application.properties").get("db.password"));
            statement = connection.createStatement();
            rs = statement.executeQuery(sql);
            result = new HashMap<String, Object>();
            while (rs.next()) {
                result.put("admin_path", rs.getString("admin_path"));
                result.put("upload_allowType", rs.getString("upload_allowType"));
                result.put("http_protocol", rs.getString("http_protocol"));
                result.put("dynamic_suffix", rs.getString("dynamic_suffix"));
                result.put("allow_member_reg", rs.getBoolean("allow_member_reg"));
                result.put("member_email_check", rs.getBoolean("member_email_check"));
                result.put("email_host", rs.getString("email_host"));
                result.put("email_port", rs.getInt("email_port"));
                result.put("email_username", rs.getString("email_username"));
                result.put("email_password", rs.getString("email_password"));
                result.put("qiniu_on", rs.getBoolean("qiniu_on"));
                result.put("qiniu_url", rs.getString("qiniu_url"));
                result.put("qiniu_bucketName", rs.getString("qiniu_bucketName"));
                result.put("qiniu_accessKey", rs.getString("qiniu_accessKey"));
                result.put("qiniu_secretKey", rs.getString("qiniu_secretKey"));
                result.put("sms_type", rs.getInt("sms_type"));
                result.put("sms_username", rs.getString("sms_username"));
                result.put("sms_password", rs.getString("sms_password"));
                result.put("oauth_sina_on", rs.getBoolean("oauth_sina_on"));
                result.put("oauth_sina_openid", rs.getString("oauth_sina_openid"));
                result.put("oauth_sina_openkey", rs.getString("oauth_sina_openkey"));
                result.put("oauth_sina_redirect", rs.getString("oauth_sina_redirect"));
                result.put("oauth_sina_on", rs.getBoolean("oauth_sina_on"));
                result.put("oauth_qq_openid", rs.getString("oauth_qq_openid"));
                result.put("oauth_qq_openkey", rs.getString("oauth_qq_openkey"));
                result.put("oauth_qq_redirect", rs.getString("oauth_qq_redirect"));
                result.put("is_dev", rs.getBoolean("is_dev"));
                result.put("is_demo", rs.getBoolean("is_demo"));
                result.put("mark_on", rs.getBoolean("mark_on"));
                result.put("mark_content", rs.getString("mark_content"));
                result.put("mark_width", rs.getInt("mark_width"));
                result.put("mark_hight", rs.getInt("mark_hight"));
                result.put("mark_color", rs.getString("mark_color"));
                result.put("page_size", rs.getInt("page_size"));
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null && statement != null) {
                    connection.close();
                    statement.close();
                    rs.close();

                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }

        return result;

    }
}
