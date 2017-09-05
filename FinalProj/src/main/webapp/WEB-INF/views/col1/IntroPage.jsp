<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>IntroPage</title>
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
				<%@ include file="../pageground/LayoutLeft.jsp" %>
			</div>
			<div class="contents">
			<div class="cont1">
				<br />
				<fieldset>
					<legend style="font-size:2em; font-weight:bold;">이 사이트의 정체</legend>
					<br />
					<p style="font-size:1.2em;">
					그냥 저의 개인 프로젝트 용으로 만들었던 페이지였는데 이걸 작가님께 선물로 드리고 싶었으나 완성될지... <br />
					그리고 드릴 수 있을지 없을지는 아직 모르므로;; <br />
					저작권 문제가 생기면 걍 저혼자 쓰겠읍니다 (ㅠㅆㅠ)
					
					<br /><br /><br /><br /><br /><br />
					<br /><br /><br /><br /><br /><br />
					<br /><br /><br /><br /><br /><br />
					<br /><br /><br /><br /><br /><br />
					문의사항은 <strong>이메일</strong>(아래에 있음. 문자사절 전화사절 사절사절사절단(?))로 주시기 바랍니다.<br />
					그럼 20000...</p> 
					<br /><br /><br />
				</fieldset>
				<br /><br /><br />
				<fieldset>
					<legend style="font-size:2em; font-weight:bold;">페이지 소개 자료</legend>
					ppt : <br />
					youtube : <br />
					
				</fieldset>
				<br />
				<br />
				<br />
				<fieldset>
					<legend style="font-size:2em; font-weight:bold;">Thanks to</legend>
					네이버 웹툰 <a href="http://comic.naver.com/webtoon/list.nhn?titleId=670144&weekday=thu">가담항설</a><br />
					GitHub(<a href="https://github.com/">https://github.com/</a>) <br />
					Hero0926(<a href="https://github.com/hero0926">https://github.com/hero0926</a>)<br />
					
				</fieldset>
				<br /><br /><br />
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