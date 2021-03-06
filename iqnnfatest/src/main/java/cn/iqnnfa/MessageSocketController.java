package cn.iqnnfa;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import cn.iqnnfa.model.MessageModel;
import cn.iqnnfa.model.MessageResponse;

@Controller
public class MessageSocketController {

	@MessageMapping("/welcome")
	@SendTo("/topic/getResponse")
	public MessageResponse say(MessageModel messageModel) throws Exception{
		Thread.sleep(30000);
		return new MessageResponse("welcome"+messageModel.getMessage()+"!");
	}
}
