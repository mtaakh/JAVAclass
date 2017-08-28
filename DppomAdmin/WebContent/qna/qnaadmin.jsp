<%@page import="QnAModel.QnADTO"%>
<%@page import="QnAModel.QnADAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");

	String category = request.getParameter("category");

	QnADAO dao = new QnADAO();

	Map<String, Object> map = new HashMap<String, Object>();

	List<QnADTO> qnaData = dao.selectAll(map);

	dao.close();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/layout/head.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../bootstrap-3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>관리자 페이지</title>
<script>
	function change(frm) {
		location.href = 'qnaadmin.jsp?category=' + frm;
	}
</script>
</head>
<body>
	<header role="banner" id="fh5co-header"> <!--  TOP ( 메뉴 )  -->
	<%@ include file="/layout/LayoutTop2.jsp"%> <!-- TOP (E) -->
	</header>

	<div id="fh5co-about-us" data-section="about">
		<div class="container">
			<!-- My Page(메뉴) -->
			<%@ include file="/layout/LayoutAdminPage.jsp"%>
			<!-- My Page(메뉴) E  -->
			<br />
			<br />
			<div class="row row-bottom-padded-lg" id="about-us">
				<div class="col-md-12 section-heading text-center">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 to-animate">
							<h3>사용자 피드백(건의사항/탈퇴) 게시판 관리</h3>
						</div>
					</div>
				</div>
				<div class="col-md-12 to-animate">
				<select name="category" onchange="change(this.value);">
							<option value="all" <%if(category.equals("all")){ %>selected<%} %>>모두보기</option>
							<option value="false" <%if(category.equals("false")){ %>selected<%} %>>답변안한 건의사항 보기</option>
						</select>
					<div class="text-center">
						
						<table class="table table-bordered" width="770" border="1"
							cellspacing="0" cellpadding="2"
							>
							<tr style="background-color: #f3f3f3;">
								<th width="10%">아이디</th>
								<th width="20%">등록날짜</th>
								<th width="20%">제목</th>
								<th width="30%">내용</th>
								<th width="10%">답변유무</th>
								<th width="10%">&nbsp;</th>
							</tr>
							<%
								if (qnaData.isEmpty()) {
							%>
							<tr>
								<td colspan="9">등록된 글이 음슴</td>
							</tr>
							<%
								} else {
									for (QnADTO dto : qnaData) {
										if (category.equals("all")) {
							%>
							<form action="./qnaview.jsp" method="post">
								<input type="hidden" name="idx" value="<%=dto.getIdx()%>" /> 
								<input type="hidden" name="id" value="<%=dto.getId()%>" /> 
								<input type="hidden" name="regidate" value="<%=dto.getRegidate()%>" />
								<input type="hidden" name="title" value="<%=dto.getTitle()%>" />
								<input type="hidden" name="content" value="<%=dto.getContent()%>" /> 
								<input type="hidden"name="reply_flag" value="<%=dto.getReply_flag()%>" /> 
								<input type="hidden" name="reply" value="<%=dto.getReply()%>" /> 
								<input type="hidden" name="reply_date" value="<%=dto.getReply_date()%>" />
								<tr>
									<td><%=dto.getId()%></td>
									<td><%=dto.getRegidate()%></td>
									<td><%=dto.getTitle()%></td>
									<td><%=dto.getContent()%></td>
									<td><%=dto.getReply_flag()%></td>
									<td><button>이동</button></td>
								</tr>
							</form>
							<%
								} else if (dto.getReply_flag().equals("X")) {
							%>
							<form action="./qnaview.jsp" method="post">
								<input type="hidden" name="idx" value="<%=dto.getIdx()%>" /> 
								<input type="hidden" name="id" value="<%=dto.getId()%>" /> 
								<input type="hidden" name="regi_date" value="<%=dto.getRegidate()%>" />
								<input type="hidden" name="title" value="<%=dto.getTitle()%>" />
								<input type="hidden" name="content" value="<%=dto.getContent()%>" /> 
								<input type="hidden" name="reply_flag" value="<%=dto.getReply_flag()%>" /> 
								<input type="hidden" name="reply" value="<%=dto.getReply()%>" />
								<tr>
									<td><%=dto.getId()%></td>
									<td><%=dto.getRegidate()%></td>
									<td><%=dto.getTitle()%></td>
									<td><%=dto.getContent()%></td>
									<td><%=dto.getReply_flag()%></td>
									<td><button>이동</button></td>
								</tr>
							</form>
							<%}}} %>
						</table>
					</div>
				</div>
			</div>
		</div>
		<br />
		<br />
		<!-- Botton (S) -->
		<%@ include file="/layout/LayoutBottom.jsp"%>
		<!--  Bottom(E) -->
	</div>
</body>
</html>