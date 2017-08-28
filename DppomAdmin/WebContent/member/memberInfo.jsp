<%@page import="MemberModel.memberDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="MemberModel.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

	memberDAO dao = new memberDAO();
	String id = request.getParameter("id"); //선택한 id 받아오기

	//회원 한명 가져오기
	memberDTO dto = dao.selectOne(id);
	dao.close();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>memberInfo</title>
</head>
<body>
	<table border="1">
		<tr>
			<td rowspan="2"><img src="" alt="이미지" /></td>
			<td><%=dto.getId() %></td>
		</tr>
		<tr>
			<td><%=dto.getName() %></td>
		</tr>
		<tr>
			<td rowspan="2"><%=dto.getEmail() %></td>
			<td><%=dto.getUniv() %></td>
		</tr>
		<tr>
			<td><%=dto.getMajor() %></td>
		</tr>
		<tr>
			<td><a href="./memberPointInfo.jsp?id=<%=dto.getId()%>">종합 포인트 : <%=dto.getPoint() %></a></td>
			<td><%=dto.getRegidate() %></td>
		</tr>
		<tr>
			<td><a href="./memberBoardInfo.jsp?id=<%=dto.getId()%>">게시판 내역</a></td>
			<td><%=dto.getPhone() %></td>
		</tr>
	</table>
</body>
</html>