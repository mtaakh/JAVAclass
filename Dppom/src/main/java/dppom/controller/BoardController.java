package dppom.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	
	//=======Review 컨트롤러
	@RequestMapping("Review")
	public String Review(HttpServletRequest req, Model model){
		System.out.println("MajReview()호출");	
		
		return "Board/Review/MajReview";
		
	}
	
	@RequestMapping("LibReview")
	public String LibReview(HttpServletRequest req, Model model){
		System.out.println("LibReview()호출");	
		
		return "Board/Review/LibReview";
		
	}
	
	@RequestMapping("ReviewWrite")
	public String ReviewWrite(HttpServletRequest req, Model model){
		System.out.println("ReviewWrite()호출");	
		
		return "Board/Review/ReviewWrite";
		
	}
	
	@RequestMapping("ReviewView")
	public String ReviewView(HttpServletRequest req, Model model){
		System.out.println("ReviewView()호출");	
		
		return "Board/Review/ReviewView";
	}
	
	@RequestMapping("Party")
	public String PartyList(HttpServletRequest req, Model model){
		System.out.println("PartyList()호출");	
		
		return "Board/Party/PartyList";
	}
	
	@RequestMapping("PartyView")
	public String PartyView(HttpServletRequest req, Model model){
		System.out.println("PartyView()호출");	
		
		return "Board/Party/PartyView";
	}
	
	@RequestMapping("PartyWrite")
	public String PartyWrite(HttpServletRequest req, Model model){
		System.out.println("PartyWrite()호출");	
		
		return "Board/Party/PartyWrite"; 
	}
	
	@RequestMapping("DataView")
	public String DataView(HttpServletRequest req, Model model){
		System.out.println("DataView()호출");	
		
		return "Board/Dataroom/DataView";
	}
	
	@RequestMapping("DataWrite")
	public String DataWrite(HttpServletRequest req, Model model){
		System.out.println("DataWrite()호출");	
		
		return "Board/Dataroom/DataWrite";
	}
	
	
	//========DataRoom 컨트롤러
	@RequestMapping("DataList")
	public String DataList(HttpServletRequest req, Model model){
		System.out.println("DataList()호출");	
		
		return "Board/Dataroom/DataList";
		
	}
	
}
