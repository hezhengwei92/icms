package com.icms.common.util;

import org.apache.log4j.Logger;

/*
 ********************************************************* 
 *     select("*")                                       * 
 *     .from("ic_category as cat")                       * 
 *     .join("ic_content as c")                          * 
 *     .on("on cat.category_id = c.category_id ")        * 
 *     .where("site_id = ?").and("cat.category_id = ? ") * 
 *     .and(" c.recommend = ? ")                         * 
 *     .orderBy("c.content_id ",1)                       * 
 *     .limit(1, 0);                                     * 
 *********************************************************
 */

public class SQLUtil {

    public final Logger log = Logger.getLogger(this.getClass());

    private final String SELECT = " SELECT ";
    private final String DELETE = " DELETE ";
    private final String FROM = " FROM ";
    private final String WHERE = " WHERE ";
    private final String ORDERBY = " ORDER BY ";
    private final String DESC = " DESC ";
    private final String OR = " OR ";
    private final String AND = " AND ";
    private final String INNERJOIN = " INNER JOIN ";
    private final String LEFTJOIN = " LEFT JOIN ";
    private final String RIGHTJOIN = " RIGHT JOIN ";
    private final String ON = " ON ";
    private String sqlStr = "";
    private String filedStr = "";
    private String tableStr = "";

    public SQLUtil() {
        log.debug("###############我被调用啦###############");
        empty();
    }

    public SQLUtil empty() {
        this.sqlStr = "";
        this.filedStr = "";
        this.tableStr = "";
        return this;
    }

    public SQLUtil select(String... fileds) {

        for (int i = 0; i < fileds.length; i++) {
            filedStr += " " + fileds[i] + " ";
            if (!(i == fileds.length - 1)) {
                filedStr += " , ";
            }
            sqlStr = SELECT + filedStr;
        }

        return this;
    }

    public SQLUtil delect() {

        sqlStr = DELETE;

        return this;
    }

    public SQLUtil from(String... tables) {
        for (int i = 0; i < tables.length; i++) {
            tableStr += " " + tables[i] + " ";
            if (!(i == tables.length - 1)) {
                tableStr += " , ";
            }
            sqlStr += FROM + tableStr;
        }
        return this;
    }

    public SQLUtil join(String tables) {
        sqlStr += INNERJOIN + tables;
        return this;
    }

    public SQLUtil leftjoin(String tables) {
        sqlStr += LEFTJOIN + tables;
        return this;
    }

    public SQLUtil rightjoin(String tables) {
        sqlStr += RIGHTJOIN + tables;
        return this;
    }

    public SQLUtil on(String condition) {
        sqlStr += ON + condition;
        return this;
    }

    public SQLUtil where(String condition) {
        sqlStr += WHERE + condition;
        return this;

    }

    public SQLUtil and(String condition) {
        sqlStr += AND + condition;
        return this;

    }

    public SQLUtil or(String condition) {
        sqlStr += OR + condition;
        return this;

    }

    public SQLUtil orderBy(String filed, int desc) {

        sqlStr += ORDERBY + " " + filed + " ";
        if (desc == 1) {
            sqlStr += DESC;
        }
        return this;
    }

    public SQLUtil limit(int f, int t) {
        if (t == 0) {
            sqlStr = " LIMIT " + f;
        } else {
            sqlStr = " LIMIT " + f + " " + t;
        }
        return this;
    }

    public String exec() {

        return sqlStr;
    }

    //非singleton
    public static SQLUtil me() {

        return new SQLUtil();

    }

}
