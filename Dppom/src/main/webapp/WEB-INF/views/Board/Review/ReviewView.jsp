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
<title>ReView</title>
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
				<h2>REVIEW</h2>	
			</div>
		</div>
			<div class="row row-bottom-padded-lg" id="about-us" >
				<div class="col-md-12 to-animate"  >
					<div class="text-center">
						<div class="row" >
							<div class="col-md-12" style="text-align:right">
								<button type="button" class="btn" onclick="history.back()" style="margin-bottom:5px;">Back</button>
							</div>	
						</div>
						<!-- 테이블 S -->	
						<form action="">
						<table id="commu_table" class="table  table-bordered" >
							<thead>
								<tr >
									<th colspan="3" style="width:10%; text-align:center;">
									<a href="" name="신고"><span class="glyphicon glyphicon-bell" style="width:95%; text-align:right;color:red"></span></a>
									<a href="" name="좋아요" style="color:red"><span class="glyphicon glyphicon-thumbs-up" style=" text-align:right;color:blue"></span></a>
									</th>
								</tr>
							</thead>
						<tbody>
							<tr>
								<td style="Width:20%">
								전공 또는 교양
								</td>
								<td  style="width:60%">
								 제목
								</td >
								<td style="Width:20%">
								조회수
								</td>
							</tr>
							<tr>
								<td>학교 </td>
								<td>학과</td>
								<td style="width:30%">★★★★★ / 파일첨부 / 팀플신청</td>
							</tr>
							<tr>
								<td colspan="3">
								<textarea name="content" id="" cols="50" rows="30" style="width:100%">내용</textarea>
								</td>
							</tr>
						</tbody>	
					<%-- 	<%} //for문 끝%>
					<%}//else문 끝 %>	 --%>
					</table>
						<div class="col-md-12" style="text-align:center">
							<button type="button" class="btn" onclick="" style="margin-bottom:5px;">수 정</button>
							<button type="button" class="btn" onclick="" style="margin-bottom:5px;">삭 제</button>
						</div>
					<!-- 테이블 E  -->	
					</form>
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