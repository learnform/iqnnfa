package iqnnfacloud;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@EnableEurekaServer
@RestController
public class springcloudApplictionmain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int i = 1;
		SpringApplication.run(springcloudApplictionmain.class);
	}
	
	

}
