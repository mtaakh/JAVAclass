package springBoard.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import springBoard.model.SpringBbsDAO;
import springBoard.model.SpringBbsDTO;

public class ModifyCommand implements BbsCommand {
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		String idx = req.getParameter("idx");
		SpringBbsDAO dao = new SpringBbsDAO();
		//SpringBbsDTO dto = dao.view(idx);
		SpringBbsDTO dto = dao.viewSpJDBC(idx);
		
		model.addAttribute("viewRow", dto);
		dao.close();
	}
	
}
