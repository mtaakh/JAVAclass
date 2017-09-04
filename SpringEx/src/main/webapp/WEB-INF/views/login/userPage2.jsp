<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>userPage2.jsp</title>
</head>
<body>
	<h2>사용자 페이지2</h2>
	
	<h3>Session을 사용 안하는 페이지</h3>
	
	<ul>
		<li>세션아이디/이름 : <b>${sessionScope.siteUserLogin.id }/${sessionScope.siteUserLogin.name }</b></li>
		<li>페이지 지시어 < %@ page session="false" %> 선언함</li>
	</ul>
	
	<button onclick="history.go(-1);">뒤로가기</button>
</body>
</html>