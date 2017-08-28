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

#cate:hover{
 background-color:black;
 color:white !important;
}


</style>
<title>大PPOM - DataRoom</title>
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
		<div class="row" id="team">
			<div class="col-md-12 section-heading text-center to-animate">
				<h2>DATAROOM</h2>
				
			</div>
		</div>
			<div class="row row-bottom-padded-lg" id="about-us" >
				
				<div class="col-md-12 to-animate"  >
					<div class="text-center">
					<div class="row" >
						<div class="col-md-12" style="text-align:right">
							<button type="button" class="btn" onclick="location.href='DataWrite'" style="margin-bottom:5px;">Write</button>
						</div>
						
					</div>
					
						<!-- 테이블 S -->		
						<table id="commu_table" class="table table-hover table-bordered">
						<thead>
							<tr >
								<th style="width:10%; text-align:center;">No</th>
								<th style="width:10%; text-align:center;">종류</th>
								<th style="text-align:center;">제목</th>
								<th style="text-align:center;">작성자</th>
								<th style="width:10%; text-align:center;">파일(&신청현황)</th>
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
							
							<!-- 가상 -->
							<tr>
								<td width="10%">1</td>
								<td width="10%">족보</td> 
								<td><a href="DataView">원미</a></td>
								<td width="10%">원미</td>
								<td width="10%"><span class="glyphicon glyphicon-file" style=" text-align:right;color:blue"></span></td>
								<td width="10%">24시</td>
								<td width="10%">9999</td>
							</tr>
				
						</tbody>	
					<%-- 	<%} //for문 끝%>
					<%}//else문 끝 %>	 --%>
					</table>
					<!-- 테이블 E  -->	
					<form>
					
			
					<div class="row" >
						<div class="col-md-2">
							<select class="form-control" id="sel1">
								    <option >선택</option>
								    <option>제목</option>
								    <option>ID</option>
								    <option>학교</option>
								    <option>학과</option>
		  						</select>
						</div>
						<div class="col-md-6 input-group">
							 <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
							    <input style="width:70%"id="email" type="text" class="form-control" name="search">
							    <button type="button" class="btn btn-default" style="margin-left:0px" onclick="">Search</button>
						</div>
					</div>
					 </form>
					 <br />
					<span><a href="" style="text-decoration:none; " >1 2 3 4 5  페이징 </a>  </span>
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