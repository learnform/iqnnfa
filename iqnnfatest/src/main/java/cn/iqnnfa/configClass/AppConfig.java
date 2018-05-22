package cn.iqnnfa.configClass;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration 
public class AppConfig {
	@Bean(initMethod ="init") 
	public Foo foo(){
         return new Foo(); 
    } 
   @Bean(destroyMethod ="cleanup") 
       public Bar bar(){
         return new Bar(); 
    } 
}
