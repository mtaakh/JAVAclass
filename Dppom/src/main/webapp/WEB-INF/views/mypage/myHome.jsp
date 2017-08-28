<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/layout/head.jsp" %>
<style>
.navbar-brand{
 color:#6173f4;
}
</style>
<title>마이 페이지입니다</title>
<link rel="shortcut icon" href="./resources/bootstrap3.3.7/images/D.ico" />
</head>
<body>
<header role="banner" id="fh5co-header">
	
	<!--  TOP ( 메뉴 )  -->
		<%@ include file="/WEB-INF/layout/LayoutTop2.jsp" %>
		 
	<!-- TOP (E) -->
</header>


<div id="fh5co-about-us" data-section="about">
	<div class="container">
		
		<!-- My Page(메뉴) -->
		
		<%@ include file="/WEB-INF/layout/LayoutMyPage.jsp" %>
	
		<!-- My Page(메뉴) E  -->
		

	<div class="row row-bottom-padded-lg" id="about-us" >
		<div class="col-md-12 section-heading text-center">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 to-animate">
					<h3>Point 내역 보기 </h3>
				</div>
			</div>
		</div>
		<div class="col-md-12 to-animate"  >
				<div class="text-center">
				<div class="row" >
						<div class="col-md-12" style="text-align:right">
							<span style="font-size:2em">10,000P</span>
						</div>
						
					</div>
	<!-- 테이블 S -->		
	<table id="commu_table" class="table table-hover table-bordered">
	<thead>
		<tr >
			<th style="width:10%; text-align:center;">날짜</th>
			<th style="text-align:center;">내역</th>
			<th style="width:10%; text-align:center;">증 / 감 </th>
			<th style="width:10%; text-align:center;">증(감)금액</th>
		</tr>
	</thead>
	<tbody>
	
<%-- 		
	<%
			if(commu.isEmpty())  //lists.isEmpty()는 ( lists.size() == 0 ) 와 같다.
			{ %>
				<tr>
					<td colspan="5" style="height:100px">등록된 글이 없습니다.</td>
				</tr>	
			<%} else {
					int countNum =0;
					int vNum =0;
					for(CommuDTO dto : commu){
						
						//pagesize단위로 빼줌 
						vNum = totalRecord - (((nowPage-1)*pageSize)+countNum++);
		%> --%>
	
	
<%-- 		<tr>
			<td><%=vNum %></td>
		
			<td><a href="Page_View.jsp?num=<%=dto.getNum()%>&nowPage=<%=nowPage%>" style="text-decoration:none; color:black">
			<% if(Integer.parseInt(dto.getCount())>=10){ %>
				<span class="glyphicon glyphicon-thumbs-up" style="color:blue"></span>
			<%} %>	<%=dto.getTitle() %></a></td>
			<td><%=dto.getId() %></td>
			<td><%= dto.getPostdate()%></td>
			<td><%= dto.getCount()%></td>
		</tr> --%>
		
		<tr>
			<td>2017/08/24</td>
			<td>게시글 작성 </td>
			<td>적립</td>
			<td style="color:blue">10P</td>
		</tr>
		<tr>
			<td>2017/03/29</td>
			<td>게시글 신고</td>
			<td>차감</td>
			<td style="color:red">10p</td>
		</tr>
	
	</tbody>	
<%-- 	<%} //for문 끝%>
<%}//else문 끝 %>	 --%>
</table>
<!-- 테이블 E  -->	
			</div>
		</div>
	</div>

</div>
</div>
	<!-- Botton (S) -->
	<%@ include file="/WEB-INF/layout/LayoutBottom.jsp" %>
	<!--  Bottom(E) -->
</body>
</html>