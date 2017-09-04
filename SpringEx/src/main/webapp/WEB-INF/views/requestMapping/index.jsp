<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index.jsp</title>
<script>
	function searchCheck(){
		var fn = document.searchFrm;
		if(!fn.searchWord.value){
			alert("검색어를 입력하세요.");
			fn.searchWord.focus();
			return false;
		}
	}
	function loginCheck(){
		
	}
	function stuCheck(){
		
	}
</script>
</head>
<body>
	<h2>@RequestMapping</h2>
	
	<h3>검색폼 - GET방식</h3>
	<form action="../requestMapping/getSearch" method="get" name="searchFrm" onsubmit="return searchCheck();">
		<select name="searchColumn">
			<option value="title">제목</option>
			<option value="name">작성자</option>
			<option value="content">내용</option>
		</select>
		<input type="text"  name="searchWord"/>
		<input type="submit"  value="검색하기"/>
	</form>
	
	<%
	//컨텍스트 패스 얻어옴
	String ctxPath = request.getContextPath();
	%>
	<h3>로그인폼 - POST방식</h3>
	<form action="<%=ctxPath %>/requestMapping/postLogin" method="post" name="loginFrm" onsubmit="return loginCheck();">
	<table width="300" border="1">
		<tr>
			<td>아이디</td>
 			<td><input type="text" name="user_id" /></td>
		</tr>
		<tr>
			<td>패스워드</td>
			<td><input type="text" name="user_pw" /></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center;">
			<input type="submit" />로그인</td>
		</tr>
	</table>
	</form>
	
	<h3>@ModelAttribute 어노테이션 사용하기</h3>
	<form action="<%=ctxPath %>/requestMapping/modelAttributeView" method="post" name="studentFrm" onsubmit="return stuCheck();">
		<table width="300" border="1">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" name="age" /></td>
			</tr>
			<tr>
				<td>학년</td>
				<td>
					<select name="gradeNum">
						<option value="1">1학년</option>
						<option value="2">2학년</option>
						<option value="3">3학년</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>반</td>
				<td>
					<input type="radio" name="classNum" value="1" />1반
					<input type="radio" name="classNum" value="2" />2반
					<input type="radio" name="classNum" value="3" />3반
					<input type="radio" name="classNum" value="4" />4반
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center;">
					<input type="submit" value="전송하기" />
				</td>
			</tr>
		</table>
	</form>
	
	
</body>
</html>