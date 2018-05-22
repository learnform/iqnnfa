package cn.iqnnfa.configClass;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;

import cn.iqnnfa.model.DrMember;

@Component
public class BeanFactoryTest {

	@Bean
	@Qualifier("public")
	public DrMember drMemberInstance(){
		
		return new DrMember();
	}
	public void doWork(){
		System.out.println();
	}
}
