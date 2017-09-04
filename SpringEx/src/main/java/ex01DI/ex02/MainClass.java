package ex01DI.ex02;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

/*
Spring 스타일로 구현
*/
public class MainClass {

	public static void main(String[] args) {
	
		//applicationContext.xml 파일의 위치를 문자열에 저장
		//실제 위치는 resource 폴더 하위
		String configLocation = "classpath:applicationContextEx02.xml";
		
		//스프링 컨테이너 생성 : xml파일을 파싱하여 파싱된 내용을 기반으로 ctx 참조변수에 할당
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		
		//xml 파일에서 생성한 빈을 getBean() 메소드를 통해 가져와서  할당
		MyCalculator myCal = ctx.getBean("myCal", MyCalculator.class);
	
		//메소드 실행
		myCal.add();
		myCal.sub();
		myCal.mul();
		myCal.div();
		
	}
		
}
