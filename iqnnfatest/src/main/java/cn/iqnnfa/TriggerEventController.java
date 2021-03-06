package cn.iqnnfa;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.ApplicationEventPublisherAware;
import org.springframework.stereotype.Controller;

import cn.iqnnfa.configClass.iqnnfaEvent;

@Controller
public class TriggerEventController implements ApplicationEventPublisherAware
{
	
	@Autowired
	private ApplicationContext applicationContext;


	@Override
	public void setApplicationEventPublisher(ApplicationEventPublisher applicationEventPublisher) {
		applicationEventPublisher.publishEvent(new iqnnfaEvent(applicationContext));
	}
}
