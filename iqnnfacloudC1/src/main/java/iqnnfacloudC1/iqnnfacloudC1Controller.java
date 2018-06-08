package iqnnfacloudC1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class iqnnfacloudC1Controller {
	@Autowired
    HelloService helloService;
    @RequestMapping(value = "/hi")
    public String hi(@RequestParam String name){
        return helloService.hiService(name);
    }
    
    @RequestMapping(value = "/DrMemberCommand")
    @ResponseBody
    public DrMember DrMemberCommand(@RequestParam Long id){
        return helloService.getDrMemberById(id);
    }
}