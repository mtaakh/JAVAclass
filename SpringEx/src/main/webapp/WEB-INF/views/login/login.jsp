<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<c:choose>
		<c:when test="${not empty sessionScope.siteUserLogin}">
			
			<!-- 로그인 후 디자인s -->
			<h2>로그인 성공</h2>
			<table border="1" width="500" cellpadding="10" cellspacing="1">
				<tr>
					<td width="200">회원아이디</td>
					<td width="300">${sessionScope.siteUserLogin.id }</td>
				</tr>
				<tr>
					<td>회원이름</td>
					<td>${sessionScope.siteUserLogin.name }</td>
				</tr>
				<tr>
					<td>가입일</td>
					<td>${sessionScope.siteUserLogin.regidate }</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="로그아웃" onclick="location.href='./logout.html';" />
						&nbsp;&nbsp;
						<input type="button" value="사용자페이지1" onclick="location.href='userPage1.html';" />
						&nbsp;&nbsp;
						<input type="button" value="사용자페이지2" onclick="location.href='userPage2.html';" />
					</td>
				</tr>
			</table>
			<!-- 로그인 후 디자인e -->
		</c:when>
		<c:otherwise>
					
			<!-- 로그인 전 디자인s -->
			<h2>로그인</h2>
			<span style="color:red; font-size:1.3em;">${LoginNG}</span>
			<form action="./loginProcess.html" name="loginFrm" method="post">
				<table border="1" cellpadding="5" cellspacing="0" width="500">
					<tr>
						<td width="120">아이디</td>
						<td width="380">
							<input type="text" name="userId" />
						</td>
					</tr>
					<tr>
						<td>패스워드</td>
						<td>
							<input type="password" name="userPass" />
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:center;">
							<input type="submit" value="로그인하기" />
							&nbsp;&nbsp;
							<input type="reset" value="리셋" />
						</td>
					</tr>
				</table>
			</form>
			<!-- 로그인 전 디자인e -->
		</c:otherwise>
	</c:choose>

</body>
</html>