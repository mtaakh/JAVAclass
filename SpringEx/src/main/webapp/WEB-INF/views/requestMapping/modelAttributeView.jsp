<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>modelAttributeView</title>
</head>
<body>
	<h2>@RequestMapping 파라미터</h2>
	
	<h3>@ModelAttribute 어노테이션을 사용해 파라미터 일괄전송</h3>
	
	<ul>
		<li>이름 : ${sInfo.name }</li>
		<li>나이 : ${sInfo.age }</li>
		<li>학년 : ${sInfo.gradeNum }</li>
		<li>반 : ${sInfo.classNum }</li>
	</ul>
</body>
</html>