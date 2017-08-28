<%@page import="StudyModel.studyDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>

<%@page import="java.util.Map"%>
<%@page import="StudyModel.studyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%

studyDAO dao = new studyDAO();
String idx = request.getParameter("idx");
String Page = request.getParameter("Page");
System.out.println("Page:"+Page);

int result = dao.delete(idx);

if(result ==1){
	response.sendRedirect(Page);
}
else{
	%>
	
	
<script>
alert("삭제실패");
history.back();
</script>
	
	<%}


%>
</html>

