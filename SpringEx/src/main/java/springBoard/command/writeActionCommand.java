package springBoard.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import springBoard.model.SpringBbsDAO;

public class writeActionCommand implements BbsCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		String name = req.getParameter("name");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String pass = req.getParameter("pass");
		
		SpringBbsDAO dao = new SpringBbsDAO();
		dao.write(name, title, content, pass);
		
	}
}
