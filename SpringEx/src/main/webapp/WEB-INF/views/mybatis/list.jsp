<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mybatis Board</title>
<script>
	function deleteRow(mId){
		if(confirm('게시물을 삭제하시겠습니까?')){
			location.href='delete.do?mId=' + mId;
		}
	}
</script>
</head>
<body>
	<h2>Mybatis 게시판 - 리스트</h2>
	
	<table width="600" border="1" cellspacing="0" cellpadding="5">
		<tr style="text-align:center;">
			<th width="10%">번호</th>
			<th width="20%">작성자</th>
			<th width="60%">한줄내용</th>
			<th width="10%">삭제</th>
		</tr>
		<!-- 반복start -->
		<c:forEach items="${lists}" var="row">
		<tr>
			<td>${row.mId}</td>
			<td>${row.mWriter}</td>
			<td><a href="view.do?mId=${row.mId}">${row.mContent}</a></td>
			<td><input type="button" value="삭제" onclick="javascript:deleteRow(${row.mId})"/></td>
		</tr>
		</c:forEach>
		<!-- 반복end -->
	</table>
	
	<p style="width:600px; tezt-align:right;">
		<input type="button" value="한줄글작성" onclick="javascript:location.href='write.do';" />
	</p>
</body>
</html>