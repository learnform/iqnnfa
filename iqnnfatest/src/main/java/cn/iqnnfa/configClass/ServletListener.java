package cn.iqnnfa.configClass;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cn.iqnnfa.model.DrMember;
import cn.iqnnfa.service.IndexService;

@Component
public class ServletListener implements ServletContextListener{
	
	@Autowired
	private IndexService indexService;
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		System.out.println("------监听器销毁-------");
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		DrMember drMember = indexService.findMemberByUid(1203);
		System.out.println("-----监听器初始化-----");
		System.out.println(drMember.getMobilephone());
	}

}
