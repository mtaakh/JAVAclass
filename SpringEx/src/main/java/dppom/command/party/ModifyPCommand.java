package dppom.command.party;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import dppom.model.party.PartyDAO;
import dppom.model.party.PartyDTO;

public class ModifyPCommand implements PartyCommand {
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		String idx = req.getParameter("idx");
		PartyDAO dao = new PartyDAO();
		//SpringBbsDTO dto = dao.view(idx);
		PartyDTO dto = dao.viewSpJDBC(idx);
		
		model.addAttribute("viewRow", dto);
		dao.close();
	}
	
}
