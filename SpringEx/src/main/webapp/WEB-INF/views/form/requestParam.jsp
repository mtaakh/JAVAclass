<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>requestParam.jsp</title>
</head>
<body>
	<h2>Form 데이터 받기</h2>
	
	<h3>@RequestParam으로 파라미터 받기</h3>
	
	<ul>
		<li>이름 : ${memberInfo.name }</li>
		<li>아이디 : ${memberInfo.id }</li>
		<li>패스워드 : ${memberInfo.pw }</li>
		<li>이메일 : ${memberInfo.email }</li>
	</ul>
</body>
</html>