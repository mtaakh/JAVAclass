package ex01DI.ex05;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
/*
DI의 장점
  작은 규모의 프로젝트에서는 스프링의 DI를 사용하는 것이 낭비일 수 있지만, 
  대규모 프로젝트에서는 유지보수 업무를 좀더 간편하게 할 수 있는 방법론을 제시함
  여러 클래스(컨트롤러)가 있을때 xml의 설정만으로 java코드의 변경 없이 사용할 수 있다는 강점이 있다.
*/
public class MainClass {
	
	public static void main(String[] args){
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:applicationContextEx05.xml");
		
		Pencil pen = ctx.getBean("pencil", Pencil.class);
		pen.used();
		
		ctx.close();
		
	}
}
