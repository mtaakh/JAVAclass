<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>memberDone.jsp</title>
</head>
<body>
	<h2>유효성 검증 성공 - 회원가입 완료</h2>
	
	<ul>
		<li>아이디 : ${memberInfo.id }</li>
		<li>패스워드 : ${memberInfo.pw }</li>
		<li>이름 : ${memberInfo.name}</li>
	</ul>
</body>
</html>