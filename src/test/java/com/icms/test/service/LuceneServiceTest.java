package com.icms.test.service;
//import java.util.List;
//import java.util.Map;
//
//import org.apache.lucene.search.IndexSearcher;
//import org.apache.lucene.search.Query;
//import org.junit.Test;
//
//import com.icms.cms.model.Content;
//import com.icms.cms.service.LuceneService;
//import com.icms.common.lucene.LuceneDao;
//import com.icms.common.lucene.common.QueryUtil;
//import com.icms.common.lucene.common.SearchResultEntity;
//import com.icms.test.base.BaseTest;
//
//public class LuceneServiceTest extends BaseTest {
//

//	@Test
//	public void delTest(){
//		LuceneService.service.deleteAll(null);
//	}
////	
//	@Test
//	public void addTest(){
//		Content c = new Content();
//		c.setContentId(103l);
//		c.setTitle("谷歌使用微软的技术提高 Chrome 15％的速度");
//		c.setContent("本文大部分内容翻译自我开始学习AWK时看到的一篇英文文章 AWK Tutorial ，觉得对AWK入门非常有帮助"+
//
//"内容简介：传统直播转战移动直播以来，16年作为直播的元年，各IT巨头争相进入移动直播业务，百家争鸣"+
//
//"。从技术角度如何进一步提升移动产品性能，特别是基于H5 & Hybrid等开发模式，快速的产品迭代要求下"+
//
//"，满足对产品原生native体验的要求。在整个直播产品的技术架构中，还存在哪些瓶颈我们可以进一步优化"+
//
//"，提升移动直播产品在不同移动网络场景下直播稳定、画质清晰度、流畅度等。除此之外，从团队的角度出");
//	c.setUrl("http://www.oschina.net/news/78646/google-anddfdsf");
//	LuceneService.service.save(c);
//	}
//	
//	@Test
//	public void searchTest(){
//		SearchResultEntity result = LuceneService.service.saerch("chrome", 2);
//		int i = 0;
//		for(Map<String, String> m : result.getDocs()){
//			System.out.println("-------------------------------------------");
//			System.out.println(m.get("id"));
//			System.out.println("-------------------------------------------");
//			System.out.println(m.get("title"));
//			System.out.println("-------------------------------------------");
//			System.out.println(m.get("content"));
//			System.out.println("-------------------------------------------");
//			 i++;
//		}
//		System.out.println(i);
//	}
//}
