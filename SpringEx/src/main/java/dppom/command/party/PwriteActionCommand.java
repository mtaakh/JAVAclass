package dppom.command.party;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import dppom.model.party.PartyDAO;

public class PwriteActionCommand implements PartyCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");

		String id = req.getParameter("id");
		String univ = req.getParameter("univ");
		String major = req.getParameter("major");
		String board_type = req.getParameter("board_type");
		String category = req.getParameter("category");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		int click_cnt = Integer.parseInt(req.getParameter("click_cnt"));
		int like_cnt = Integer.parseInt(req.getParameter("like_cnt"));
		int report_cnt = Integer.parseInt(req.getParameter("report_cnt"));
		int now_party = Integer.parseInt(req.getParameter("now_party"));
		int total_party = Integer.parseInt(req.getParameter("total_party"));
		
		PartyDAO dao = new PartyDAO();
		dao.write( id,  univ,  major,  board_type,  category,  title,
				 content, click_cnt, like_cnt, report_cnt, now_party, total_party);
		
	}
}
