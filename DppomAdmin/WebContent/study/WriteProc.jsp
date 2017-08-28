<%@page import="StudyModel.studyDTO"%>
<%@page import="StudyModel.studyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WriteProc.jsp</title>
<%
//한글처리
request.setCharacterEncoding("UTF-8");

String Page = request.getParameter("Page");
System.out.println("Page:"+Page);

//폼값 파라미터 전달받기
String menu = request.getParameter("menu");
String category = request.getParameter("category");
String title = request.getParameter("title");
String contents = request.getParameter("contents");
String url = request.getParameter("url");
String thumbimg = request.getParameter("thumbimg");

//데이터를 전달할 DTO객체 생성 및 데이터 저장
studyDTO dto = new studyDTO();
dto.setMenu(menu);
dto.setCategory(category);
dto.setTitle(title);
dto.setContents(contents);
dto.setUrl(url);
dto.setThumbimg(thumbimg);


//DAO객체 생성후 값 전달
studyDAO dao = new studyDAO();
int affected = dao.write(dto);
dao.close();
if(affected==1){
			
	response.sendRedirect(Page);
}
else{
%>
	<script>
		alert("입력실패");
		history.go(-1);
	</script>	
<%
	}
%>