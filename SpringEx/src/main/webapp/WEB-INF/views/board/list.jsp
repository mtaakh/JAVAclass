<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring 게시판</title>
<link rel="stylesheet" href="../common/divLayout.css" />
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
					<legend> 자료실 목록(현재페이지:${nowPage}/전체페이지:${totalPage}) </legend>
					<table>
						<tr>
							<td align="right">
							<button onclick="location.href='<c:url value="./write.do"/>';">글쓰기</button>
							</td>
						</tr>
					</table>
					<!-- 게시판 목록 시작 -->
					<table width="770" border="1" cellspacing="0" cellpadding="2">
						<tr style="text-align:center; background-color:#f3f3f3;">
							<th width="10%">번호</th>
							<th width="*">제목</th>
							<th width="15%">작성자</th>
							<th width="10%">조회수</th>
							<th width="15%">작성일</th>
						</tr>
							<!-- 글이 없는경우 노출 -->
						<c:choose>
							<c:when test="${empty listRows}">
								<tr>
									<td colspan="6" style="height:100px;">등록된 글이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${listRows}" var="row" varStatus="loop">
										<!-- 글이 있는경우 노출 -->
									<tr>
										<td style="text-align:center;">${row.rNum }</td>
										<td><a href="./view.do?idx=${row.idx }&nowPage=${nowPage}">
										${row.title }
										</a></td>
										<td style="text-align:center;">${row.name }</td>
										<td style="text-align:center;">${row.hits }</td>
										<td style="text-align:center;">${row.postdate }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
					<!-- 게시판 목록끝 -->
					
					<!-- 페이징 -->
					<table width="770">
						<tr>
							<td style="text-align:center;">
								${pagingImg}
							</td>
						</tr>
					</table>
					<!-- 검색 -->
					<!-- <form method="get">
					<input type="hidden" name="nowPage" value="1" />
					<table width="100%">
						<tr style="text-align:center;">
							<td>
								<select name="searchColumn">
									<option value="title">제목</option>
									<option value="name">작성자</option>
									<option value="content">내용</option>
								</select>
								<input type="text" name="searchWord" />
								<input type="submit" value="검색하기" />
							</td>
						</tr>
					</table>
					</form> -->
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