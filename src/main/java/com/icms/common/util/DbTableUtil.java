package com.icms.common.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import org.apache.log4j.Logger;
import com.icms.config.AppConfig;
import com.icms.config.AppConst;
import com.jfinal.kit.PropKit;

/**
 * @author Jin E-mail:jin@westboy.net
 * @version 创建时间：2016年5月27日 下午9:44:05
 */
public class DbTableUtil {

    private final static Logger log = Logger.getLogger(DbTableUtil.class);

    public final static String INT_TYPE = "int";
    public final static String BIG_INT_TYPE = "bigint";
    public final static String TEXT_TYPE = "text";
    public final static String CHAR_TYPE = "char";
    public final static String VARCHAR_TYPE = "varchar";
    private final static String CREATE_TABLE_BEGIN = "CREATE TABLE `{table}` (";
    private final static String CREATE_TABLE_END = ") ENGINE=InnoDB DEFAULT CHARSET=utf8;";
    private final static String ALTER_TABLE_BEGIN = "ALTER TABLE `{tableName}`";
    private final static String ALTER_CHANGE_COLUMN = " CHANGE COLUMN ";
    private final static String ALTER_ADD_COLUMN = " ADD COLUMN ";
    private final static String ALTER_DROP_COLUMN = " DROP COLUMN ";
    private final static String TABLE_CONTENT_PREFIX = "ic_content_";
    private final static String TABLE_FORM_PREFIX = "ic_form_";
    private String TABLE_NAME_PREFIX;

    public DbTableUtil(boolean isContent) {
        if (isContent) {
            TABLE_NAME_PREFIX = TABLE_CONTENT_PREFIX;
        } else {
            TABLE_NAME_PREFIX = TABLE_FORM_PREFIX;
        }
    }

    /**
     * 创建数据表
     *
     * @param tableName
     * @param primaryKey
     * @return
     */
    public boolean initTable(final String tableName, final String primaryKey) {
        String primaryKeyFiled = buliderTableFiled(primaryKey, INT_TYPE, 11, true, false, null) + " PRIMARY KEY (`"
                + primaryKey + "`)";
        dropDbtable(tableName);
        return process(createDbtableStr(tableName, primaryKeyFiled));

    }

    /**
     * 创建数据表
     *
     * @param tableName
     * @return
     */
    public boolean initContentTable(final String tableName) {
        String primaryKeyFiled = buliderTableFiled("content_id", BIG_INT_TYPE, 20, false, false, null)
                + " PRIMARY KEY (`content_id`)";
        dropDbtable(tableName);
        return process(createDbtableStr(tableName, primaryKeyFiled));
    }

    public boolean initFormTable(final String tableName) {
        String primaryKeyFiled = buliderTableFiled("form_id", INT_TYPE, 11, false, false, null)
                + " PRIMARY KEY (`form_id`)";
        dropDbtable(tableName);
        return process(createDbtableStr(tableName, primaryKeyFiled));
    }

    /**
     * 创建表字符串
     *
     * @param tableName
     * @param createSql
     * @return
     */
    public String createDbtableStr(final String tableName, final String createSql) {
        String createbegin = CREATE_TABLE_BEGIN.replace("{table}", TABLE_NAME_PREFIX + tableName);
        String sql = createbegin + createSql + CREATE_TABLE_END;
        return sql;

    }

    /**
     * 删除数据表
     *
     * @param tableName
     * @return
     */
    public void dropDbtable(String tableName) {
        log.info("drop table : " + tableName);
        process("DROP TABLE IF EXISTS `" + TABLE_NAME_PREFIX + tableName + "`;");

    }

    /**
     * 添加数据表字段
     *
     * @param tableName
     * @param filedName
     * @param filedType
     * @param filedLenght
     * @param isNull
     * @param defaultValue
     */
    public void addTableFiled(String tableName, String filedName, String filedType, int filedLenght, boolean isNull,
                              String defaultValue) {
        String alterbegin = ALTER_TABLE_BEGIN.replace("{tableName}", TABLE_NAME_PREFIX + tableName);
        String addFiled = buliderTableFiled(filedName, filedType, filedLenght, false, isNull, defaultValue).replace(",",
                ";");
        process(alterbegin + ALTER_ADD_COLUMN + addFiled);
    }

    /**
     * 编辑表字段
     *
     * @param tableName
     * @param oldfiledName
     * @param newfiledName
     * @param filedType
     * @param filedLenght
     * @param isNull
     * @param defaultValue
     */
    public void editTableFiled(String tableName, String oldfiledName, String newfiledName, String filedType,
                               int filedLenght, boolean isNull, String defaultValue) {
        String alterbegin = ALTER_TABLE_BEGIN.replace("{tableName}", TABLE_NAME_PREFIX + tableName);
        String addFiled = buliderTableFiled(newfiledName, filedType, filedLenght, false, isNull, defaultValue)
                .replace(",", ";");
        process(alterbegin + ALTER_CHANGE_COLUMN + " `" + oldfiledName + "` " + addFiled);
    }

    /**
     * 删除表字段
     *
     * @param tableName
     * @param filedName
     */
    public void delTableFiled(String tableName, String filedName) {
        String alterbegin = ALTER_TABLE_BEGIN.replace("{tableName}", TABLE_NAME_PREFIX + tableName);
        process(alterbegin + DbTableUtil.ALTER_DROP_COLUMN + filedName);
    }

    /**
     * 根据条件拼接sql字段字符串
     *
     * @param filedName
     * @param filedType
     * @param length
     * @param isAuto
     * @param isNull
     * @param defaultValue
     * @return
     */
    public String buliderTableFiled(final String filedName, final String filedType, final int length,
                                    final boolean isAuto, boolean isNull, String defaultValue) {
        String sql = "`" + filedName + "` " + filedType;
        if (!filedType.equals(TEXT_TYPE)) {
            sql = sql + "(" + length + ") ";
            if (isNull) {
                sql = sql + " DEFAULT NULL ";
            } else {
                sql = sql + " NOT NULL ";
            }
            if (isAuto && !isNull) {
                sql = sql + " AUTO_INCREMENT";
            } else if (defaultValue != null && !isNull) {
                sql = sql + "DEFAULT `" + defaultValue + "` ";
            }
        }
        return sql + ",";
    }

    /**
     * 执行sql
     *
     * @param sql
     * @return
     */
    public boolean process(final String sql) {
        Connection connection = null;
        Statement statement = null;
        boolean result = true;
        try {
            Class.forName(AppConst.DRIVER_CLASS);
            connection = DriverManager.getConnection(AppConfig.db_url,
                    PropKit.use("application.properties").get("db.user"),
                    PropKit.use("application.properties").get("db.password"));
            statement = connection.createStatement();
            System.out.println("SQL String is : " + sql);
            statement.execute(sql);
            connection.close();
            statement.close();
        } catch (Exception e) {
            System.out.println("创建表格出错：" + e.getMessage());
            result = false;
        }

        return result;

    }

    public static DbTableUtil me(boolean isContent) {
        return new DbTableUtil(isContent);
    }

    public static void main(String[] args) {
        // System.out.println(initTable("news", "newsId"));

        // System.out.println(initTable("news"));
        // DbTableUtil.addTableFiled("test", "FiledName", DbTableUtil.intType,
        // 11, true, "");
        // editTableFiled("test", "oldFiledName", "newFiledName",
        // DbTableUtil.INT_TYPE, 11, true, "");

    }
}
