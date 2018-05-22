package cn.iqnnfa;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.Scope;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import cn.iqnnfa.configClass.Action;
import cn.iqnnfa.configClass.PropertyUtil;
import cn.iqnnfa.model.DrMember;
import cn.iqnnfa.service.IndexService;

@RestController
//@EnableConfigurationProperties({ConfiguraBean.class,User.class})
@ConfigurationProperties
public class IndexController{
	private final static Logger logger = LoggerFactory.getLogger(IndexController.class);
	@Value("${activityMsg}")
	private String name;
	//@Value("${my.age}")
	private String age;
	@Value("www.huya.com")
	private Resource li;
	
	@Autowired
	private IndexService indexService;
	
	@RequestMapping(value="/findMemberByUid")
	@Action(needsave = true)
	public String findMemberByUid(){
		Integer uid = 1203;
		Integer i = null;
		DrMember drMember = indexService.findMemberByUid(uid);
		
		try {
//			indexService.addDocument();
//			indexService.queryDocument();
			//String activeMsg = PropertyUtil.getProperties("activityMsg").replace("{1}", "zhesss");
			for(i = 0;i < 26;i++){
				indexService.executortask(i);
				indexService.excutortaskAgain(i);
			}
			String httpFilePath = "file:D:/smsTemplete.properties";
			File httpFile = ResourceUtils.getFile(httpFilePath); 
			String activeMsg = PropertyUtil.getProperties("activityMsg").replace("{1}", "zhesss");
			InputStream in =  new FileInputStream(httpFile);
			Properties properties = new Properties();
			properties.load(in);
			in.close();
			String property = properties.getProperty("activityMsg");
			System.out.println(property);
			System.out.println(activeMsg + "---" + name);
			System.out.println(httpFile);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.error("读取配置文件信息错误");
		}
		//System.out.println(drMember.toString());
		return "index";
	}
	
	@RequestMapping(value="/push")
	public @ResponseBody String push(){
		Random a = new Random();
		try {
			Thread.sleep(5000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		return "index";
	}
	
}