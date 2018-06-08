package iqnnfacloudC1;

import org.springframework.web.client.RestTemplate;

import com.netflix.hystrix.HystrixCommand;

public class DrMemberCommand extends HystrixCommand<DrMember>{
	
	private RestTemplate restTemplate;
	private Long id;
	protected DrMemberCommand(Setter setter,RestTemplate restTemplate,Long id) {
		super(setter);
		this.restTemplate = restTemplate;
		this.id = id;
	}

	@Override
	protected DrMember run() throws Exception {
		return restTemplate.getForObject("http://service-gg/hi?id=" + id, DrMember.class,id);
	}

}