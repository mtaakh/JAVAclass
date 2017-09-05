<%@page import="java.util.HashMap"%>
<%@page import="procedures.SuggestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- DeleteProc.jsp --%>
<%@ include file="../Loginout/isMember.jsp" %>
<%
	//게시물의 일련번호 num, 현재페이지번호 nowPage
	String num = request.getParameter("num");
	int nowPage = Integer.parseInt(request.getParameter("nowPage"));
	
	//게시물 삭제를 위한 DAO 객체 생성
	SuggestDAO dao = new SuggestDAO(application);
	//DAO 객체의 delete메소드 호출(게시물삭제)
	int affected = dao.delete(num);
	
	//게시물 삭제후 전체 게시물 수 얻기
	int totalRecord = dao.getTotalRecordCount(new HashMap());
	int pageSize = Integer.parseInt(application.getInitParameter("PAGE_SIZE"));
	//게시물 삭제 후 페이지 수 계산하기
	int totalPage = (int)Math.ceil((double)totalRecord/pageSize);
	//파라미터로 넘어온 페이지와 현재페이지를비교
	if(nowPage-1 == totalPage){
		nowPage--;
	}
	dao.close(); // 자원반납
	
	if(affected==1){
		response.sendRedirect("Suggest.jsp?nowPage="+nowPage);
%>
alert("글이 삭제되었습니다.");
<% 
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