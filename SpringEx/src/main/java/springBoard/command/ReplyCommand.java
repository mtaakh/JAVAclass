package springBoard.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import springBoard.model.SpringBbsDAO;
import springBoard.model.SpringBbsDTO;

public class ReplyCommand implements BbsCommand {
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		String idx = req.getParameter("idx");
		
		SpringBbsDAO dao = new SpringBbsDAO();
		//SpringBbsDTO dto = dao.reply(idx);
		/*
		reply()를 SpringJDBC를 사용할때는 view()메소드를 사용한다.
		커맨드 객체를 사용하여 처리하기 때문에 DB에서 불러올때는 데이터를 별도로 처리할 수 없기 때문
		*/
		SpringBbsDTO dto = dao.viewSpJDBC(idx);
		//제목처리
		dto.setTitle("[RE]"+ dto.getTitle());
		//내용처리
		dto.setContent("\n\r\n\r---[원본글]---" + dto.getContent());
		
		model.addAttribute("replyRow", dto);
		dao.close();
		
	}
}
