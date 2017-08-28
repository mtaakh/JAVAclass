package dppom.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosmo.Dppom.Constant;


// 어학/자격증 컨트롤러 
@Controller
public class StudyController {

	
	//Spring JDBC를 사용하기 위한 설정 
	//JDBC템플릿 설정
	private JdbcTemplate template;
	//setter설정
	@Autowired
	public void setTemplate(JdbcTemplate template){
		this.template = template;
		Constant.template = this.template;
	}
	
	//어학/자격증
	 @RequestMapping("/Study")
	 public String study(Model model, HttpServletRequest req){
		 
		 //데이터 처리
		 
		 return "Study/Study";
		 
	 }
}