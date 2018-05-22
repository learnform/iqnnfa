package iqnnfacloud2;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@EnableEurekaClient
@RestController
public class springcloud2Applictionmain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SpringApplication.run(springcloud2Applictionmain.class);
	}
	
	

}
