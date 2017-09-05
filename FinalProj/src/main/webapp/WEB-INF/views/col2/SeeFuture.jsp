<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="with=device-width, initial-scale=1" />
<link rel="stylesheet" href="../bootstrap3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="../bootstrap3.3.7/js/bootstrap.min.js"></script>
<title>SeeFuture</title>
<link rel="stylesheet" href="../pageground/divLayout.css" />
</head>
<body>
	
	<div class="allWrap">
	<!-- 로고 / GNB가 나오는 부분 -->
		<div class="header">
			<%@ include file="../pageground/LayoutTop.jsp" %>
		</div>
		<!-- LNB / Contents가 나오는 부분 -->
		<div class="body">
			<div class="leftmenu">
				<%@ include file="../pageground/LayoutLeft2.jsp" %>
			</div>
			<div class="contents">
			<div class="cont1">
				<br />
				<fieldset>
					<legend style="font-size:2em; font-weight:bold;">쿠키 충전하기</legend>
					<br />
					<p>가담항설 미리보기는 네이버 <strong>쿠키(웹툰/웹소설 전용 화폐단위)</strong>로 이용 가능한 유료 작품입니다.
					미리미리 충전해둡시다☆</p>
					
					<a href="http://nstore.naver.com/my/cookie/sellingList.nhn"><button class="btn btn-warning">미리미리 충전해두기</button></a>
					
					
					<br /><br /><br /><br />
					
					<legend style="font-size:2em; font-weight:bold;">미리보기</legend>
					<br />
					<p>자유게시판 이용을 할 때 미리보기의 내용을 언급하는 것은 <strong>스포일러</strong>의 위험이 있을 수 있으니 자제해주시기 바랍니다,,,</p>
					
					<a href="http://nstore.naver.com/comic/detail.nhn?productNo=2107644"><button class="btn btn-success">미래인되기</button></a>
					
					<br /><br /><br />
				</fieldset>
				<br />
			</div>
			</div>
		</div>
		<!-- 회사 정보 등Copyright 나오는 부분 -->
		<div class="bottom">
				<%@ include file="../pageground/LayoutBottom.jsp" %>
		</div>
	</div>
</body>
</html>