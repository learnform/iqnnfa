package iqnnfacloud2;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@EnableEurekaClient
@RestController
public class springcloud2Applictionmain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SpringApplication.run(springcloud2Applictionmain.class);
        System.out.println("ssss");
        System.out.println("改了代码");
        System.out.println("我不知道A修改了代码，直接提交");
	}
	
    @Value("${server.port}")
    String port;
    @RequestMapping("/hi")
    public String home(@RequestParam String name) {
        return "hi "+name+",i am from port:" +port;
    }
}
