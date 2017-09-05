<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- isMember.jsp : 해당 파일은 세션을 확인하여 회원여부를 판단 --%>
<%
	if(session.getAttribute("USER_ID")==null){
		//회원 아님
		out.println("<script>");
		out.println("alert('로그인 후 이용해주세요');");
		out.println("location.href='../Loginout/Login.jsp';");
		out.println("</script>");
		//return이 없으면 자바스크립트보다 아래의 jsp코드가 먼저 실행되어 오류가 생김
		return;
	}
	else{
		//회원임 - 로그인을 한 경우 처리할 부분이 있으면 여기서ㅡ
	}
%>