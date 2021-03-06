package cn.iqnnfa;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URI;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.UrlResource;
import org.springframework.util.Assert;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class Resource implements Validator{
	
	public static void main(String[] args){
		try {
			UrlResource urlResource = new UrlResource("http://img.zcool.cn/community/01aa63554967860000019ae9a79b0f.jpg");
			//sString filename = urlResource.getFilename();
			//File file = urlResource.getFile();
			OutputStream out = new FileOutputStream("D://j.jpg");
			InputStream in = urlResource.getInputStream();
			int count = 0;
			byte[] length = new byte[1204];
			while((count = in.read(length)) !=-1){
				out.write(length,0,count);
			}
			in.close();
			out.close();
			boolean exists = urlResource.exists();
			String description = urlResource.getDescription();
			System.out.println(description+"..."+exists);
			fileSystemResource();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void fileSystemResource(){
		FileSystemResource systemResource = new FileSystemResource("D://j.jpg");
		Assert.notNull(systemResource, "systemResource is not null");
		try {
			URI uri = systemResource.getURI();
			OutputStream out = new FileOutputStream("F://测试图片.jpg");
			String filename = systemResource.getFilename();
			InputStream in = systemResource.getInputStream();
			int count = 0;
			byte[] length = new byte[1204];
			while((count = in.read(length)) !=-1){
				out.write(length,0,count);
			}
			in.close();
			out.close();
			System.out.println(uri +"____"+filename);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		
	}
	
}
