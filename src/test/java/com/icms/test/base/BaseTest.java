//package com.icms.test.base;
//
//import java.util.Map.Entry;
//
//import org.junit.Before;
//import com.icms.cms.model._MappingKit;
//import com.jfinal.kit.PropKit;
//import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
//import com.jfinal.plugin.activerecord.Model;
//import com.jfinal.plugin.druid.DruidPlugin;
//import com.jfinal.plugin.ehcache.EhCachePlugin;
//
//public class BaseTest {
//	
//    @Before
//	public void init(){
//    	new EhCachePlugin().start();
//		PropKit.use("application.properties");
//		String MYSQL_URL = "jdbc:mysql://" + PropKit.get("db.host")+":"+PropKit.getInt("db.port", 3306) + "/" + PropKit.get("db.name")
//				+ "?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull";
//		DruidPlugin druidPlugin = new DruidPlugin(MYSQL_URL, PropKit.get("db.user"), PropKit.get("db.password").trim());
//		druidPlugin.start();
//		// 配置ActiveRecord插件
//		ActiveRecordPlugin arp = new ActiveRecordPlugin(druidPlugin);
//		arp.setShowSql(true);
//		_MappingKit.mapping(arp);
//		arp.start();
//	}	
//	
//	
//	public void printModelKeyValue( @SuppressWarnings("rawtypes") Model<? extends Model> model){
//		System.out.println("---------------------------------------------------------------------------------");
//		for (Entry<String, Object> entry : model._getAttrsEntrySet()) {
//			
//			System.out.println(""+entry.getKey()+" --> "+entry.getValue());
//		
//		}
//		System.out.println("---------------------------------------------------------------------------------");
//	}
//}
