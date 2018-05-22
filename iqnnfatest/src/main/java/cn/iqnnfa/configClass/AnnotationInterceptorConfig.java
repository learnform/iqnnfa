package cn.iqnnfa.configClass;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import cn.iqnnfa.interceptor.AnnotationInterceptor;

@Configuration
public class AnnotationInterceptorConfig extends WebMvcConfigurerAdapter{
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new AnnotationInterceptor()).addPathPatterns("/**");
	}
	
}
