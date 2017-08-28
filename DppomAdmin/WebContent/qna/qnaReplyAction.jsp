<%@page import="QnAModel.QnADAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String reply = request.getParameter("reply");
	String idx = request.getParameter("idx");

	QnADAO dao = new QnADAO();
	
	dao.changeFlag(idx, reply);
	
	dao.close();
%>
<script>
	location.href='qnaadmin.jsp?category=all';
</script>
