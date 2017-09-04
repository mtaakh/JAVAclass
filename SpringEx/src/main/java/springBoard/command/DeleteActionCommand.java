package springBoard.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import springBoard.model.SpringBbsDAO;

public class DeleteActionCommand implements BbsCommand {
	
	@Override
	public void execute(Model model) {

		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");

		String idx = req.getParameter("idx");

		SpringBbsDAO dao = new SpringBbsDAO();
		//dao.delete(idx);
		dao.deleteSpJDBC(idx);
		
	}
	
}
