package command.board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import springBoard.model.SpringBbsDAO;

public class ReplyActionCommand implements BbsCommand {
	
	@Override
	public void execute(Model model) {

		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		String name = req.getParameter("name");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String pass = req.getParameter("pass");
		
		String bgroup = req.getParameter("bgroup");
		String bstep = req.getParameter("bstep");
		String bindent = req.getParameter("bindent");

		SpringBbsDAO dao = new SpringBbsDAO();
		//dao.reply(name, title, content, pass, bgroup, bstep, bindent);
		dao.replySpJDBC(name, title, content, pass, bgroup, bstep, bindent);
		
	}
	
}
