package ex03Env;

import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.core.env.MutablePropertySources;
import org.springframework.core.io.support.ResourcePropertySource;

/*
외부 파일을 이용한 설정방법:
	프로젝트를 진행하면서 필요한 설정값이 있을 경우 외부파일에 입력 후 불러와서 사용하는 방법
	예) DB접속정보, 관리자정보 등
*/
public class MainClass1 {

	public static void main(String[] args) {
		
		//1. 스프링 컨텍스트를 생성(Ctrl+t를 누르면 클래스의 상속관계를 알  수 있음)
		ConfigurableApplicationContext ctx = new GenericXmlApplicationContext();
		//2. Environment 객체 생성
		ConfigurableEnvironment env = ctx.getEnvironment();
		//3. PropertySources를 가져옴
		MutablePropertySources propertySources = env.getPropertySources();
		
		try{
			//4. 외부파일인 properties 파일을 가져와서 addLast로 추가함
			propertySources.addLast(new ResourcePropertySource("classpath:adminEx03.properties"));
			//5. getProperty로 해당 데이터를 읽어서 출력함
			System.out.println(env.getProperty("admin.id"));
			System.out.println(env.getProperty("admin.pw"));
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		// 위에서 생성한 ctx 컨텍스트를 통해 새로운  스프링 컨텍스트  생성
		GenericXmlApplicationContext gCtx = (GenericXmlApplicationContext)ctx;
		//컨테이너 설정파일 로드
		gCtx.load("applicationContextEnv01.xml");
		//빈 객체 생성
		gCtx.refresh();
		
		//생성된 빈을 주입받음
		AdminConnection adminConnection = gCtx.getBean("adminConnection", AdminConnection.class);
		System.out.println("admin ID : " + adminConnection.getAdminId());
		System.out.println("admin PW : " + adminConnection.getAdminPw());
		
		gCtx.close();
		ctx.close();
		
	}
}
