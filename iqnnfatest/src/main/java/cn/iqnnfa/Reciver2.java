package cn.iqnnfa;

import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class Reciver2 {

	@Autowired
	private AmqpTemplate amqpTemplate;

	@RequestMapping("/multiSend")
	@ResponseBody
	public String multiSend() {
		StringBuilder times = new StringBuilder();
		for (int i = 0; i < 10; i++) {
			long time = System.nanoTime();
			amqpTemplate.convertAndSend("lyhTest1", "第" + i + "次发送的时间：" + time);
			times.append(time + "<br>");
		}
		for (int i = 0; i < 10; i++) {
			long time = System.nanoTime();
			amqpTemplate.convertAndSend("lyhTest2", "第" + i + "次发送的时间：" + time);
			times.append(time + "<br>");
		}
		return times.toString();
	}
}
