package dppom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DppomController 
{
	@RequestMapping("/adminpage/adminHome.do")
	public String adminHome(Model model)
	{
		System.out.println("관리자 페이지 접속");
		
		//return "adminpage/adminHome";
		return "Dppom_admin/main";
	}
	
	@RequestMapping("/adminpage/boardadmin/boardAdmin.do")
	public String boardAdmin(Model model)
	{
		System.out.println("게시글 관리 페이지 접속");
		
		return "adminpage/boardadmin/boardAdmin";
	}
	
	@RequestMapping("/adminpage/memberadmin/memberAdmin.do")
	public String memberAdmin(Model model)
	{
		System.out.println("회원 관리 페이지 접속");
		
		return "adminpage/memberadmin/memberAdmin";
	}
	
	@RequestMapping("/adminpage/recommadmin/recommAdmin.do")
	public String recommAdmin(Model model)
	{
		System.out.println("건의사항 처리 페이지 접속");
		
		return "adminpage/recommadmin/recommAdmin";
	}
	
	@RequestMapping("/adminpage/reportadmin/reportAdmin.do")
	public String reportAdmin(Model model)
	{
		System.out.println("신고내용 처리 페이지 접속");
		
		return "adminpage/reportadmin/reportAdmin";
	}
	
	@RequestMapping("/adminpage/specadmin/specAdmin.do")
	public String specAdmin(Model model)
	{
		System.out.println("어학, 자격증 관리 페이지 접속");
		
		return "adminpage/specadmin/specAdmin";
	}
}
