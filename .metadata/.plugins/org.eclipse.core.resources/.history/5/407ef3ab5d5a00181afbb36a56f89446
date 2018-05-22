package cn.iqnnfa.configClass;

import java.io.IOException;
import java.nio.charset.Charset;

import org.springframework.http.HttpInputMessage;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.MediaType;
import org.springframework.http.converter.AbstractHttpMessageConverter;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.http.converter.HttpMessageNotWritableException;
import org.springframework.util.StreamUtils;

public class MyMessageConverter extends AbstractHttpMessageConverter<String>{
	
	public MyMessageConverter() {
		super(new MediaType("application","x-iqnnfa",Charset.forName("UTF-8")));
	}
	@Override
	protected String readInternal(Class<? extends String> arg0, HttpInputMessage arg1)
			throws IOException, HttpMessageNotReadableException {
		String temp = StreamUtils.copyToString(arg1.getBody(), Charset.forName("UTF-8"));
		String[] tempArr = temp.split("-");
		return null;
	}

	@Override
	protected boolean supports(Class<?> arg0) {
		return false;
	}

	@Override
	protected void writeInternal(String arg0, HttpOutputMessage arg1)
			throws IOException, HttpMessageNotWritableException {
		
	}

}
