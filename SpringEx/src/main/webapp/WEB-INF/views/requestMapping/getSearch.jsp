<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>getSearch</title>
</head>
<body>
	<h2>@RequestMapping 파라미터</h2>
	
	<h3>GET방식으로 파라미터 전송결과</h3>
	
	<ul>
		<li>검색필드 : ${searchColumn }</li>
		<li>검색단어 : ${searchWord }</li>
	</ul>
</body>
</html>