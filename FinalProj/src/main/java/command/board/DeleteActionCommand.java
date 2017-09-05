package command.board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import models.BbsDAO;


public class DeleteActionCommand implements BbsCommand {
	
	@Override
	public void execute(Model model) {

		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");

		String idx = req.getParameter("idx");

		BbsDAO dao = new BbsDAO();
		dao.delete(idx);
		
	}
	
}
