package cn.iqnnfa.configClass;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class AspectExample {
	
	private static Logger logger = LoggerFactory.getLogger(AspectExample.class);
	
	@Around("execution(* cn.iqnnfa.IndexController.*(..))")
	public void beforeEvent(ProceedingJoinPoint pjp){
		try {
			long start = System.currentTimeMillis();
			pjp.proceed();
			long stop = System.currentTimeMillis();
			
		    logger.info("执行消耗的时间"+(stop-start));
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}
}
