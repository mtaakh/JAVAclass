package ex04AOP01;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class MainClass {
/*
AOP(Aspect Oriented Programming) : 관점 지향 프로그래밍

AOP의 용어
- aspect : 공통기능
- advice : aspect의 기능 그 자체를 의미함. 공통기능의 세부적인 내용
- Jointpoint : 핵심기능에 advice를 적용해야 하는 부분(예: 멤버변수, 메소드 등) 스프링에서는 메소드에만 공통기능을 적용할수 있음 
- pointcut : jointpoint 의 부분으로, 실제 advice가 적용된 부분
- weaving : advice를 핵심기능에 적용하는 행위 


AOP의 구현순서
1. pom.xml 파일에 의존설정을 한다. (SpringEx/pom.xml에서 설정. dependency엘리먼트 하위에 아래 부분을 추가한다.)
<!-- AOP를 위한 의존 설정 -->
		<dependency>
			<groupId>org.aspectj</groupId>
			<artifactId>aspectjweaver</artifactId>
			<version>1.7.4</version>
		</dependency>
		저장하면 스프링 프레임워크는 관련 라이브러리를 자동으로 다운로드한다.
		
2. 공통 기능을 수행할 클래스 제작(Advice 역할 클래스)

3. applicationContext.xml 설정파일에 aspect 설정
	3-1. AOP 네임스페이스 추가
	3-2. <aop:config> 엘리먼트로 AOP 설정
	3-3. 빈을 생성후 주입

4. Main 클래스에서 빈을 주입받은 후 사용
5. close() 로 컨테이너 소멸

XML 기반의 AOP 구현 예제
*/
	public static void main(String[] args) {
		//스프링 컨테이너 생성 후 설정파일 로드
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:applicationContextAOP1.xml"); 
		
		//빈을 주입받음
		Student student = ctx.getBean("student", Student.class);
		student.getStudentInfo();
		
		Worker worker = ctx.getBean("worker", Worker.class);
		worker.getWorkerInfo();
		
		//컨테이너 소멸
		ctx.close();
	}

}
