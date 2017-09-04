package ex03Env;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

/*
외부파일 참조3

어노테이션을 이용한 외부파일 참조.
xml 설정파일 대신 ApplicationConfig 클래스파일을 이용하여 외부파일 참조와 빈 생성
*/
public class MainClass3 {

	public static void main(String[] args) {
		
		//스프링 컨테이너 생성(어노테이션 기반)
		AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(ApplicationConfig.class);
		//설정파일에서 생성한 빈을 주입
		BoardConnection con = ctx.getBean("boardConfig", BoardConnection.class);
		
		//빈 사용
		System.out.println("Title: "+ con.getTitle());
		System.out.println("Content: "+ con.getContent());
		System.out.println("Writer: "+ con.getWriter());
		System.out.println("Passwd: "+ con.getPasswd());
		//컨테이너 소멸
		ctx.close();
	}

}
