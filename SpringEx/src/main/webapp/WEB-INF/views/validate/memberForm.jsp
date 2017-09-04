<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>memberForm.jsp</title>
<script>
	function registCheckFrm(){}
</script>
</head>
<body>
	<h2>폼 데이터 검증 - 간단회원가입</h2>
	
	<span style="color:red; font-size:1.5em;">${formError }</span>
	<form action="./registProc" method="post" name="registFrm" onsubmit="return registCheckFrm();">
		<table border="1" width="500">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" value="${memberInfo.id }" /></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="pw" value="${memberInfo.pw }" /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="${memberInfo.name }" /></td>
			</tr>
			<tr>
				<td colspan="2"> <input type="submit" value="회원가입" /> </td>
			</tr>
		</table>
	</form>
</body>
</html>