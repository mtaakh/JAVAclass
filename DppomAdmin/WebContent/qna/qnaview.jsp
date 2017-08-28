<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String reply_flag = request.getParameter("reply_flag");
	
	String reply = request.getParameter("reply");
	
	String reply_date = request.getParameter("reply_date");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../bootstrap-3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="../bootstrap-3.3.7/js/bootstrap.min.js"></script>
<title>관리자 페이지</title>
<script>
	function really()
	{
		var check = confirm('답변 등록을 완료하시겠습니까?');
		return check;
	}
</script>
</head>
<body>
	<h1>건의사항 상세보기</h1>
	<form action="./replyAction.jsp" onsubmit="return really();">
		<input type="hidden" name="idx" value="${param.idx}"/>
		<table>
			<tr>
				<td colspan="2">아이디 : ${param.id}</td>
				<td>등록일 : ${param.regidate}</td>
			</tr>
			<% if (reply_flag.equals("O")){ %>
					<tr>
						<td>제목 : ${param.title}</td>
						<td>답변유무 : ${param.reply_flag}</td>
						<td>답변날짜 : ${param.reply_date}</td>
					</tr>
			<%}else{ %>
					<tr>
						<td colspan="2">제목 : ${param.title}</td>
						<td>답변유무 : ${param.reply_flag}</td>
					</tr>
			<%} %>
			<tr>
				<td colspan="3">문의사항 : ${param.content}</td>
			</tr>
		<%if(reply.equals("null")){ %>
			<tr>
				<td colspan="3"><textarea name="reply" cols="30" rows="10">내용을 입력해주세요</textarea></td>
			</tr>
			<tr>
				<td colspan="3"><input type="submit" value="답변완료"/></td>
			</tr>
		<%}else{ %>
			<tr>
				<td colspan="3">답변내용 : ${param.reply}</td>
			</tr>
		<%} %>
		</table>
	</form>
</body>
</html>