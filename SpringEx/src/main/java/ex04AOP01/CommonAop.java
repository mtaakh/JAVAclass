package ex04AOP01;

import org.aspectj.lang.ProceedingJoinPoint;

/* 공통기능을 수행할 클래스 정의 */
public class CommonAop {
	
	public Object logViewAOP(ProceedingJoinPoint Jointpoint) throws Throwable{
		
		String joinSignStr = Jointpoint.getSignature().toShortString();
		
		System.out.println("핵심기능 " + joinSignStr+" 실행전");
		long sTime = System.currentTimeMillis();
		
		Object obj = null;
		try{ // 핵심기능을 실행(proxy라고 표현함)
			obj = Jointpoint.proceed();
		}
		catch(Exception e){ //around로 지정시 공통기능 수행부분(예외발생시)
			e.printStackTrace();
		}
		finally{
			long eTime = System.currentTimeMillis();
			System.out.println("핵심기능 "+joinSignStr+" 실행후");
			
			System.out.println(joinSignStr + "가 실행된 경과시간: "+(eTime-sTime));
			System.out.println();
		}
		
		return obj;
	}
}
