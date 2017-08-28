<%@page import="StudyModel.studyDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="StudyModel.studyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<%@ include file="/layout/head.jsp"%>
<script>


function editchk(num){
	var answer = window.confirm("수정 하시겠습니까?");

	if(answer==true){
		
		location.href="./ModifyStudy.jsp?idx="+num+"&Page=./StudyList.jsp";
	}
}


function deletechk(num){
	var answer = window.confirm("삭제 하시겠습니까?");

	if(answer==true){
		
		location.href="./DeleteProc.jsp?idx="+num+"&Page=./StudyList.jsp";
	}
	}
</script>
<title>StudyList.jsp</title>
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
							<h3>어학/자격증 게시판 관리</h3>
						</div>
					</div>
				</div>
				<%
					studyDAO dao = new studyDAO();

					Map<String, Object> parammap = new HashMap<String, Object>();

					//게시판 전체목록 가져오기 
					List<studyDTO> eng = dao.list(parammap);
					dao.close();
				%>

				<div class="col-md-12 to-animate">
					<select style="color: black; width: 80px; height: 50px" name="menu"
						onchange="location.href=this.value">
						<option value="./StudyList.jsp" selected>&nbsp;&nbsp;전체</option>
						<option value="./EnglishStudy.jsp">&nbsp;&nbsp;어학</option>
						<option value="./LicenseStudy.jsp">&nbsp;&nbsp;자격증</option>
					</select>
					<div class="text-center">
						<table id="EnglishTable" class="table table-bordered" border=1">
							<thead>
								<tr style="background-color: #f3f3f3;">
									<td>번호</td>
									<td>분야</td>
									<td>종류</td>
									<td>제목</td>
									<td>내용</td>
									<td>조회수</td>
									<td>URI</td>
									<td>EDIT</td>
								</tr>
							</thead>
							<tbody>

								<%
									if (eng.isEmpty()) {
								%>
								<tr>
									<td colspan="6" style="height: 100px">등록된 글이 없습니다.</td>
								</tr>
								<%
									} else {
										//int countNum =0;
										//int vNum =0;
										int nowPage = 1;
										for (studyDTO dto : eng) {

											//pagesize단위로 빼줌 
											//vNum = totalRecord - (((nowPage-1)*pageSize)+countNum++);
								%>


								<tr>
									<td><%=dto.getIdx()%></td>
									<td><%=dto.getStudy_type()%></td>
									<td><%=dto.getCategory()%></td>
									<td><a
										href="Page_View.jsp?num=<%=dto.getIdx()%>&nowPage=<%=nowPage%>"
										style="text-decoration: none; "> <%=dto.getTitle()%></a></td>
									<td><%=dto.getContent()%></td>
									<td><%=dto.getClick_cnt()%></td>
									<td><%=dto.getUrl()%></td>
									<td>
										<!--  <input type="button" onclick="return editchk(<%=dto.getIdx()%>);" value="수정"/>&nbsp; -->
										<input type="button"
										onclick="return deletechk(<%=dto.getIdx()%>);" value="삭제" />
									</td>

								</tr>

							</tbody>
							<%
								} //for문 끝
							%>
							<%
								} //else문 끝
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