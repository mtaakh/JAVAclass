package dppom.command.party;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import dppom.model.party.PartyDAO;

public class ModifyActionPCommand implements PartyCommand {
	
	@Override
	public void execute(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String idx = req.getParameter("idx");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String pass = req.getParameter("pass");
		int now_party = Integer.parseInt(req.getParameter("now_party"));
		int total_party = Integer.parseInt(req.getParameter("total_party"));
		
		PartyDAO dao = new PartyDAO();
		//dao.modify(idx, name, title, content, pass);
		dao.modifySpJDBC(idx, title, content, now_party, total_party);
		
	}
}
