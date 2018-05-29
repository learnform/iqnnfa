package cn.iqnnfa.task;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@RabbitListener(queues="lyhTest2")
public class DdSender {
    @RabbitHandler
    public void send(String msg) {
    	System.out.println(msg);
    }

}