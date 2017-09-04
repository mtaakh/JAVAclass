package ex02LifeCycle;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

/* 빈 초기화 과정에서 자동으로 호출되는 함수를 정의할때
@PostConstruct 어노테이션을 메소드 선언시 붙여줌
 빈 소멸과정에서 자동으로 호출되는 함수를 정의할때
 @PreDestroy 어노테이션을 메소드 선언시 붙여줌
*/
public class Student {
	
	private String name;
	private int age;
	
	public Student(String name, int age){
		this.name = name;
		this.age = age;
	}
	
	@PostConstruct
	public void myInitMethod(){
		System.out.println("myInitMethod() 메소드 호출(사용자정의)");
	}
	
	@PreDestroy
	public void myDestroyMethod(){
		System.out.println("myDestroyMethod() 메소드 호출(사용자정의)");
	}

	//getter() / setter() 정의
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
	
}
