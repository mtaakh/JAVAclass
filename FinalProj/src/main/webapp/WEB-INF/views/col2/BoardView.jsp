<%@page import="procedures.showgdDTO"%>
<%@page import="procedures.showgdDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//글번호(키값) 받기
	String num = request.getParameter("num");
	//페이지 번호 받기
	String nowPage = (request.getParameter("nowPage")==null) ? "1" : request.getParameter("nowPage");
	//DAO 객체생성
	showgdDAO dao = new showgdDAO(application);
	//키값을 이용해 해당 레코드 하나 얻어오기
	showgdDTO dto = dao.selectThis(num);
	
	//조회수 증가시키기
	dao.updateVisitCountS(num);
	
	//자원반납
	dao.close();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BoardListGD.jsp</title>
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
				<%@ include file="../pageground/LayoutLeft2.jsp" %>
			</div>
			<div class="contents">
			<div class="cont1">
				<br />
				<fieldset>
					<legend>게시판 글보기</legend>
					<table class="table table-bordered" width="770" border="1" cellspacing="0" cellpadding="2">
						<tr>
							<td width="20%">번호</td>
							<td width="30%">
								<%=dto.getIdx() %>
							</td>
							<td width="20%">작성자</td>
							<td width="30%">
								<%=dto.getId() %>
							</td>
						</tr>
						<tr>
							<td width="20%">작성일</td>
							<td width="30%">
								<%=dto.getPostdate() %>
							</td>
							<td width="20%">조회수</td>
							<td width="30%">
								<%=dto.getVisitcount() %>
							</td>
						</tr>
						<tr>
							<td width="20%">제목</td>
							<td colspan="3" style="height:30px;">
								<%=dto.getTitle() %>
							</td>
						</tr>
						<tr>
							<td>내용</td>
							<td colspan="3">
								<a href="<%=dto.getContent().replace("\r\n","<br/>") %>">보러가기 ㄱㄱ</a>
							</td>
						</tr>
						<tr>
							<td colspan="4" style="text-align:center;">
								<button class="btn-warning" type="button" onclick="location.href='showGD.jsp';">목록보기</button>
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