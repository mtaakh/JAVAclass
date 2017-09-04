<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA.jsp</title>
<link rel="shortcut icon" href="./resources/bootstrap3.3.7/images/D.ico" />
</head>
<body>
	<h2>건의 사항</h2>
	<header role="banner" id="fh5co-header"> <!--  TOP ( 메뉴 )  -->
	<%@ include file="/WEB-INF/layout/LayoutTop2.jsp"%>

	<!-- TOP (E) --> </header>

	<div id="fh5co-about-us" data-section="about">
		<div class="container">
			<div class="row" id="team">
				<div class="col-md-12 section-heading text-center to-animate">
					<h2>REVIEW</h2>

				</div>
			</div>
			<div class="row row-bottom-padded-lg" id="about-us">

				<div class="col-md-12 section-heading text-center to-animate">
					<div class="row"></div>
				</div>
				<div class="col-md-12 to-animate">
					<div class="text-center">
						<div class="row">
							<div class="col-md-12" style="text-align: right">
								<button type="button" class="btn"
									onclick="location.href='ReviewWrite'"
									style="margin-bottom: 5px;">Write</button>
							</div>

						</div>

						<!-- ------------------------------ 	EL식 테이블s	 -------------------------------- -->
						<fieldset>
							<legend> 자료실 목록(현재페이지:${nowPage}/전체페이지:${totalPage}) </legend>
							<table>
								<tr>
									<td align="right">
										<button onclick="location.href='<c:url value="./write.do"/>';">글쓰기</button>
									</td>
								</tr>
							</table>
							<!-- 게시판 목록 시작 -->
							<table width="770" border="1" cellspacing="0" cellpadding="2"
								id="commu_table" class="table table-hover table-bordered">
								<tr style="text-align: center; background-color: #f3f3f3;">
									<th style="width: 10%; text-align: center;">No</th>
									<th style="text-align: center;">제목</th>
									<th style="width: 10%; text-align: center;">작성자</th>
									<th style="width: 10%; text-align: center;">답변여부</th>
									<th style="width: 10%; text-align: center;">날짜</th>
									<th style="width: 10%; text-align: center;">조회수</th>
								</tr>
								<!-- 글이 없는경우 노출 -->
								<c:choose>
									<c:when test="${empty listRows}">
										<tr>
											<td colspan="6" style="height: 100px;">등록된 글이 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${listRows}" var="row" varStatus="loop">
											<!-- 글이 있는경우 노출 -->
											<%
												if ("${메소드.id}" == "관리자계정") {
											%>
											<!-- null > 관리자계정 -->
											<tr style="text-align: center; background-color: #f3f3f3;">
												<%
													} else {
												%>
												<tr style="text-align:center;">
											<%
												}
											%>
										<td style="text-align:center;">${row.rNum }</td>
										<td><a
													href="./view.do?idx=${row.idx }&nowPage=${nowPage}">
										${row.title }
										</a></td>
										<td style="text-align:center;">${row.name }</td>
										<td style="text-align:center;">${row.hits }</td>
										<td style="text-align:center;">${row.postdate }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
					<!-- 게시판 목록끝 -->
					
					<!-- 페이징 -->
					<table width="770">
						<tr>
							<td style="text-align:center;">
								${pagingImg}
							</td>
						</tr>
					</table>
				</fieldset>
				<!-- ------------------------ 	EL식 테이블e	 ------------------------------- -->
					<form>


													<div class="row">
						<div class="col-md-2">
							<select class="form-control" id="sel1">
								    <option>선택</option>
								    <option>과목명</option>
								    <option>학교</option>
								    <option>학과</option>
		  						</select>
						</div>
						<div class="col-md-6 input-group">
							 <span class="input-group-addon"><i
																class="glyphicon glyphicon-search"></i></span>
							    <input style="width:70%" id="email" type="text"
																class="form-control" name="search">
							    <button type="button" class="btn btn-default"
																style="margin-left:0px" onclick="">Search</button>
						</div>
					</div>
					 </form>
					 <br />
					<span><a href="" style="text-decoration:none; ">1 2 3 4 5  페이징 </a>  </span>
				
											</div>
			</div> 
			
		
		</div>
	</div>
</div>
<!-- Botton (S) -->
	<%@ include file="/WEB-INF/layout/LayoutBottom.jsp"%>
	<!--  Bottom(E) -->
</body>
</html>