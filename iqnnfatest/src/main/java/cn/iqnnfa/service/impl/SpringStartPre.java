package cn.iqnnfa.service.impl;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.springframework.stereotype.Service;

@Service
public class SpringStartPre {
	
	@PostConstruct
	public void init(){
		System.out.println("我要启动了");
	}
	
	@PreDestroy
	public void destory(){
		System.out.println("我要消失了");
	}
}
