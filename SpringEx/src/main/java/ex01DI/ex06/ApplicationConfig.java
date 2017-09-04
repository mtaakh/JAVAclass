package ex01DI.ex06;

import java.util.ArrayList;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

// @Configuration : 해당 클래스를 스프링 설정파일로 사용하겠다는 선언
@Configuration
public class ApplicationConfig {

	// @Bean : 설정 파일에서 빈을 생성할 때 선언. 해당 빈은 메인클래스로 주입된다.
	@Bean
	public Student student1(){
		
		ArrayList<String> hobbys = new ArrayList<String>();
		hobbys.add("삽질");
		hobbys.add("땅파기");
		
		//생성자 메소드를 사용하여 설정
		Student st1 = new Student("홍길동", 30, hobbys);
		//프로퍼티에 설정
		st1.setHeight(182);
		st1.setWeight(77);
		
		//생성된 빈을 반환
		return st1;
	}
	
	@Bean
	public Student student2(){
		
		ArrayList<String> hobbys = new ArrayList<String>();
		hobbys.add("거울보기");
		hobbys.add("드라마감상");
		
		Student st2 = new Student("박길동", 50, hobbys);
		st2.setHeight(160);
		st2.setWeight(50);
		
		return st2;
	}
	
	
}
