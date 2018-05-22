package cn.iqnnfa.configClass;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationEvent;

public class iqnnfaEvent extends ApplicationEvent{

	public iqnnfaEvent(ApplicationContext source) {
		super(source);
		System.out.println("事件发生");
	}

	
}
