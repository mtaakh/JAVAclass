package ex03Env;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;

public class BoardConnection implements InitializingBean, DisposableBean {
	
	String title;
	String content;
	String writer;
	String passwd;
	
	@Override
	public void afterPropertiesSet() throws Exception {
		System.out.println("빈 생성 후 자동호출");
		
	}
	@Override
	public void destroy() throws Exception {
		System.out.println("빈 소멸 후 자동호출");
		
	}
	
	//getter() / setter() 메소드
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
	
}
