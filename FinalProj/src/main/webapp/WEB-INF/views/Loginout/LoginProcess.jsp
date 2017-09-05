<%@page import="procedures.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- LoginProcess.jsp --%>
<%
	//사용자가 입력한 폼값 받기
	String id = request.getParameter("user_id");
	String pw = request.getParameter("user_pw");
	
	//BbsDAO클래스의 인스턴스를 생성해 DB 연결
	BbsDAO dao = new BbsDAO(application); //클래스 내에서 어플리케이션 객체를 그대로 매개변수로 사용
	boolean isMember = dao.isMember(id, pw);
	dao.close();
	
	if(isMember){ // 회원인증 완료 - 로그인 처리
		session.setAttribute("USER_ID", id);
		session.setAttribute("USER_PWD", pw);
		
		response.sendRedirect("./MyPage.jsp");
	}
	else{ // 비회원 - 다시 로그인페이지로 리다이렉트
		request.setAttribute("ERROR_MSG", "회원이 아니군요!");
		request.getRequestDispatcher("./Login.jsp").forward(request, response);
	}
	
%>