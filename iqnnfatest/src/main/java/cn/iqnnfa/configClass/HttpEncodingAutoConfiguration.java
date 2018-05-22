package cn.iqnnfa.configClass;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.web.filter.OrderedCharacterEncodingFilter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.filter.CharacterEncodingFilter;

import cn.iqnnfa.model.HttpEncodingProperties;

@Configuration
@EnableConfigurationProperties(HttpEncodingProperties.class)
@ConditionalOnClass(CharacterEncodingFilter.class)
@ConditionalOnProperty(prefix="http.encoding",value="enabled",matchIfMissing = true)
public class HttpEncodingAutoConfiguration {

	@Autowired
	private HttpEncodingProperties httpEncodingProperties;
	
	@Bean
	@ConditionalOnMissingBean(CharacterEncodingFilter.class)
	public CharacterEncodingFilter characterEncodingFilter(){
		CharacterEncodingFilter filter = new OrderedCharacterEncodingFilter();
		filter.setEncoding(this.httpEncodingProperties.getCharset().name());
		filter.setForceEncoding(this.httpEncodingProperties.iSForce());
		return filter;
	}
}
