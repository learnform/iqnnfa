package cn.iqnnfa;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

@Component
public class CommonUtis implements BeanPostProcessor{

	@Override
	public Object postProcessAfterInitialization(Object bean, String beanName) throws BeansException {
		// TODO Auto-generated method stub
		if("indexService".equals(beanName)){
			System.out.println("-----------------");
			System.out.println(beanName);
			System.out.println("实例生成之后的我");
		}
		return bean;
	}

	@Override
	public Object postProcessBeforeInitialization(Object bean, String beanName) throws BeansException {
		// TODO Auto-generated method stub
		if("indexService".equals(beanName)){
			System.out.println("实例生成之前的我");
			System.out.println(beanName);
		}
		return bean;
	}
}
