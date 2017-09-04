package dppom.command.party;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import dppom.model.party.PartyDAO;

public class DeleteActionCommand implements PartyCommand {
	
	@Override
	public void execute(Model model) {

		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");

		String idx = req.getParameter("idx");

		PartyDAO dao = new PartyDAO();
		dao.deleteSpJDBC(idx);
		
	}
	
}
