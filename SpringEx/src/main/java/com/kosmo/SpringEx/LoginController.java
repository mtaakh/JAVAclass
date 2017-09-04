package com.kosmo.SpringEx;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ex07Login.IUser;
import ex07Login.UserDTO;

@Controller
public class LoginController {
	
	//마이바티스 사용(slqSession 은 servlet-context.xml에서 생성된 빈을 자동으로 주입받음)
	@Autowired
	private SqlSession sqlSession;
	
	//로그인 화면
	@RequestMapping("/login/login.html")
	public String login(){
		return "login/login";
	}
	
	//로그아웃 화면
	@RequestMapping("/login/logout.html")
	public String logout(HttpSession session){
		//세션 영역을 비워줌
		session.setAttribute("siteUserLogin", null);
		return "redirect:login.html";
	}
	
	//로그인처리
	@RequestMapping(value="/login/loginProcess.html", method=RequestMethod.POST)
	public ModelAndView loginProcess(HttpSession session, HttpServletRequest req){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/login/login");
		//ModelAndView에서 리다이렉트
		/*mav.setViewName("redirect:login.html");*/
		
		//DB처리
		IUser ui = sqlSession.getMapper(IUser.class);
		UserDTO dto = ui.loginProcess(req.getParameter("userId"), req.getParameter("userPass"));
		
		//세션으로 로그인 처리
		if(dto != null){
			//회원인증에 성공 - 세션영역에 dto객체 저장
			session.setAttribute("siteUserLogin", dto);
		}
		else{
			//회원인증 실패 - ModelAndView로 속성 저장
			mav.addObject("LoginNG", "아이디 또는 패스워드가 틀렸습니다.");
		}
		
		return mav;
	}
	
	//사용자페이지1 - 세션 사용함
	@RequestMapping("/login/userPage1.html")
	public String userPage1(){
		return "login/userPage1";
	}

	//사용자페이지2 - 세션 사용 안함
	@RequestMapping("/login/userPage2.html")
	public String userPage2(){
		return "login/userPage2";
	}
	
}
