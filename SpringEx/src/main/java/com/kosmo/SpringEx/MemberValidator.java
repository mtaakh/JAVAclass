package com.kosmo.SpringEx;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.kosmo.SpringEx.member.MemberDTO;

/*
유효성 검증을 위한 클래스 정의를 위해 Validator 인터페이스를 구현한다.
그리고 supports(), validate() 메소드를 반드시 오버라이딩 해야한다.
*/
public class MemberValidator implements Validator {
	/*
	supports() 메소드
		매개변수에 전달된 객체가 유효성 검증을 지원할 수 있는 커맨드 객체인지 아닌지를 판단하는 메소드.
		만약 이 메소드를 통과하지 못하면 실제 유효성 검사를 하는 validate() 메소드가 호출되지 않는다.
	*/
	@Override
	public boolean supports(Class<?> clazz) {
		//isAssignableFrom : 커맨드 객체가 FormCommand타입이거나 FormCommand를 상속받은 자식타입이라면 true 반환 / 아니면 false
		return MemberDTO.class.isAssignableFrom(clazz);
	}
	
	/*
	supports() 메소드에서 true 반환시에만 호출됨
	첫번째 매개변수 : 커맨드객체
	두번째 매개변수 : 에러정보를 저장할 Errors 타입(BindingResult타입)
	 ㅡ> 개발자가 컨트롤러 메소드에서 호출함
	*/
	@Override
	public void validate(Object obj, Errors errors) {
		
		System.out.println("validate() 메소드 호출됨");
		MemberDTO memberDTO = (MemberDTO)obj;
		
		//아이디 검증
		String member_id = memberDTO.getId();
		if(member_id==null || member_id.trim().isEmpty()){
			System.out.println("아이디가 null입니다,,,");
			errors.rejectValue("id", "idError");
		}
		
		//패스워드 검증
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pw", "pwError");
		
		//이름 검증
		boolean nameValidate = myEmptyOrWhitespace(memberDTO.getName());
		if(nameValidate==false){
			System.out.println("이름이  null입니다.");
			errors.rejectValue("name", "nameError");
		}
	}
	
	public boolean myEmptyOrWhitespace(String value){
		if(value==null || value.trim().length()==0){
			return false;
		}
		else{
		return true;
		}
	}
}
