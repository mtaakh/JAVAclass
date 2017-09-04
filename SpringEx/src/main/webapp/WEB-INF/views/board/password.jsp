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
					<form name="writeFrm" action="<c:url value="/board/passwordAction.do" />" 
						onsubmit="return checkWriteFrm();" method="post">
						<input type="hidden" name="mode" value="${mode}" />
						<input type="hidden" name="idx" value="${idx}" />
						
						<!-- 패스워드 검증에 실패했을때 에러메세지 출력 -->
						<span style="color:red; fontn-size:1.5em;">${isCorrMsg}</span>
						
					<table width="770" border="1" cellspacing="0" cellpadding="2">
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