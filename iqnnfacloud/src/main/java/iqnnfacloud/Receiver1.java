package iqnnfacloud;

import org.springframework.amqp.rabbit.annotation.RabbitHandler;  
import org.springframework.amqp.rabbit.annotation.RabbitListener;  
import org.springframework.stereotype.Component;  
  
@Component  
@RabbitListener(queues = "workqueue-durable")
public class Receiver1 {  
  
    @RabbitHandler  
    public void receiver(String msg){  
        System.out.println("Test2 receiver2:"+msg);  
    }  
} 