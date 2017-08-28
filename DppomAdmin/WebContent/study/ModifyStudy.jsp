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
//파라미터 
String idx = request.getParameter("idx");
String Page = request.getParameter("Page");

studyDAO dao = new studyDAO();
studyDTO dto = dao.selectOne(idx);

dao.close();
%>
<body>
<h2> 수정 화면- 관리자 페이지</h2>
<a href="${param.Page }">리스트 돌아가기</a>
<form name="ModifyStudyFrm" action="./ModifyProc.jsp" >
<input type="hidden" name="Page" value=${param.Page } />
<table border="1px  black">
<tr>
	<td>

	<% 
		
		if(Page.contains("EnglishStudy.jsp")){
			
	%>
	<input type="text" name="menu" value="English"/>
	<select name="category">
		<option value="">===</option>
		<option value="TOEIC" 
		 <% if(dto.getCategory().equals("TOEIC")){ %> selected <%} %>
		>TOEIC</option>
		<option value="ToeicSpeaking" <% if(dto.getCategory().equals("ToeicSpeaking")){ %> selected <%} %>  >TOEIC Speaking</option>
		<option value="TOEFL" <% if(dto.getCategory().equals("TOEFL")){ %> selected <%} %>  >TOEFL</option>
		<option value="OPIC"  <% if(dto.getCategory().equals("OPIC")){ %> selected <%} %> >OPIC</option>
		</select>
	<%}
		
	else if(Page.contains("LicenseStudy.jsp")){%>
	<input type="text" name="menu" value="License"/>
	<select name="category">
		<option value="">===</option>
		<option value="컴활" <% if(dto.getCategory().equals("컴활")){ %> selected <%} %> >컴활</option>
		<option value="한국사"  <% if(dto.getCategory().equals("한국사")){ %> selected <%} %>>한국사</option>
		<option value="GTQ" <% if(dto.getCategory().equals("GTQ")){ %> selected <%} %> >GTQ</option>
		<option value="MOS" <% if(dto.getCategory().equals("MOS")){ %> selected <%} %> >MOS</option>
	</select>
		<%} %>
	
	</td>
	<td>제목 <input type="text" name="title" value="<%=dto.getTitle()%>"/></td>
</tr>
<tr>
	<td>내용</td>
	<td><textarea name="contents" cols="30" rows="10"><%=dto.getContents() %></textarea></td>
</tr>
<tr><td colspan="2">URL <input type="text" name="url" style="width:90%" value="<%=dto.getUrl()%>"/></td></tr>
<tr><td colspan="2">썸네일<input type="text" name="thumbimg" style="width:85%" value="<%=dto.getThumbimg()%>"/></td></tr>
</table>
<input type="submit" value="수정"  onclick="" style="margin-left:180px"/> <!-- return writeChk(); -->
<input type="button" value="취소"  onclick="history.back()" /> <!-- return writeChk(); -->
</form>
</body>
</html>