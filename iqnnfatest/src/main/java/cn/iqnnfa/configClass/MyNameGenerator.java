package cn.iqnnfa.configClass;

import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.beans.factory.support.BeanDefinitionRegistry;
import org.springframework.beans.factory.support.BeanNameGenerator;

public class MyNameGenerator implements BeanNameGenerator{

	@Override
	public String generateBeanName(BeanDefinition definition, BeanDefinitionRegistry registry) {
		// TODO Auto-generated method stub
		String[] attributeNames = definition.attributeNames();
		for (String name : attributeNames) {
			return name;
		}
		return registry.toString();
	}

}
