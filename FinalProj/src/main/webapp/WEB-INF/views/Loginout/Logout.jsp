<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Logout.jsp --%>
<%
	//로그아웃 처리
	//방법1 : 내가 만든 속성명을 이용해 삭제
	session.removeAttribute("USER_ID");
	session.removeAttribute("USER_PWD");
	
	//방법2 : 세션 전체를 무력화시킴
	session.invalidate();
	//로그아웃 처리 후 페이지 이동
	//response.sendRedirect("Login.jsp");
	
%>
<script>
	alert("로그아웃 되었습니다.이용해주셔서 감사합니다.");
	location.href="../Main.jsp";
</script>