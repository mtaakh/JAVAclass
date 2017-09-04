<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring 게시판</title>
<link rel="stylesheet" href="../common/divLayout.css" />

<script>
	function checkWriteFrm()
	{
		var f = document.writeFrm;
		if(f.name.value==""){
			alert("작성자를 입력하세요");
			f.name.focus();
			return false;
		}
		var f = document.writeFrm;
		if(f.title.value==""){
			alert("제목을 입력하세요");
			f.title.focus();
			return false;
		}
		var f = document.writeFrm;
		if(f.content.value==""){
			alert("내용을 입력하세요");
			f.content.focus();
			return false;
		}
		if(f.pass.value==""){
			alert("패스워드를 입력하세요");
			f.pass.focus();
			return false;
		}
	}
</script>
</head>
<body>
	
	<div class="allWrap">
	<!-- 로고 / GNB가 나오는 부분 -->
		<div class="header">
			<jsp:include page="/common/LayoutTop.jsp" />
		</div>
		<!-- LNB / Contents가 나오는 부분 -->
		<div class="body">
			<div class="leftmenu">
				<jsp:include page="/common/LayoutLeft.jsp" />
			</div>
			<div class="contents">
			<div class="cont1">
				<br />
				<fieldset>
					<legend>자료실 글쓰기</legend>
					<form name="writeFrm" action="<c:url value="/board/writeAction.do" />" 
						onsubmit="return checkWriteFrm();" method="post">
					<table width="770" border="1" cellspacing="0" cellpadding="2">
						<tr>
							<td width="20%">작성자</td>
							<td width="80%">
								<input type="text" name="name" style="width:30%;" />
							</td>
						</tr>
						<tr>
							<td width="20%">제목</td>
							<td width="80%">
								<input type="text" name="title" style="width:90%;" />
							</td>
						</tr>
						<tr>
							<td>내용</td>
							<td>
								<textarea name="content" style="width:90%; height:200px"></textarea>
							</td>
						</tr>
						<tr>
							<td width="20%">패스워드</td>
							<td width="80%">
								<input type="password" name="pass" style="width:30%;" />
							</td>
						</tr>
						<tr>
							<td colspan="3" style="text-align:center; padding:10px 0;">
								<button type="submit">등록하기</button>
							</td>
						</tr>
					</table>
					</form>
					
				</fieldset>
				<br />
			</div>
			</div>
		</div>
		<!-- 회사 정보 등Copyright 나오는 부분 -->
		<div class="bottom">
				<jsp:include page="/common/LayoutBottom.jsp" />
		</div>
	</div>
</body>
</html>