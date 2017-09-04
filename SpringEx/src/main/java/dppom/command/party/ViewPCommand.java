package dppom.command.party;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import dppom.model.party.PartyDAO;
import dppom.model.party.PartyDTO;

public class ViewPCommand implements PartyCommand {
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		String idx = req.getParameter("idx");
		PartyDAO dao = new PartyDAO();

		PartyDTO dto = dao.viewSpJDBC(idx);
		
		//상세보기 줄바꿈처리
		dto.setContent(dto.getContent().replace("\r\n", "<br />"));

		List<PartyDTO> listRows = dao.selectAll(paramMap);

		model.addAttribute("listRows", listRows);
		dao.close();
	}
	
}
