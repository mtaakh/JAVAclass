<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>simpleGet.jsp</title>
</head>
<body>
	<h2>Form데이터 받기</h2>
	
	<h3>DTO 객체로 폼값 한번에 받기</h3>
	
	<ul>
		<li>이름 : ${memberDTO.name }</li>
		<li>아이디 : ${memberDTO.id }</li>
		<li>패스워드 : ${memberDTO.pw }</li>
		<li>이메일 : ${memberDTO.email }</li>
	</ul>
</body>
</html>