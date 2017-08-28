package dppom.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InfoController {
	
	@RequestMapping("SiteInfo")
	public String SiteInfo(Model model, HttpServletRequest req){
		
		return "SiteInfo";
	}
}
