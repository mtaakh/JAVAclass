package ex02LifeCycle;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;

/*
빈 초기화 과정에서 수행해야 할 작업이 있다면 InitializingBean 인터페이스를 구현한다.
이때 반드시 afterPropertiesSet()메소드를 오버라이딩 해야한다.

빈 소멸 과정에서 수행해야 할 작업이 있다면 DisposableBean 인터페이스를 구현 후에
반드시 destroy()메소드를 오버라이딩 해야한다.
*/
public class OtherStudent implements InitializingBean, DisposableBean {
	
	private String name;
	private int age;
	
	public OtherStudent(String name, int age){
		this.name = name;
		this.age = age;
	}
	
	@Override
	public void afterPropertiesSet() throws Exception{
		System.out.println("afterPropertiesSet() 메소드 호출됨");
	}

	@Override
	public void destroy() throws Exception{
		System.out.println("destroy() 메소드 호출됨");
	}
	
	//getter() / setter() 메소드
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