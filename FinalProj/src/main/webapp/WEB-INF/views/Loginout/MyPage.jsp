<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="with=device-width, initial-scale=1" />
<link rel="stylesheet" href="./bootstrap3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="./bootstrap3.3.7/js/bootstrap.min.js"></script>
<title>MyPage.jsp</title>
<link rel="stylesheet" href="../pageground/divLayout.css" />
<script>
	function logoutGo(){
		var answer =confirm("정말 로그아웃 하시겠습니까?");
		if(answer==true){
			location.href="Logout.jsp";
		}
		else{
			alert("로그아웃을 취소하셨습니다.");
		}
	}
	
</script>
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
				<%@ include file="../pageground/LayoutLeftMe.jsp" %>
			</div>
			<div class="contents">
			<div class="cont1">
			
		<fieldset style="padding:10px 20px 10px 20px;">
			<legend>마이 페이지</legend>
			<h2><%=session.getAttribute("USER_ID") %>님, 환영합니다!</h2>
			<table class="table table-bordered" width="250" cellspacing="0" cellpadding="5" border="1">
			<colgroup>
				<col width="150px" />
				<col width="*" />
			</colgroup>
				<tr>
					<td>아이디</td>
					<td>
						<%=session.getAttribute("USER_ID") %>
					</td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td>
						<%=session.getAttribute("USER_PWD") %>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center">
						<input type="button" value="로그아웃" onclick="logoutGo();" />
					</td>
				</tr>
			</table>
			
		</fieldset>
		
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