<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
	function writeChk(){
		var f = document.WriteStudyFrm;
	
		if(f.menu.value==""){
			alert('분야를 선택하세요.');
			f.menu.focus();
			return false;
		}
		if(f.category.value==""){
			alert('종류를 선택하세요');
			f.category.focus();
			return false;
		}
		if(f.title.value==""){
			alert("제목을 입력하세요.");
			f.title.focus();
			return false;
		}
		if(f.contents.value==""){
			alert("내용을 입력하세요.");
			f.content.focus();
			return false;
		}
		if(f.url.value==""){
			alert("url를  입력하세요.");
			f.URI.focus();
			return false;
		}
		if(f.thumbimg.value==""){
			alert("썸네일 이미지를 입력하세요.");
			f.thumbimg.focus();
			return false;
		}
	}
	
	function chkMenu(){
		
	}
</script>
<body>
<h2>게시글 작성</h2>
<%
//String Page = request.getParameter("Page");
%>
<a href="./StudyList.jsp">리스트 돌아가기</a>
<form name="WriteStudyFrm" action="./WriteProc.jsp" >
<input type="hidden" name="Page" value=${param.Page } />
<table border="1px  black">
<tr>
	<td>

	<%  String Page = request.getParameter("Page");
		if(Page.equals("EnglishStudy.jsp")){
	%>
	<input type="text" name="menu" value="English"/>
	<select name="category">
		<option value="">===</option>
		<option value="TOEIC" >TOEIC</option>
		<option value="ToeicSpeaking" >TOEIC Speaking</option>
		<option value="TOEFL" >TOEFL</option>
		<option value="OPIC" >OPIC</option>
		</select>
	<%}
		
	else if(Page.equals("LicenseStudy.jsp")){%>
	<input type="text" name="menu" value="License"/>
	<select name="category">
		<option value="">===</option>
		<option value="컴활" >컴활</option>
		<option value="한국사" >한국사</option>
		<option value="GTQ" >GTQ</option>
		<option value="MOS" >MOS</option>
		</select>
	<%} else{%>
		<select name="category">
		<option value="">===</option>
		<option value="TOEIC" >TOEIC</option>
		<option value="ToeicSpeaking" >TOEIC Speaking</option>
		<option value="TOEFL" >TOEFL</option>
		<option value="OPIC" >OPIC</option>
		<option value="">===</option>
		<option value="컴활" >컴활</option>
		<option value="한국사" >한국사</option>
		<option value="GTQ" >GTQ</option>
		<option value="MOS" >MOS</option>
		</select>
	
	<%} %>		
	
	</td>
	<td>제목 <input type="text" name="title" /></td>
</tr>
<tr>
	<td>내용</td>
	<td><textarea name="contents" cols="30" rows="10"></textarea></td>
</tr>
<tr><td colspan="2">URI <input type="text" name="url" style="width:90%" /></td></tr>
<tr><td colspan="2">썸네일<input type="text" name="thumbimg" style="width:85%"/></td></tr>
</table>
<input type="submit" value="작성"  onclick="" style="margin-left:180px"/> <!-- return writeChk(); -->
</form>
</body>
</html>