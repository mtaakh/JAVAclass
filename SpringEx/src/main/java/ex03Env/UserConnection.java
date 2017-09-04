package ex03Env;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;

public class UserConnection implements InitializingBean, DisposableBean {
	
	private String userId;
	private String userPw;
	private String subUserId;
	private String subUserPw;
	
	@Override
	public void afterPropertiesSet() throws Exception {
		System.out.println("afterPropertiesSet()메소드 호출됨");
	}
	
	@Override
	public void destroy() throws Exception {
		System.out.println("destroy()메소드 호출됨");
		
	}

	
	//getter() / setter() 메소드
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getSubUserId() {
		return subUserId;
	}

	public void setSubUserId(String subUserId) {
		this.subUserId = subUserId;
	}

	public String getSubUserPw() {
		return subUserPw;
	}

	public void setSubUserPw(String subUserPw) {
		this.subUserPw = subUserPw;
	}
	
}
