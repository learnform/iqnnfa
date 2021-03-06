package cn.iqnnfa.interceptor;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import cn.iqnnfa.configClass.Action;


public class AnnotationInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception exception)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object handler) throws Exception {
		 HandlerMethod handlerMethod = (HandlerMethod)handler;
	      Method method = handlerMethod.getMethod();
	      Action annotation = method.getAnnotation(Action.class);
	      if(annotation != null){
	    	  boolean needsave = annotation.needsave();
	    	  if(needsave){
	    		  System.out.println("注解需要");
	    		  return true;
	    	  }
	    	  
	    	 boolean needremove = annotation.needremove();
	    	 if(needremove){
	    		 System.out.println("注解不需要");
	    	 }
	      }
		return true;
	}

}
