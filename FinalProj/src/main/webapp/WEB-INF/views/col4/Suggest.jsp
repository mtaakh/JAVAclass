<%@page import="procedures.PagingUtilSug"%>
<%@page import="procedures.SuggestDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="procedures.SuggestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");

	//검색 기능 구현
	String searchColumn = request.getParameter("searchColumn");
	String searchWord = request.getParameter("searchWord");
	
	// 전체목록 가져오기
	SuggestDAO dao = new SuggestDAO(application);
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
	int pageSize = 10;
	int blockPage = 5;
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
	List<SuggestDTO> sug = dao.selectAll(parammap);

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
<title>Suggest</title>
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
				<%@ include file="../pageground/LayoutLeft4.jsp" %>
			</div>
			<div class="contents">
			<div class="cont1">
				<br />
				<fieldset>
					<legend>건의사항</legend>
					
					<div class="row" style="text-align:right; padding-right:15px;">
						<form action="" class="form-inline" name="searchFrm" method="get" onsubmit="return searchFrmChk();">
							<div class="form-group">
								<select name="searchColumn" class="form-control">
									<option value="">제목</option>
									<option value="">작성자</option>
									<option value="">내용</option>
								</select>
							</div>
							<div class="input-group">
								<input type="text" name="" class="form-control" placeholder="검색어입력" />
								<div class="input-group-btn">
									<button class="btn btn-default" type="submit">
										<i class="glyphicon glyphicon-search"></i>
									</button>
								</div>
							</div>
						</form>
					</div>
					<!-- 게시판 목록 시작 -->
					<table width="770" border="1" cellspacing="0" cellpadding="2" 
						class="table table-bordered table-hover table-striped">
						<tr style="text-align:center; background-color:#f3f3f3;">
							<th width="10%">번호</th>
							<th width="50%">제목</th>
							<th width="15%">작성자</th>
							<th width="10%">조회수</th>
							<th width="15%">작성일</th>
						</tr>
						<%
						if(sug.isEmpty()){
						%>
						<tr>
							<td colspan="5" style="height:100px;">등록된 글이 없습니다.</td>
						</tr>
						<% } else { 
							int vNum = 0;
							int countNum = 0;
							for(SuggestDTO dto : sug){
								
								vNum = totalRecordCount - (((nowPage-1)*pageSize) + countNum++);
						%>
						
						<tr>
							<td style="text-align:center;"><%=vNum %></td>
							<td><a href="./BoardView.jsp?num=<%=dto.getNum() %>"><%=dto.getTitle() %></a></td>
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
							<%=PagingUtilSug.pagingImg(totalRecordCount, pageSize, blockPage, nowPage,
											
									"Suggest.jsp?"+addQueryString) %>
							</td>
						</tr>
					</table>
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