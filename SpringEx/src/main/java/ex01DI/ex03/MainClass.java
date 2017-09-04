package ex01DI.ex03;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class MainClass {

	public static void main(String[] args) {
		
		String configLocation = "classpath:applicationContextEx03.xml";

		//스프링 컨테이너 생성
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		
		//xml 파일에서 생성해서 주입받은 빈을 getBean() 메소드를 통해 가져와서  할당
		MyInfo myInfo = ctx.getBean("myInfo", MyInfo.class);
		//실제 정보를 출력
		myInfo.getInfo();
		//자원해제
		ctx.close();
	}

}
