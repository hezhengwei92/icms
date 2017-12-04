package com.icms.config;

import com.alibaba.druid.filter.stat.StatFilter;
import com.alibaba.druid.util.JdbcUtils;
import com.alibaba.druid.wall.WallFilter;
import com.icms.cms.model._MappingKit;
import com.icms.common.beetl.BeetlRenderFactory;
import com.icms.common.ext.FakeStaticHandler;
import com.icms.common.ext.InitHandler;
import com.icms.common.install.InstallController;
import com.icms.common.install.InstallInterceptor;
import com.icms.common.interceptor.ErrorInterceptor;
import com.icms.common.interceptor.SystemInterceptor;
import com.icms.common.quartz.QuartzPlugin;
import com.icms.common.quartz.job.ContentPostJob;
import com.icms.common.session.BTGSessionDao;
import com.icms.common.session.BTGSessionManager;
import com.icms.common.session.impl.BTGDBSessionDao;
import com.icms.common.session.impl.BTGDBSessionDaoConfig;
import com.icms.common.session.impl.BTGStandardSessionManager;
import com.icms.common.session.plugin.BTGSessionManagerPlugin;
import com.icms.common.shiro.ShiroInterceptor;
import com.icms.common.shiro.ShiroPlugin;
import com.icms.common.thread.HtmlThread;
import com.icms.config.routes.HomeRoutes;
import com.icms.config.routes.SystemRoutes;
import com.icms.config.routes.UCenterRoutes;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.core.JFinal;
import com.jfinal.ext.interceptor.SessionInViewInterceptor;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;

public class AppConfig extends JFinalConfig {

    private Routes routes = null;
    // 是否生成静态
    public static boolean is_static = false;
    // 是否已安装
    public static boolean is_install = false;
    // 系统后台地址
    public static String manage_path;
    // 伪静态后缀
    public static String dynamic_suffix;
    // 主机http协议
    public static String http_protocol;
    // mysql连接地址
    public static String db_url;
    // 全局配置
    public static LoadDbAppConfig system_config;

    @Override//配置jfinal常量值
    public void configConstant(Constants me) {

        me.setEncoding("utf-8");
        me.setUrlParaSeparator("-");
        me.setBaseUploadPath("r/upload/");
        me.setMainRenderFactory(new BeetlRenderFactory());
        me.setError404View("/common/404.html");
        me.setError401View("/common/401.html");
        me.setError500View("/common/500.html");

        //加载配置文件
        /*
		通过PropKit 加载配置文件 然后取值 取到的值 会缓存在内存当中
		 */
        PropKit.use("application.properties");
        //从配置文件中获取是否安装
        AppConfig.is_install = PropKit.getBoolean("system.install", false);

        // 如果已安装从数据库获取网站配置
        if (is_install) {
            AppConfig.db_url = "jdbc:mysql://" + PropKit.get("db.host") + ":" + PropKit.getInt("db.port", 3306) + "/"
                    + PropKit.get("db.name")
                    + "?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull";
            AppConfig.system_config = new LoadDbAppConfig();
            AppConfig.manage_path = system_config.getString("admin_path");
            AppConfig.dynamic_suffix = system_config.getString("dynamic_suffix").trim();
            AppConfig.http_protocol = system_config.getString("http_protocol");
            me.setDevMode(true);//在开发模式
            me.setMaxPostSize(1024 * 1024);
        }

    }

    /**
     * 配置JFinal访问路由
     * me.add("/hello",HelloController.class)
     * 访问 http://localhost/hello 将访问HeoolController.index()方法
     */

    @Override
    public void configRoute(Routes me) {

        if (is_install) {
            this.routes = me;
            me.add(new HomeRoutes());
            me.add(new UCenterRoutes());
            me.add(new SystemRoutes());
        } else {

            me.add("/", InstallController.class);
        }
    }

    @Override
    public void configPlugin(Plugins me) {
        // 配置Ehcache插件
        me.add(new EhCachePlugin());

        if (is_install) {
            // 配置ActiveRecord数据库访问插件
            DruidPlugin druidPlugin = new DruidPlugin(db_url, PropKit.get("db.user"),
                    PropKit.get("db.password").trim());
            WallFilter wall = new WallFilter();
            druidPlugin.addFilter(new StatFilter());
            wall.setDbType(JdbcUtils.MYSQL);
            druidPlugin.addFilter(wall);
            me.add(druidPlugin);

            // 配置ActiveRecord插件
            ActiveRecordPlugin arp = new ActiveRecordPlugin(druidPlugin);
            arp.setShowSql(true);
            me.add(arp);
            _MappingKit.mapping(arp);

            // 配置BtgSession插件
            BTGDBSessionDaoConfig dbSessionDaoConfig = new BTGDBSessionDaoConfig();
            dbSessionDaoConfig.setTableName("ic_member_session");// 数据库存放session的表名称，可自定义，不设置默认为[_session]
            dbSessionDaoConfig.setSessionIdColumnName("session_id");// 数据库表存放session_id的列名，不设置默认为[si]
            dbSessionDaoConfig.setSessionObjColumnName("session_obj");// 数据库表存放session对象的列名，不设置默认为[so]
            dbSessionDaoConfig.setSessionLastActiveTimeColumnName("last_active_time");// 数据库表存放session最后访问时间的列名，不设置默认为[lat]
            BTGSessionDao sessionDao = new BTGDBSessionDao(dbSessionDaoConfig);
            BTGSessionManager sessionManager = new BTGStandardSessionManager(sessionDao);
            sessionManager.setSessionIdKey("ICMS-SESSION");
            BTGSessionManagerPlugin sessionManagerPlugin = new BTGSessionManagerPlugin(sessionManager);
            me.add(sessionManagerPlugin);

            // 配置shiro插件
            ShiroPlugin shiroPlugin = new ShiroPlugin(routes);
            shiroPlugin.setLoginUrl(AppConfig.manage_path + "/login");
            shiroPlugin.setSuccessUrl(AppConfig.manage_path);
            shiroPlugin.setUnauthorizedUrl("/401");
            me.add(shiroPlugin);

            // 配置quartz插件
            QuartzPlugin quartz = new QuartzPlugin();
            quartz.addJob(new ContentPostJob().cron("0 0/1 * * * ?"));
            me.add(quartz);
        }

    }

    //配置JFinal的全局拦截器 将拦截所有action请求 除非使用@Clear在Controller中清除
    @Override
    public void configInterceptor(Interceptors me) {


        if (is_install) {
            me.add(new ErrorInterceptor());
            me.add(new ShiroInterceptor());
            me.add(new SystemInterceptor());
            me.add(new SessionInViewInterceptor());
        } else {
            me.add(new InstallInterceptor());
        }

    }

    //配置JFinal的Handler 配置了处理器 可以接管所有web请求 并对应拥有完全的控制权
    @Override
    public void configHandler(Handlers me) {
        if (is_install) {
            me.add(new InitHandler());
            me.add(new FakeStaticHandler());
        }

    }

    public static void main(String[] args) {
//启动
        JFinal.start("src/main/webapp", 8080, "/", 5);

    }

    /*
    JFinal会在系统启动完成回调afterFinalStart方法 会在系统关闭前回调beforeJFinalStop方法
    这两方法可以方便的在项目启动后与关闭前让开发者有机会进行额外操作
    比如在系统启动后创建调度线程或是在系统关闭前写会缓存
     */
    @Override
    public void afterJFinalStart() {
        new Thread(new HtmlThread()).start();

    }
}
