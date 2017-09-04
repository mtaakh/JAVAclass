package springBoard.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import springBoard.model.SpringBbsDAO;

public class ModifyActionCommand implements BbsCommand {
	
	@Override
	public void execute(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String idx = req.getParameter("idx");
		String name = req.getParameter("name");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String pass = req.getParameter("pass");
		
		SpringBbsDAO dao = new SpringBbsDAO();
		//dao.modify(idx, name, title, content, pass);
		dao.modifySpJDBC(idx, name, title, content, pass);
		
	}
}
