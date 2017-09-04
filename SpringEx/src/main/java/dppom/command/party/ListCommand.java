package dppom.command.party;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import dppom.model.party.PagingUtil;
import dppom.model.party.PartyDAO;
import dppom.model.party.PartyDTO;
import dppom.model.study.StudyDTO;

public class ListCommand implements PartyCommand {
	
	@Override
	public void execute(Model model){
		
		//DAO 연결
		PartyDAO dao = new PartyDAO();
		
		//파라미터 받기
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		paramMap.put("searchColumn", req.getParameter("searchColumn"));
		paramMap.put("searchWord", req.getParameter("searchWord"));
		int totalRecordCount = dao.getTotalCount(paramMap);
		//페이지 설정값
		int pageSize = 10;
		int blockPage = 5;
		
		//전체 페이지수
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		
		//현재 페이지를 파라미터로 받기
		int nowPage = req.getParameter("nowPage")==null ? 1 : Integer.parseInt(req.getParameter("nowPage"));
		
		//시작 및 끝 rownum 구하기
		int start = (nowPage-1) * pageSize + 1;
		int end = nowPage * pageSize;
		String searchColumn = null;
		String searchWord = null;
		if(paramMap.get("searchWord") != null)
		{
			searchColumn = paramMap.get("searchColumn").toString();
			searchWord = paramMap.get("searchWord").toString();
		}
		
		//DAO로 넘길 파라미터 조립
		paramMap.put("start", start);
		paramMap.put("end", end);
		paramMap.put("totalPage", totalPage);
		paramMap.put("nowPage", nowPage);
		paramMap.put("totalCount", totalRecordCount);
		paramMap.put("pageSize", pageSize);
		
		//페이지 처리를 위한 문자열 생성
		String addQueryStr = "";
		String pagingImg = PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage, req.getContextPath() + "/board/list.do?" + addQueryStr);
		
		//DAO에서 list메소드로 목록 가져오기 		int virtualNum = 0; // 리스트 가상번호
		int virtualNum = 0; // 리스트 가상번호
		int countNum = 0; // 카운트하기 위한 변수
		
		List<PartyDTO> listRows = dao.selectAll(paramMap);
		
		for(PartyDTO row : listRows)
		{
			virtualNum = totalRecordCount - (((nowPage - 1) * pageSize) + countNum++);
			row.setrNum(virtualNum);
		}
		
		
		//페이지 처리를 위한 저장
		model.addAttribute("pagingImg", pagingImg);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("nowPage", nowPage);
		//리스트 레코드를 저장
		model.addAttribute("listRows", listRows);
		dao.close();
		
		System.out.println("PartyCommand > execute() 메소드 호출");
		
	}
	
}
