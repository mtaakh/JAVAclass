<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SessionIndex.jsp</title>
</head>
<body>
	<fieldset>
		<legend>session(HttpSession 타입) 객체의 주요 메소드</legend>
		<ul style="list-style-type:upper-roman;">
		<li></li>
		<li>세션 유효시간 설정(web.xml : 분단위)</li>
		<!-- 아래와 같이 설정
		  	<session-config>
			<session-timeout>60</session-timeout>
		  	</session-config>
		-->
		<li>세션 유효시간 설정(메소드 : 초단위)</li>
		<%
			session.setMaxInactiveInterval(3600); // 1시간(60초*60분)
		%>
		<li>세션아이디: 
		<a href="SessionResult.jsp"><%=session.getId() %></a>
		</li>
		<%
		//세션의 최초 생성시간
		long createTime = session.getCreationTime();
		SimpleDateFormat simple = new SimpleDateFormat("HH:mm:ss");
		String creationTimeString = simple.format(new Date(createTime));
		//클라이언트의 마지막 요청시간
		long lastTime = session.getLastAccessedTime();
		String lastTimeString = simple.format(new Date(lastTime));
		%>
		<li>세션의 최초 요청시간 : <%=creationTimeString %></li>
		<li>마지막 요청 시간 : <%=lastTimeString %></li>
		</ul>
		
		<h2>세션 및 리퀘스트 영역에 속성 저장</h2>
		<%
			request.setAttribute("requestScope", "리퀘스트 영역임");
			session.setAttribute("sessionScope", "세션 영역임");
		%>
	</fieldset>
</body>
</html>