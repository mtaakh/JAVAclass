package com.kosmo.SpringEx;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosmo.SpringEx.member.MemberDTO;

@Controller
public class ValidateController {
	
	//회원가입 페이지 매핑
	@RequestMapping("validate/memberForm")
	public String validateMemberForm(){
		return "validate/memberForm";
	}
	
	//폼검증을 위한 메소드 매핑
	/*
	@ModelAttribute : 커멘드 객체의 이름을 임의로 변경 가능
	BindingResult : 폼값을 검증한 후 결과값을 저장하기 위한 객체
	*/
	@RequestMapping("validate/registProc")
	public String validateMemberProc(@ModelAttribute("memberInfo") MemberDTO memberDTO,
									BindingResult result, Model model){
		//가입완료 페이지 요청명
		String page = "validate/memberDone";
		
		//유효성 검증을 위해 정의한 클래스의 객체생성
		MemberValidator validator = new MemberValidator();
		//생성된 객체를 통해 실제 폼값의 유효성 체크를 실시
		//매개변수로 유효성체크를 할 커멘드객체(DTO)와 바인딩 결과 객체를 전달한다.
		validator.validate(memberDTO, result);
		
		//폼값 유효성 검증에서 에러가 발생했다면 -
		if(result.hasErrors()){
			//바인딩 결과 객체를 통해 전달된 에러내용을 문자열로 표시
			System.out.println("유효성 체크 실패"+result.toString());
			//뷰로 전달한 데이터 저장
			model.addAttribute("formError", "폼값 유효성 체크에 실패");
			//실패시 뷰 지정(가입페이지로 다시 이동)
			page = "validate/memberForm";
		}
		
		return page;
	}
	
}
