package dppom.command.qna;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import dppom.model.qna.QnADAO;
import dppom.model.qna.QnADTO;

public class QnACommand 
{
	public void execute(Model model)
	{
		QnADAO dao = new QnADAO();
		
		Map<String, Object> map = model.asMap();
		
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		List<QnADTO> recommData = dao.selectAll(map);
		
		model.addAttribute("recommData", recommData);
		
		dao.close();
	}
}
