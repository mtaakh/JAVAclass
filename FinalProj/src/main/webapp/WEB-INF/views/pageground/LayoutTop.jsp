<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="with=device-width, initial-scale=1" />
<link rel="stylesheet" href="../bootstrap3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="../bootstrap3.3.7/js/bootstrap.min.js"></script>
 
<!-- 로고 -->
<div class="logo">

		<nav class="navbar navbar-inverse"><!-- navbar-fixed-top -->
			<div class="container-fluid">
			
				<!-- 좌상단 로고 영역 -->
				<div class="navbar-header">
					<a href="#" class="navbar-brand">개인PJ</a>
				</div>
				<!-- 메뉴 부분 -->
				<ul class="nav navbar-nav center">
					<li class="center" style="font-weight:bold; font-size:2em;">
						<a href="../Main.jsp" style="color:gold;">가담항설</a>
					</li>
				</ul>
				
				<ul class="nav navbar-nav navbar-right">
			<% if(session.getAttribute("USER_ID")==null){ %>
				<!-- 비회원상태 -->
					<li><a href="#"><span class="glyphicon glyphicon-user"></span>회원가입</a></li>
					<li><a href="../Loginout/Login.jsp"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
			<% }else{ %>
				<!-- 회원상태 -->
					<li><a href="../Loginout/MyPage.jsp"><span class="glyphicon glyphicon-cog"></span> 마이페이지</a></li>
					<li><a href="../Loginout/Logout.jsp"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
					<%} %>
				</ul>
				
			</div>	
		</nav>
</div>
<!-- 탑메뉴 -->
<div class="container-fluid">
	<ul class="nav nav-pills navbar-right" style="margin-right:50px;">
		<li class="btn" onclick="javascript:location.href='../col1/IntroPage.jsp';"><a href="#p_menu1" data-toggle="pill">소개</a></li>
		<li class="btn" onclick="javascript:location.href='../col2/showGD.jsp';"><a href="#p_menu2" data-toggle="pill">보러가기</a></li>
		<li class="btn" onclick="javascript:location.href='../col3/BoardList.jsp';"><a href="#p_menu3" data-toggle="pill">커뮤니티</a></li>
		<li class="btn" onclick="javascript:location.href='../col4/Suggest.jsp';"><a href="#p_menu4" data-toggle="pill">Q&amp;A</a></li>
	</ul>
</div>