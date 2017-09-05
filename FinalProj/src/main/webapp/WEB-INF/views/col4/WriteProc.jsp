<%@page import="procedures.BbsDAO"%>
<%@page import="procedures.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- 글작성(&수정&삭제)이 완료된 시점에 세션이 살아있는지 반드시 확인해야 함 --%>
    <%@ include file="../Loginout/isMember.jsp" %>
<%-- WriteProc.jsp --%>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
	//파라미터 받기
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	//데이터를 전달할 DTO 객체 생성 및 데이터 저장
	BbsDTO dto = new BbsDTO();
	dto.setTitle(title);
	dto.setContent(content);
	dto.setId(session.getAttribute("USER_ID").toString());
	
	//DAO 객체 생성후 값 전달
	BbsDAO dao = new BbsDAO(application);
	int affected = dao.insert(dto);
	dao.close();
	if(affected==1){
		response.sendRedirect("BoardList.jsp");
	}
	else{
		
%>
	<script>
		alert("입력실패 - 로그인 시간이 만료되었습니다.");
		history.go(-1);
	</script>
<%
}
%>