package ex03Env;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.EnvironmentAware;
import org.springframework.core.env.Environment;

/* 외부 파일을 불러와서 사용해야 할 경우 EnvironmentAware 인터페이스를 구현하고, 반드시 setEnvironment() 메소드를 오버라이딩 해야함  
해당 메소드는 빈이 생성되기 전에 호출됨
*/
public class AdminConnection 
		implements EnvironmentAware, InitializingBean, DisposableBean 
{
	
	//멤버변수
	private Environment env;
	private String adminId;
	private String adminPw;
	
	/*
	빈이 생성되기 전에 먼저 호출되는 메소드. 즉 최초로 호출됨
	Environment 객체는 한 어플리케이션에 하나만 존재하므로 이미 생성된 객체를 가져와서 설정하게 됨
	*/
	@Override
	public void setEnvironment(Environment env){
		System.out.println("setEnvironment() 메소드가 호출되었습니다.");
		setEnv(env);
		
	}
	
	@Override
	public void afterPropertiesSet() throws Exception {
		System.out.println("afterPropertiesSet() 메소드가 호출되었습니다.");
		setAdminId(env.getProperty("admin.id"));
		setAdminPw(env.getProperty("admin.pw"));
		
	}
	
	@Override
	public void destroy() throws Exception {
		System.out.println("destroy() 메소드가 호출되었습니다.");
		
	}

	//getter() , setter() 메소드
	public Environment getEnv() {
		return env;
	}

	public void setEnv(Environment env) {
		this.env = env;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminPw() {
		return adminPw;
	}

	public void setAdminPw(String adminPw) {
		this.adminPw = adminPw;
	}
	
	
	
}
