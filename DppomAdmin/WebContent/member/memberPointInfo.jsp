<%@page import="MemberModel.pointDTO"%>
<%@page import="MemberModel.pointDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

	pointDAO dao = new pointDAO();
	String id = request.getParameter("id"); //선택한 id 받아오기
	Map<String, Object> parammap = new HashMap<String, Object>();

	
	List<pointDTO> memlist = dao.selectAll(parammap, id);
	dao.close();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>memberPointInfo</title>
</head>
<body>
	<form name="inputForm">
		<select name="cate" onchange="arrayFrm();">
			<option value="nomal">전체</option>
			<option value="plus">적립</option>
			<option value="minus">차감</option>
		</select>
		<table border="1">
			<tr>
				<th>NO.</th>
				<th>ID</th>
				<th>상세정보</th>
				<th>얻은 날짜</th>
				<th>종류</th>
				<th>가감</th>
				<th>총 포인트</th>
			</tr>
			
			<%
				if(memlist.isEmpty()){
			%>
				<tr>
					<td colspan="5" style="height:100px;">포인트 내역이 없습니다.</td>
				</tr>
			<%
				} else{
					
					int vNum = 0;
					int countNum = 0;
					for(pointDTO dto : memlist){					
			%>
			
			<tr>
				<td style="text-align:center;"><%=dto.getIdx()%></td>
				<td style="text-align:center;"><%=dto.getId() %></td>
				<td style="text-align:center;"><%=dto.getDetail() %></td>
				<td style="text-align:center;"><%=dto.getUseddate() %></td>
				<td style="text-align:center;"><%=dto.getUsed_type()%></td>
				<td style="text-align:center;"><%=dto.getAdjust()%></td>
				<td style="text-align:center;"><%=dto.getTotal_point()%></td>
			</tr>
			<%
					}
				}
			%>
		</table>
	</form>
	
</body>
</html>