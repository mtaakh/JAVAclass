<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자료실 상세보기</title>
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
					<legend>자료실 상세보기</legend>
					<table border="1" width="770" border="1" cellspacing="0" cellpadding="2">
						<tr>
							<td width="20%">번호</td>
							<td width="30%">
								${viewRow.idx}
							</td>
							<td width="20%">작성자</td>
							<td width="30%">
								${viewRow.name}
							</td>
						</tr>
						<tr>
							<td width="20%">작성일자</td>
							<td width="30%">
								${viewRow.postdate}
							</td>
							<td width="20%">조회수</td>
							<td width="30%">
								${viewRow.hits}
							</td>
						</tr>
						<tr>
							<td width="20%">제목</td>
							<td width="80%" colspan="3">
								${viewRow.title}
							</td>
						</tr>
						<tr>
							<td>내용</td>
							<td colspan="3" style="height:150px; padding:10px;">
								${viewRow.content}
							</td>
						</tr>
						<tr>
							<td width="20%">패스워드</td>
							<td width="80%" colspan="3">
								<input type="password" name="pass" style="width:30%;" />
							</td>
						</tr>
						<tr>
							<td width="20%">첨부파일</td>
							<td width="80%" colspan="3">
								
							</td>
						</tr>
						<tr>
							<td colspan="4" style="text-align:center; padding:10px 0;">
								<button type="button" 
									onclick="javascript:location.href='./reply.do?idx=${viewRow.idx}';">답글달기</button> 
									&nbsp;&nbsp;
								<button type="button" 
									onclick="javascript:location.href='./password.do?idx=${viewRow.idx}&mode=modify&nowPage=${param.nowPage }';">수정하기</button> 
									&nbsp;&nbsp;
								<button type="button" 
									onclick="javascript:location.href='./password.do?idx=${viewRow.idx}&mode=delete'">삭제하기</button> 
									&nbsp;&nbsp;
								<button type="button" 
									onclick="javascript:location.href='./list.do?nowPage=${param.nowPage}'">목록보기</button> 
									&nbsp;&nbsp;
							</td>
						</tr>
					</table>
					
				</fieldset>
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