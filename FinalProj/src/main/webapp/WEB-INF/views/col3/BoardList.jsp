<%@page import="procedures.PagingUtil"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="procedures.BbsDTO"%>
<%@page import="java.util.List"%>
<%@page import="procedures.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");

	//검색 기능 구현
	String searchColumn = request.getParameter("searchColumn");
	String searchWord = request.getParameter("searchWord");
	
	// 전체목록 가져오기
	BbsDAO dao = new BbsDAO(application);
	Map<String,Object> parammap = new HashMap<String, Object>();

	//검색 후 페이징과 관련된 파라미터를 전달할 값을 저장할 변수
	String addQueryString = "";
	
	//검색기능 추가
	if(searchColumn!=null){
		//페이지 수 계산을 위한 파라미터 생성
		addQueryString = String.format("searchColumn=%s&searchWord=%s&", searchColumn, searchWord);
		
		//map타입의 컬렉션에 아래 키에 해당하는 항목 추가
		parammap.put("COLUMN", searchColumn);
		parammap.put("WORD", searchWord);
	}
	
	//페이징을 위한 로직 시작
	int totalRecordCount = dao.getTotalRecordCount(parammap);
	int pageSize = Integer.parseInt(application.getInitParameter("PAGE_SIZE"));
	int blockPage = Integer.parseInt(application.getInitParameter("BLOCK_PAGE"));
	int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
System.out.println("전체 레코드 수 : "+totalRecordCount);
System.out.println("전체 페이지 수 : "+totalPage);


int nowPage = request.getParameter("nowPage")==null ? 
		1 : Integer.parseInt(request.getParameter("nowPage"));
	
	//초기상태는 무조건 1, 페이지번호를 눌렀을 경우 해당페이지번호 출력
	int start = (nowPage-1) * pageSize + 1; //
	int end = nowPage*pageSize;
	
	parammap.put("start", start);
	parammap.put("end", end);
	//페이징을 위한 로직 끝
	
	
	
	//게시판 전체 목록 가져오기
	List<BbsDTO> bbs = dao.selectAllB(parammap);

	//자원반납
	dao.close();
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="with=device-width, initial-scale=1" />
<link rel="stylesheet" href="./bootstrap3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="./bootstrap3.3.7/js/bootstrap.min.js"></script>
<title>BoardList.jsp</title>
<link rel="stylesheet" href="../pageground/divLayout.css" />
</head>
<body>
	
	<div class="allWrap">
	<!-- 로고 / GNB가 나오는 부분 -->
		<div class="header">
			<%@ include file="../pageground/LayoutTop.jsp" %>
		</div>
		
		<!-- LNB / Contents가 나오는 부분 -->
		<div class="body">
			<div class="leftmenu">
				<%@ include file="../pageground/LayoutLeft3.jsp" %>
			</div>
			<div class="contents">
			<div class="cont1">
				<br />
				<fieldset>
					<legend>회원제 게시판 목록(현재페이지/전체페이지)</legend>
					<table>
						<tr>
							<td align="right">
							<button onclick="javascript:location.href='BoardWrite.jsp';">글쓰기</button>
							</td>
						</tr>
					</table>
					
					<!-- 게시판 목록 시작 -->
					<table class="table table-bordered table-hover table-striped" width="770" border="1" cellspacing="0" cellpadding="2">
						<tr style="text-align:center; background-color:#f3f3f3;">
							<th width="10%">번호</th>
							<th width="50%">제목</th>
							<th width="15%">작성자</th>
							<th width="10%">조회수</th>
							<th width="15%">작성일</th>
						</tr>
						<%
						if(bbs.isEmpty()){
						%>
						<tr>
							<td colspan="5" style="height:100px;">등록된 글이 없습니다.</td>
						</tr>
						<% } else { 
							int vNum = 0;
							int countNum = 0;
							for(BbsDTO dto : bbs){
								
								vNum = totalRecordCount - (((nowPage-1)*pageSize) + countNum++);
								
						%>
						
						<tr>
							<td style="text-align:center;"><%=vNum %></td>
							<td><a href="BoardView.jsp?num=<%=dto.getNum() %>"><%=dto.getTitle() %></a></td>
							<td style="text-align:center;"><%=dto.getId() %></td>
							<td style="text-align:center;"><%=dto.getVisitcount() %></td>
							<td style="text-align:center;"><%=dto.getPostdate() %></td>
						</tr>
						
						<% }
						} %>
						
					</table>
					<!-- 게시판 목록끝 -->
					
					<!-- 페이징 -->
					<table width="770">
						<tr>
							<td style="text-align:center;">
							<%=PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage,
											
									"BoardList.jsp?"+addQueryString) %>
							</td>
						</tr>
					</table>
					<!-- 검색 -->
					<form method="get">
					<input type="hidden" name="nowPage" value="1" />
					<table width="100%">
						<tr style="text-align:center;">
							<td>
								<select name="searchColumn">
									<option value="title">제목</option>
									<option value="name">작성자</option>
									<option value="content">내용</option>
								</select>
								<input type="text" name="searchWord" />
								<input type="submit" value="검색하기" />
							</td>
						</tr>
					</table>
					
					</form>
				</fieldset>
				<br />
			</div>
			</div>
		</div>
		
		<!-- 회사 정보 등Copyright 나오는 부분 -->
		<div class="bottom">
				<%@ include file="../pageground/LayoutBottom.jsp" %>
		</div>
	</div>
</body>
</html>