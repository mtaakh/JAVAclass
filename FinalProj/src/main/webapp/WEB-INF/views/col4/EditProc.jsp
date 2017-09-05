<%@page import="procedures.BbsDAO"%>
<%@page import="procedures.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- EditProc.jsp --%>
    <%@ include file="../Loginout/isMember.jsp" %>
<%-- WriteProc.jsp --%>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");

	//파라미터 받기
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String num = request.getParameter("num");
	
	//페이지 번호 받기
	String nowPage = request.getParameter("nowPage");
	
	//데이터를 전달할 DTO 객체 생성 및 데이터 설정
	BbsDTO dto = new BbsDTO();
	dto.setTitle(title);
	dto.setContent(content);
	dto.setNum(num);
	
	//DAO 객체 생성하여 업데이트
	BbsDAO dao = new BbsDAO(application);
	int affected = dao.update(dto);
	dao.close();
	if(affected==1){
		response.sendRedirect("BoardView.jsp?num="+num+"&nowPage="+nowPage);
	}
	else{
		
%>
	<script>
		alert("수정 실패 - 로그인 시간이 만료되었습니다.");
		history.back(); //history.go(-1); 와 동일한 기능
	</script>
<%
}
%>