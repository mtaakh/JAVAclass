package com.kosmo.SpringEx;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.SpringEx.member.MemberDTO;

/* @Controller 어노테이션으로 컨트롤러 클래스임을 지정함 */
@Controller
public class FormController {
	
	//요청명을 매핑하는 어노테이션(매핑정보)
	@RequestMapping("/form/servletRequest")
	//HttpServletRequest : 폼 데이터를 전송받을때 사용
	//Model : 뷰로 데이터를 전송할때 사용
	public String loginMember(HttpServletRequest req, Model model){
		
		//쿼리스트링으로 전달된 파라미터를 받아서 저장
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		//뷰로 전송할 데이터를 모델에 저장
		model.addAttribute("id", id);
		model.addAttribute("pw", pw);
		model.addAttribute("message", "로그인 정보가 전달되었습니다.");
		
		//뷰 페이지 리턴
		return "form/servletRequest";
		
		//servlet-context.xml에서 설정된 대로
		// "/WEB-INF/Views" + "리턴문자열" + ".jsp" 형태로 뷰를 찾아감
	}
	
	/*
	사용법 : @RequestParam("파라미터명") 변수타입 변수명
		메소드 내에서 변수명을 그대로 사용할 수 있다.
		※주의 : 쿼리스트링에 해당 파라미터가 없으면 400error 가 발생함
	*/
	@RequestMapping("/form/requestParam")
	public String joinMember(@RequestParam("name") String name,	@RequestParam("id") String id, 
							@RequestParam("pw") String pw, @RequestParam("email") String email, Model model)
	{
		MemberDTO member = new MemberDTO();
		
		member.setName(name);;
		member.setId(id);
		member.setPw(pw);
		member.setEmail(email);
		
		model.addAttribute("memberInfo", member);
		
		return "form/requestParam";
	}
	
	/*
	커맨드 객체를 이용해서 폼값 한번에 받기
	조건1 : 쿼리스트링으로 전달되는 파라미터와 DTO 객체의 멤버변수의 갯수와 순서가 동일해야함 
	※코드 양이 적으므로 실무에서 많이 사용됨
	*/
	@RequestMapping("/form/simpleGet")
	public String simpleGet(MemberDTO memberDTO, Model model){
		
		return "form/simpleGet";
	}
	
	/*
	@PathVariable : 어노테이션 요청명 자체를 파라미터로 사용하는 형태. 즉, form/뒤에 붙는 값은 메소드에서 바로 사용가능한 파라미터가 됨
	*/
	@RequestMapping("/form/{studentId}")
	public String getStudent(@PathVariable String studentId, Model model){
		
		return "form/studentView";
	}
}
