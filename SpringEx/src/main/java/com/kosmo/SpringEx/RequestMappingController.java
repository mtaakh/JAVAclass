package com.kosmo.SpringEx;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.SpringEx.member.StudentDTO;

@Controller

public class RequestMappingController {
	
	/* 
	method를 명시하지 않으면 GET방식이 됨(디폴트)
	단순한 시작페이지 매핑
	 */
	@RequestMapping("/requestMapping/index")
	public String rmIndex(){
		
		return "requestMapping/index";
	}
	
	/*
	@RequestMapping 어노테이션을 통한 메핑시 요청명은 value 속성을 사용하고 
		전송방식은 method를 사용한다.(RequestMethod.GET 혹은 RequestMethod.POST)
	즉, 요청명과 전송방식이 만족되어야 호출되는 방식
	*/
	@RequestMapping(method=RequestMethod.GET, value="/requestMapping/getSearch")
	public String formSearch(HttpServletRequest req, Model model){
		System.out.println("RequestMethod.GET 방식");
		
		//
		String searchColumn = req.getParameter("searchColumn");
		String searchWord = req.getParameter("searchWord");
		System.out.println("검색필드: "+ searchColumn + ", 검색어: "+ searchWord);
		
		model.addAttribute("searchColumn", searchColumn);
		model.addAttribute("searchWord", searchWord);
		
		return "requestMapping/getSearch";
	}
	
	/*
	@RequestMapping 어노테이션을 통한 매핑 : Post 방식으로 폼값이 전송될때 사용함
	*/
	@RequestMapping(method=RequestMethod.POST, value="requestMapping/postLogin")
	public ModelAndView formSearch(HttpServletRequest req){
		
		System.out.println("RequestMethod.POST 방식");
		
		String user_id = req.getParameter("user_id");
		String user_pw = req.getParameter("user_pw");
		System.out.println("아이디: "+ user_id +", 패스워드: "+ user_pw);
		
		//ModelAndView()는 뷰로 전송할 데이터의 저장과 뷰를 호출하는 2가지 로직을 동시에 처리할 수 있다.
		ModelAndView mv = new ModelAndView();
		mv.setViewName("requestMapping/postLogin");
		mv.addObject("user_id", user_id);
		mv.addObject("user_pw", user_pw);
		
		return mv;
	}
	
	/*
	@ModelAttribute 어노테이션 : 뷰로 전달되는 커멘드 객체의 이름을 임의로 변경할 수 있음
	*/
	@RequestMapping("/requestMapping/modelAttributeView")
	public String studentView(@ModelAttribute("sInfo") StudentDTO studentDTO){
		return "requestMapping/modelAttributeView";
	}
}
