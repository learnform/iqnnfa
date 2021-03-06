package cn.iqnnfa.model;

import java.nio.charset.Charset;

import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix="http.encoding")
public class HttpEncodingProperties {
	
	private static final Charset CHARSET_NAME=Charset.forName("UTF-8");
	
	private Charset charset = CHARSET_NAME;
	
	private boolean force = true;

	public Charset getCharset() {
		return charset;
	}

	public void setCharset(Charset charset) {
		this.charset = charset;
	}

	public boolean iSForce(){
		return this.force;
	}
	
	public void setForce(boolean force){
		this.force = force;
	}
}
