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
<title>Login.jsp</title>
<link rel="stylesheet" href="../pageground/divLayout.css" />
<script>
	function loginFrmCheck(){
		//form의 객체를 가져와서 변수에 저장
		var fn = document.loginFrm;
		//폼의 name을 통한 접근으로 value속성을 가져옴
		if(fn.user_id.value==""){
			alert("아이디를 입력하세요");
			fn.user_id.focus();
			return false;
		}
		if(fn.user_pw.value==""){
			alert("패스워드를 입력하세요");
			fn.user_pw.focus();
			return false;
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
			<div class="contents">
		<fieldset>
			<legend>로그인을 해주세용</legend>
			<span style="color:red; font-wieght:bold;">
				<%=	request.getAttribute("ERROR_MSG")==null ? "" : request.getAttribute("ERROR_MSG") %>
			</span>
			<!-- 아래에 있는 submit버튼을 누르면 발생하는 submit 이벤트를 캐치하도록 onsubmit리스너 부착
				해당 이벤트가 발생하면 loginFrmCheck 함수를 호출한다 -->
			<form name="loginFrm" method="post" action="./LoginProcess.jsp" onsubmit="return loginFrmCheck();">
				<table class="table table-bordered" style="width:45%; margin-left:5%; text-align:center;" border="1" cellpadding="5" cellspacing="0">
					<tr>
						<td><label for="user_id">아이디</label></td> <%-- GM (대문자) --%>
						<td>
							<input type="text" name="user_id" value="" />
						</td>
					</tr>
					<tr>
						<td><label for="user_pw">패스워드</label></td> <%-- 1234 --%>
						<td>
							<input type="password" name="user_pw" value="" />
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:center;">
						<button type="submit" class="btn btn-warning">
							<span class="glyphicon glyphicon-ok"></span> 로그인 </button>
						</td>
					</tr>
				</table>
			</form>
		</fieldset>
			</div>
		</div>
		<!-- 회사 정보 등Copyright 나오는 부분 -->
		<div class="bottom">
				<%@ include file="../pageground/LayoutBottom.jsp" %>
		</div>
	</div>
</body>
</html>
