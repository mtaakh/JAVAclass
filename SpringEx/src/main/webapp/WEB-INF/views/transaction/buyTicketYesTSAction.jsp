<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>buyTicketYesTSAction.do</title>
</head>
<body>
	<h2>트랜젝션</h2>
	
	<h3>트랜젝션 처리없이 티켓 구매결과</h3>
	
	<ul>
		<li>고객아이디: ${ticketinfo.consumerid }</li>
		<li>티켓수: ${ticketinfo.amount }</li>
	</ul>
	
	<p>
		<a href="./buyTicketYesTS.do">구매페이지 바로가기(트랜젝션O)</a>
	</p>
	
</body>
</html>