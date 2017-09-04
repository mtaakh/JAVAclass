<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Mybatis 게시판 - 상세보기</h2>
		<table width="600" border="1" cellpadding="5" cellspacing="0">
			<tr>
				<td width="30%">번호</td>
				<td width="70%">
					${view.mId}
				</td>
			</tr>
			<tr>
				<td width="30%">작성자</td>
				<td width="70%">
					${view.mWriter}
				</td>
			</tr>
			<tr>
				<td>한줄내용</td>
				<td>
					${view.mContent}
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center;">
					<input type="button" value="목록보기" onclick="location.href='list.do';" />
				</td>
			</tr>
		</table>
	
</body>
</html>