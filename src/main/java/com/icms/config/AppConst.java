package com.icms.config;

public class AppConst {

    public final static String SESSION_ADMIN = "SESSION-ADMIN";
    public final static String SESSION_USER = "SESSION-USER";
    public final static String INDEX_ACTION = "index";
    public final static String CHANNEL_ACTION = "channel";
    public final static String LIST_ACTION = "list";
    public final static String CONTENT_ACTION = "content";
    public final static String SITE_ID = "siteId";
    public final static String PAGE_SIZE = "page_size";
    public final static String DRIVER_CLASS = "com.mysql.jdbc.Driver";
    public final static String[] SERVICE_CACHE = {"admin_cache", "category_cache", "content_cache", "modelfiled_cache",
            "model_cache", "site_cache", "role_cache", "permisson_cache"};
    public final static String[] AUTH = {"system", "admin", "content", "category", "member", "model", "role",
            "permisson"};
    public final static int ADMIN_CACHE = 0;
    public final static int CATEGORY_CACHE = 1;
    public final static int CONTENT_CACHE = 2;
    public final static int MODELFILED_CACHE = 3;
    public final static int MODEL_CACHE = 4;
    public final static int SITE_CACHE = 5;
    public final static int ROLE_CACHE = 6;
    public final static int PERMISSION_CACHE = 7;
    public final static String INDEX_CACHE = "index_cache";
    public final static String SYSTEM_CACHE = "system_cache";
    public final static int SYSTEM_AUTH = 0;
    public final static int ADMIN_AUTH = 1;
    public final static int CONTENT_AUTH = 2;
    public final static int CATEGORY_AUTH = 3;
    public final static int MEMBER_AUTH = 4;
    public final static int MODEL_AUTH = 5;
    public final static int ROLE_AUTH = 6;
    public final static int PERMISSION_AUTH = 7;

    public static void main(String[] args) {
        System.out.println();
    }

}
