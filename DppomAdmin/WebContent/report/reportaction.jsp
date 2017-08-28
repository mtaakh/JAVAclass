<%@page import="ReportModel.ReportDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idx = request.getParameter("idx");

	ReportDAO dao = new ReportDAO();
	
	dao.delete(idx);
	
	dao.close();
%>
<script>
	location.href='reportadmin.jsp';
</script>