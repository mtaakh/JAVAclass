<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>buyTicketNotTS.jsp</title>
</head>
<body>
	<h2>트랜젝션(Transaction)</h2>
	
	<h3>트랜젝션 처리없이 티켓 구매하기</h3>
	<h4>제약조건 : check(countNum<5)-> 티켓은 4장까지만 구매가능</h4>
	
	<form name="ticketFrm" method="post" action="buyTicketNotTSAction.do">
		<table border="">
			<tr>
				<td width="30%">고객아이디</td>
				<td width="70%">
					<input type="text" name="consumerid" />
				</td>
			</tr>
			<tr>
				<td>티켓구매수</td>
				<td>
					<select name="amount" id="">
					<% for(int i=0; i<=10; i++){ %>
						<option value="<%=i %>"><%=i %>장</option>
					<% } %>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center;">
					<input type="submit" value="구매하기" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>