<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SessionResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>세션 결과 페이지</legend>
		<h2>세션 아이디</h2>
		<%=session.getId() %>
		
		<h2>세션 유효시간 얻기</h2>
		<%=session.getMaxInactiveInterval() %>초
		
		<h2>리퀘스트 영역에 저장된 속성 읽기</h2>
		<%=request.getAttribute("requestScope") %>
		
		<h2>세션 영역에 저장된 속성 읽기</h2>
		<%=session.getAttribute("sessionScope") %>
	</fieldset>
</body>
</html>