package cn.iqnnfa.configClass;

import org.springframework.context.ApplicationListener;

public class iqnnfaListen implements ApplicationListener<iqnnfaEvent> {

	@Override
	public void onApplicationEvent(iqnnfaEvent event) {
		@SuppressWarnings("unused")
		int i = 1;
		System.out.println("监听iqnnfa事件发生");

	}

}