package springBoard.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import springBoard.model.SpringBbsDAO;
import springBoard.model.SpringBbsDTO;

public class ViewCommand implements BbsCommand {
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		String idx = req.getParameter("idx");
		SpringBbsDAO dao = new SpringBbsDAO();
		//SpringBbsDTO dto = dao.view(idx);
		SpringBbsDTO dto = dao.viewSpJDBC(idx);
		
		//상세보기 줄바꿈처리
		dto.setContent(dto.getContent().replace("\r\n", "<br />"));
		
		model.addAttribute("viewRow", dto);
		dao.close();
	}
	
}
