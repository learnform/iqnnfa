package iqnnfacloud2;

import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageProperties;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;  
import org.springframework.amqp.rabbit.annotation.RabbitListener;  
import org.springframework.stereotype.Component;  
  
@Component  
@RabbitListener(queues = "lyhTest1")  
public class Receiver1 {  
  
    @RabbitHandler  
    public Message receiver(String drMember){  
        System.out.println("Test1 receiver2:"+drMember);
        MessageProperties messageProperties = new MessageProperties();
        messageProperties.setMessageId("dddd");
        messageProperties.setAppId("1");
        Message message = new Message("发送成功".getBytes(), messageProperties);
        return message;
    }  
} 