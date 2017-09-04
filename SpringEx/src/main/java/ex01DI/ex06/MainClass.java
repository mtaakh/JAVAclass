package ex01DI.ex06;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class MainClass {

	/*
	xml 설정파일을 사용하지 않고 java파일만을 사용하는 방법
	*/
	public static void main(String[] args) {
		
		AnnotationConfigApplicationContext aCtx = new AnnotationConfigApplicationContext(ApplicationConfig.class);
		
		Student std1 = aCtx.getBean("student1", Student.class);
		System.out.println("이름 : "+ std1.getName());
		System.out.println("나이 : "+ std1.getAge());
		System.out.println("취미 : "+ std1.getHobbys());
		System.out.println("신장 : "+ std1.getHeight());
		System.out.println("몸무게 : "+ std1.getWeight());

		Student std2 = aCtx.getBean("student2", Student.class);
		System.out.println("이름 : "+ std2.getName());
		System.out.println("나이 : "+ std2.getAge());
		System.out.println("취미 : "+ std2.getHobbys());
		System.out.println("신장 : "+ std2.getHeight());
		System.out.println("몸무게 : "+ std2.getWeight());
		
	}

}
