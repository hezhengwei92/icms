package com.icms.config;

import javax.sql.DataSource;

import com.jfinal.kit.PathKit;
import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.dialect.MysqlDialect;
import com.jfinal.plugin.activerecord.generator.Generator;
import com.jfinal.plugin.druid.DruidPlugin;

public class GeneratorTable {
    static String url = "jdbc:mysql://{host}:{port}/{name}?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull";
    static String driverClass = "com.mysql.jdbc.Driver";

    public static DataSource getDataSource() {
        Prop p = PropKit.use("application.properties");
        DruidPlugin druidPlugin = new DruidPlugin(url.replace("{host}", p.get("db.host"))
                .replace("{port}", PropKit.get("db.port", "3306")).replace("{name}", PropKit.get("db.name")),
                p.get("db.user"), p.get("db.password"), driverClass);
        druidPlugin.start();
        return druidPlugin.getDataSource();
    }

    public static void main(String[] args) {
        // base model 所使用的包名
        String baseModelPackageName = "com.icms.cms.model.base";
        // base model 文件保存路径
        String baseModelOutputDir = PathKit.getWebRootPath() + "\\src\\main\\java\\com\\icms\\cms\\model\\base";
        System.out.println(baseModelOutputDir);
        // model 所使用的包名 (MappingKit 默认使用的包名)
        String modelPackageName = "com.icms.cms.model";
        // model 文件保存路径 (MappingKit 与 DataDictionary 文件默认保存路径)
        String modelOutputDir = baseModelOutputDir + "/..";

        // 创建生成器
        Generator gernerator = new Generator(getDataSource(), baseModelPackageName, baseModelOutputDir,
                modelPackageName, modelOutputDir);
        // 设置数据库方言
        gernerator.setDialect(new MysqlDialect());
        // 添加不需要生成的表名
        gernerator.addExcludedTable("ic_member_session");
        gernerator.addExcludedTable("ic_content_news");
        gernerator.addExcludedTable("ic_content_images");
        gernerator.addExcludedTable("ic_form_form");
        // 设置是否在 Model 中生成 dao 对象
        gernerator.setGenerateDaoInModel(true);
        // 设置是否生成字典文件
        gernerator.setGenerateDataDictionary(false);
        // 设置需要被移除的表名前缀用于生成modelName。例如表名 "osc_user"，移除前缀 "osc_"后生成的model名为
        // "User"而非 OscUser
        gernerator.setRemovedTableNamePrefixes("ic_");
        // 生成
        gernerator.generate();
    }
}
