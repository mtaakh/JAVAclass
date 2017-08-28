<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="MemberModel.memberDAO"%>
<%@page import="MemberModel.memberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

	memberDAO dao = new memberDAO();
	Map<String, Object> parammap = new HashMap<String, Object>();

//회원 전체 가져오기
	List<memberDTO> memlist = dao.selectAll(parammap);
	dao.close();
%>
<html>
<head>
<%@ include file="/layout/head.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 페이지</title>
</head>

<body>
	<header role="banner" id="fh5co-header"> <!--  TOP ( 메뉴 )  -->
	<%@ include file="/layout/LayoutTop2.jsp"%> <!-- TOP (E) -->
	</header>
	<div id="fh5co-about-us" data-section="about">
		<div class="container">
			<!-- My Page(메뉴) -->
			<%@ include file="/layout/LayoutAdminPage.jsp"%>
			<!-- My Page(메뉴) E  -->
			<br /> <br />
			<div class="row row-bottom-padded-lg" id="about-us">
				<div class="col-md-12 section-heading text-center">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 to-animate">
							<h3>회원정보 처리 관리자</h3>
						</div>
					</div>
				</div>
				<div class="col-md-12 to-animate">
					<div class="text-center">

						<table class="table table-bordered" border="1">
							<tr style="background-color: #f3f3f3;">
								<th>아이디</th>
								<th>이름</th>
								<th>이메일</th>
								<th>총 포인트</th>
								<th>가입일</th>
							</tr>
									<%
			if(memlist.isEmpty()){
		%>
							<tr>
								<td colspan="5" style="height: 100px;">등록된 글이 없습니다.</td>
							</tr>
									<%
			} else{
				
				int vNum = 0;
				int countNum = 0;
				for(memberDTO dto : memlist){					
		%>
		
		<tr>
			<td style="text-align:center;"><a href="./memberInfo.jsp?id=<%=dto.getId()%>"><%=dto.getId()%></a></td>
			<td style="text-align:center;"><%=dto.getName() %></td>
			<td style="text-align:center;"><%=dto.getEmail() %></td>
			<td style="text-align:center;"><%=dto.getPoint() %></td>
			<td style="text-align:center;"><%=dto.getRegidate()%></td>
		</tr>
		<%
				}
			}
		%>
						</table>
					</div>
				</div>
			</div>
		</div>
		<br /> <br />
		<!-- Botton (S) -->
		<%@ include file="/layout/LayoutBottom.jsp"%>
		<!--  Bottom(E) -->
	</div>
</body>
</html>