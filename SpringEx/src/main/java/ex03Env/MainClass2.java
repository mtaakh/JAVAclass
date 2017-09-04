package ex03Env;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

/*
외부파일 참조2
Environment 객체를 사용하지 않고 XML 파일에 프로퍼티 파일을 명시한 후 직접 생성하여 빈을 설정하는 방법
*/
public class MainClass2 {

	public static void main(String[] args) {
		
		//xml 설정파일을 기반으로 스프링 컨테이너 생성
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:applicationContextEnv02.xml");
		//빈을 주입받음
		UserConnection conn = ctx.getBean("userConnection", UserConnection.class);
		
		System.out.println("userId : "+ conn.getUserId());
		System.out.println("userPw : "+ conn.getUserPw());
		System.out.println("subUserId : "+ conn.getSubUserId());
		System.out.println("subUserPw : "+ conn.getSubUserPw());
		
		ctx.close();
	}

}
