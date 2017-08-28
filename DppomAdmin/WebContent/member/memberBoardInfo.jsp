<%@page import="BoardModel.boardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="BoardModel.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

	boardDAO dao = new boardDAO();
	String id = request.getParameter("id");
	Map<String, Object> parammap = new HashMap<String, Object>();

	
	List<boardDTO> boardlist = dao.selectAll(parammap, id);
	dao.close();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>memberBoardInfo</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>IDX</td>
			<td>제목</td>
			<td>게시판종류</td>
			<td>조회수</td>
			<td>게시일</td>
		</tr>
		
		<%
			if(boardlist.isEmpty()){
		%>
			<tr>
				<td colspan="5" style="height:100px;">등록한 글이 없습니다.</td>
			</tr>
		<%
			} else{
				
				int vNum = 0;
				int countNum = 0;
				for(boardDTO dto : boardlist){					
		%>
		
		<tr>
			<td style="text-align:center;"><a href="./memberInfo.jsp?id=<%=dto.getId()%>"><%=dto.getIdx()%></a></td>
			<td style="text-align:center;"><%=dto.getTitle() %></td>
			<td style="text-align:center;"><%=dto.getCategory() %></td>
			<td style="text-align:center;"><%=dto.getClick_cnt() %></td>
			<td style="text-align:center;"><%=dto.getRegidate()%></td>
		</tr>
		<%
				}
			}
		%>
	</table>
</body>
</html>