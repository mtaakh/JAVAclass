package springBoard.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import springBoard.model.PagingUtil;
import springBoard.model.SpringBbsDAO;
import springBoard.model.SpringBbsDTO;
import springBoard.model.SpringBbsListDTO;

public class ListCommand implements BbsCommand {
	
	@Override
	public void execute(Model model){
		
		//DAO 연결
		SpringBbsDAO dao = new SpringBbsDAO();
		
		//파라미터 받기
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		//전체 레코드 수 카운트
		//int totalRecordCount = dao.getTotalCount(paramMap);
		int totalRecordCount = dao.getTotalCountSpJDBC(paramMap);
		//페이지 설정값
		int pageSize = 4;
		int blockPage = 2;
		
		//전체 페이지수
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		
		//현재 페이지를 파라미터로 받기
		int nowPage = req.getParameter("nowPage")==null ? 1 : Integer.parseInt(req.getParameter("nowPage"));
		
		//시작 및 끝 rownum 구하기
		int start = (nowPage-1) * pageSize + 1;
		int end = nowPage * pageSize;
		
		//DAO로 넘길 파라미터 조립
		paramMap.put("start", start);
		paramMap.put("end", end);
		paramMap.put("totalPage", totalPage);
		paramMap.put("totalCount", totalRecordCount);
		paramMap.put("pageSize", pageSize);
		
		//페이지 처리를 위한 문자열 생성
		String addQueryStr = "";
		String pagingImg = PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage, req.getContextPath() + "/board/list.do?" + addQueryStr);
		
		//DAO에서 list메소드로 목록 가져오기 
		//ArrayList<SpringBbsDTO> listRows = dao.list(paramMap);
		ArrayList<SpringBbsListDTO> listRows = dao.listSpJDBC(paramMap);
		
		//답변글 들여쓰기 처리(spring JDBC 사용시)
		int virtualNum = 0;
		int countNum = 0;
		
		for(SpringBbsListDTO row : listRows){
			String reSpace = "";
			if(row.getBindent()>0){
				//답변글 들여쓰기
				for(int i=0; i<=row.getBindent(); i++){
					reSpace += "&nbsp;&nbsp;";
				}
				//답변글 아이콘 붙여주기
				row.setTitle(reSpace+"<img src='../my_image/re3.gif'>"+row.getTitle());
			}
			reSpace = "";
			
			//리스트 가상번호
			virtualNum = totalRecordCount - (((nowPage-1)*pageSize)+countNum++);
			row.setrNum(virtualNum);
		}
		
		//페이지 처리를 위한 저장
		model.addAttribute("pagingImg", pagingImg);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("nowPage", nowPage);
		//리스트 레코드를 저장
		model.addAttribute("listRows", listRows);
		dao.close();
		
		System.out.println("ListCommand > execute() 메소드 호출");
		
	}
	
}
