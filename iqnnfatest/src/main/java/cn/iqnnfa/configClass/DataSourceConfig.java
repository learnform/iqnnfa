package cn.iqnnfa.configClass;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.jboss.logging.Logger;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.aop.framework.autoproxy.BeanNameAutoProxyCreator;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.support.http.StatViewServlet;
import com.alibaba.druid.support.http.WebStatFilter;
import com.alibaba.druid.support.spring.stat.DruidStatInterceptor;

@Configuration
@MapperScan(basePackages = DataSourceConfig.PACKAGE)
//@ConfigurationProperties(prefix="master")
public class DataSourceConfig {
	private static final Logger logger = Logger.getLogger(DataSourceConfig.class);
	static final String PACKAGE = "cn.iqnnfa.dao";
	//static final String DataSouceConfig = "classpath:cn/*.xml";
	
	@Value("${master.datasource.url}")
	private String url;
	
	@Value("${master.datasource.password}")
	private String password;
	
	@Value("${master.datasource.username}")
	private String user;
	
	@Value("${master.datasource.driverClassName}")
	private String driverClass;
	
	@Bean
	public DruidDataSource masterDataSource(){
		DruidDataSource datasouce = new DruidDataSource();  
		datasouce.setUrl(url);
		datasouce.setPassword(password);
		datasouce.setUsername(user);
		datasouce.setDriverClassName(driverClass);
		try {
			datasouce.setFilters("stat,wall");
		} catch (SQLException e) {
			logger.error("设置过滤器失败");
			e.printStackTrace();
		}
		return datasouce;
	}
	
	@Bean(name = "transactionManager")
	@ConditionalOnMissingBean(DataSourceTransactionManager.class)
	public DataSourceTransactionManager getDataSourceTransactionManager(){
		
		DataSourceTransactionManager dataSoureTransactionManager = new DataSourceTransactionManager(masterDataSource());
		return dataSoureTransactionManager;
	}
	@Bean  
	public ServletRegistrationBean druidServlet() {  
	     ServletRegistrationBean servletRegistrationBean = new ServletRegistrationBean();  
	     servletRegistrationBean.setServlet(new StatViewServlet());  
	     servletRegistrationBean.addUrlMappings("/druid/*");  
	     Map<String, String> initParameters = new HashMap<String, String>();  
	     // initParameters.put("loginUsername", "druid");// 用户名  
	     // initParameters.put("loginPassword", "druid");// 密码  
	     initParameters.put("resetEnable", "false");// 禁用HTML页面上的“Reset All”功能  
	     initParameters.put("allow", "127.0.0.1,192.168.56.101"); // IP白名单 (没有配置或者为空，则允许所有访问)  
	     // initParameters.put("deny", "192.168.20.38");// IP黑名单  
	     // (存在共同时，deny优先于allow)  
	     servletRegistrationBean.setInitParameters(initParameters);  
	     return servletRegistrationBean;  
	}  
	
//	@Bean(name = "masterSqlSessionFactory")
//    @Primary
//    public SqlSessionFactory masterSqlSessionFactory(@Qualifier("masterDataSource") DataSource masterDataSource)
//            throws Exception {
//        final SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
//        sessionFactory.setDataSource(masterDataSource);
//        sessionFactory.setMapperLocations(new PathMatchingResourcePatternResolver()
//                .getResources(DataSourceConfig.DataSouceConfig));
//        return sessionFactory.getObject();
//    }
	
	@Bean  
    public FilterRegistrationBean filterRegistrationBean() {  
        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();  
        filterRegistrationBean.setFilter(new WebStatFilter());  
        filterRegistrationBean.addUrlPatterns("/*");  
        filterRegistrationBean.addInitParameter("exclusions", "*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*");  
        return filterRegistrationBean;  
    }  
  
    // 按照BeanId来拦截配置 用来bean的监控  
    @Bean(value = "druid-stat-interceptor")  
    public DruidStatInterceptor DruidStatInterceptor() {  
        DruidStatInterceptor druidStatInterceptor = new DruidStatInterceptor();  
        return druidStatInterceptor;  
    }  
  
    @Bean  
    public BeanNameAutoProxyCreator beanNameAutoProxyCreator() {  
        BeanNameAutoProxyCreator beanNameAutoProxyCreator = new BeanNameAutoProxyCreator();  
        beanNameAutoProxyCreator.setProxyTargetClass(true);  
        // 设置要监控的bean的id  
        //beanNameAutoProxyCreator.setBeanNames("sysRoleMapper","loginController");  
        beanNameAutoProxyCreator.setInterceptorNames("druid-stat-interceptor");  
        return beanNameAutoProxyCreator;  
    }  
}
