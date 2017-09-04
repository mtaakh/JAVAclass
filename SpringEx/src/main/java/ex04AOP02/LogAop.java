package ex04AOP02;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;

//공통기능으로 사용할 클래스임을 명시
@Aspect
public class LogAop {
	
	//공통기능이 동작할 범위와 아이디를 지정 
	@Pointcut("within(ex04AOP02.*)")
	private  void pointcutMethod(){}
	
	//공통기능의 아이디로 지정한 실제 메소드
	//핵심기능 전/후/예외발생시 실행하겠다는 어노테이션
	@Around("pointcutMethod()")
	public Object loggerAop(ProceedingJoinPoint jointpoint) throws Throwable{
		String signatureStr = jointpoint.getSignature().toShortString();
		Object obj = null;
		System.out.println(signatureStr + " 실행시작됨");
		long stime = System.currentTimeMillis();
		
		try{
			obj = jointpoint.proceed();
		}
		catch(Exception e){	}
		finally{
			long etime = System.currentTimeMillis();
			System.out.println(signatureStr + " 실행종료");
			System.out.println(signatureStr + " 경과시간: "+(etime - stime));
		}
		return obj;
	}
	
	@Before("within(ex04AOP02.*)")
	public void bgeforeAdvice(){
		System.out.println("beforeAdvice() 메소드 실행");
	}
}
