<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../../resources/bootstrap-3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="../../resources/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<title>마이 페이지</title>
<link rel="shortcut icon" href="./resources/bootstrap3.3.7/images/D.ico" />
</head>
<body>
	<h1>회원탈퇴</h1>
	<!--
	<table width="770" border="1" cellspacing="0" cellpadding="2" style="text-align:center;">
		<tr style="background-color:#f3f3f3;">
			<th width="25%">게시판 번호</th>
			<th width="25%">답글 번호</th>
			<th width="25%">아이디</th>
			<th width="25%">신고횟수</th>
		</tr>
		<c:choose>
			<c:when test="${empty reportData}">
			<tr>
				<td colspan="9">등록된 글이 음슴</td>
			</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${reportData}" var="report" >
				<tr>
					<td>${report.board_num}</td>
					<td>${report.reply_num}</td>
					<td>${report.id}</td>
					<td>${report.report_count}</td>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	-->
</body>
</html>