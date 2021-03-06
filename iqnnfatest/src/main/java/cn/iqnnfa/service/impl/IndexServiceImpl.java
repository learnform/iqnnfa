package cn.iqnnfa.service.impl;

import java.io.IOException;
import java.util.UUID;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.client.solrj.response.UpdateResponse;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.SolrInputDocument;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.BeanNameAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.iqnnfa.dao.IndexDAO;
import cn.iqnnfa.model.DrMember;
import cn.iqnnfa.service.IndexService;

@Service
@EnableTransactionManagement
public class IndexServiceImpl implements IndexService,BeanNameAware{
	
	final Logger logger = LoggerFactory.getLogger(IndexServiceImpl.class);
	private String beanName = null;
	@Autowired
	private IndexDAO indexDAO;
	@Override
	@Cacheable(value = "userInfo", key = "'findUser' + #id")
	public DrMember findMemberByUid(Integer id) {
		// TODO Auto-generated method stub
	    		 try {
					DrMember drMember = indexDAO.findMemberByUid(id);
					insertMember(id);
					ThreadLocal<DrMember> member = new ThreadLocal<DrMember>(); 
					System.out.println(member);
					return drMember;
				} catch (Exception e) {
					logger.equals("插入失败");
				}
	    		 return null;
	}
	@Override
	public void setBeanName(String name) {
		// TODO Auto-generated method stub
		this.beanName = name;
	}
	 
	@Transactional(propagation = Propagation.REQUIRED)
	public void addDocument(){
		HttpSolrServer solrServer = new HttpSolrServer("http://192.168.56.102:8080");
        // 创建一个文档对象  
        SolrInputDocument document = new SolrInputDocument();  
        document.addField("id", "002");   
        
        document.addField("title", "该应用场景为AdMaster DMP缓存存储需求，DMP需要管理非常多的第三方id数据，其中包括各媒体cookie与自身cookie（以下统称admckid）的mapping关系，还包括了admckid的人口标签、移动端id（主要是idfa和imei）的人口标签，以及一些黑名单id、ip等数据。");  
        // 把文档对象写入索引库  
        try {
			solrServer.add(document);
			solrServer.commit();  
		} catch (SolrServerException e) {
			logger.error(e.getMessage());
			e.printStackTrace();
			
		} catch (IOException e) {
			logger.error(e.getMessage());
			e.printStackTrace();
		}  
	}
	
	public void queryDocument() throws Exception {  
	    // 创建一个连接  
		HttpSolrServer solrServer = new HttpSolrServer("http://192.168.56.102:8080");
	    SolrQuery query = new SolrQuery();  
	    // 设置查询条件  
	    query.setQuery("应用");  
	    // 设置默认搜素域  
	    query.set("df", "title");  
	    // 根据查询条件查询索引库  
	    QueryResponse queryResponse = solrServer.query(query);  
	    // 取查询结果  
	    SolrDocumentList solrDocumentList = queryResponse.getResults();  
	    // 打印查询结果的数量  
	    System.out.println(solrDocumentList.getNumFound());  
	    // 打印查出的第一条数据的id  
	    System.out.println(solrDocumentList.get(0).get("title"));  
	}
	@Override
	public void insertMember(Integer id) {
		// TODO Auto-generated method stub
		indexDAO.insertMember(id);
		
	}
	@Override
	@Async
	public void executortask(Integer i) {
		System.out.println("程序执行了"+i+"次");
		}
	@Async
	public void excutortaskAgain(Integer i){
		System.out.println("程序执行了"+i+"次次次次");
	}
}  

