package ex02LifeCycle;

import org.springframework.context.support.GenericXmlApplicationContext;

public class MainClass {
/*
스프링 컨테이너의  생명주기(LifeCycle)
*/	
	public static void main(String[] args){
		
		//1. 스프링 컨테이너 생성
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext();
		
		//2. xml파일을 이용한 스프링 컨테이너 설정
		ctx.load("classpath:applicationContextLifeCycle.xml");
		//생성자를 통해 생성 후 반드시 refresh를 해줘야 설정이 완료됨
		ctx.refresh();
		
		/***** 여기서 빈이 초기화됨 ㅡ construct()메소드 자동호출 *****/
		 
		//3. 스프링 컨테이너 사용(생성된 빈을 주입받아 사용함)
		Student st1 = ctx.getBean("student", Student.class);
		System.out.println("이름 : "+st1.getName());
		System.out.println("나이 : "+st1.getAge());

		Student st2 = ctx.getBean("student", Student.class);
		st2.setName("이순신");
		st2.setAge(100);
		System.out.println("이름 : "+st2.getName());
		System.out.println("나이 : "+st2.getAge());
		
		/* 스프링빈의 사용범위
		 	st1에서 주입받아 사용했던 빈을 st2에서 재사용함
		 	설정파일(xml)에서 미리 생성해놓은 빈을 사용하는 것 ㅡ singleton 객체로 생성하여 재사용함
		*/
		if(st1.equals(st2)){
			System.out.println("st1==st2 동일객체 사용");
		}
		else{
			System.out.println("st1!=st2 다른객체 사용");
		}
		
		//4. 스프링 컨테이너 종료 : 컨테이너가 종료되면 빈은 자동 소멸
		ctx.close();
		
		/***** 여기서 빈이 소멸됨 ㅡ destroy() 메소드 자동호출됨 *****/
	}
	 
}
