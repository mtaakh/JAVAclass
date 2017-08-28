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
<title>마이 페이지 - 내글보기</title>
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
					<h3>내가 쓴글 보기 </h3>
				</div>
			</div>
		</div>
				
	<div class="col-md-12 to-animate"  >
		<div class="text-center">
	<!-- 테이블 S -->		
	<table id="commu_table" class="table table-hover table-bordered">
	<thead>
		<tr >
			<th style="width:10%; text-align:center;">카테고리</th>
			<th style="text-align:center;">제목</th>
			<th style="width:10%; text-align:center;">작성자</th>
			<th style="width:10%; text-align:center;">날짜</th>
			<th style="width:10%; text-align:center;">조회수</th>
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
			<td>Dataroom</td>
			<td>컴공 족보ㄱㄱ</td>
			<td>원미정</td>
			<td>2017/8/24</td>
			<td>999</td>
		</tr>
		<tr>
			<td>1</td>
			<td>2</td>
			<td>3</td>
			<td>4</td>
			<td>5</td>
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