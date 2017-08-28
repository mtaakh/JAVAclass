package dppom.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

//건의사항 컨트롤러 

@Controller
public class QnAController {

	//건의사항
	 @RequestMapping("QnA")
	 public String TeamBoard(Model model, HttpServletRequest req){
		 
		 //데이터 처리
		 
		 return "QnA/QnA";
		 
	 }
}
