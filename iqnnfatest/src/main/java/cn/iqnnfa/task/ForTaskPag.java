package cn.iqnnfa.task;

import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;


@Configuration
@EnableScheduling
public class ForTaskPag {
	
	@Scheduled(cron="0 */1 * * * ?")
	public void justForTest(){
		System.out.println("测试定时任务——————一分钟跑一次");
	}
}
