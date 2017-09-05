<%@page import="procedures.BbsDTO"%>
<%@page import="procedures.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Loginout/isMember.jsp" %>
<%
	//글번호(키값) 받기
	String num = request.getParameter("num");
	//페이지 번호 받기
	String nowPage = (request.getParameter("nowPage")==null) ? "1" : request.getParameter("nowPage");
	//DAO 객체생성
	BbsDAO dao = new BbsDAO(application);
	//키값을 이용해 해당 레코드 하나 얻어오기
	BbsDTO dto = dao.selectOne(num);
	
	//조회수 증가시키기
	dao.updateVisitCountB(num);
	
	//자원반납
	dao.close();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BoardList.jsp</title>
<link rel="stylesheet" href="../common/divLayout.css" />
<script>
	function isDelete() {
		var ans = confirm("정말로 삭제하시겠습니까?");
		if(ans){ // 예를 누른 경우 ㅡ 게시물 삭제
			location.href="./DeleteProc.jsp?num=<%=dto.getNum()%>&nowPage=<%=nowPage%>";
			
		}
		
	}
</script>
</head>
<body>
	
	<div class="allWrap">
	<!-- 로고 / GNB가 나오는 부분 -->
		<div class="header">
			<%@ include file="../pageground/LayoutTop.jsp" %>
		</div>
		<!-- LNB / Contents가 나오는 부분 -->
		<div class="body">
			<div class="contents">
			<div class="cont1">
				<br />
				<fieldset>
					<legend>게시판 글보기</legend>
					<form name="writeFrm" action="WriteProc.jsp" onsubmit="return checkWriteFrm();" method="post">
					<table class="table table-bordered" width="770" border="1" cellspacing="0" cellpadding="2">
						<tr>
							<td width="20%">번호</td>
							<td width="30%">
								<%=dto.getNum() %>
							</td>
							<td width="20%">작성자</td>
							<td width="30%">
								<%=dto.getName() %>
							</td>
						</tr>
						<tr>
							<td width="20%">작성일</td>
							<td width="30%">
								<%=dto.getPostdate() %>
							</td>
							<td width="20%">조회수</td>
							<td width="30%">
								<%=dto.getVisitcount() %>
							</td>
						</tr>
						<tr>
							<td width="20%">제목</td>
							<td colspan="3" style="height:30px;">
								<%=dto.getTitle() %>
							</td>
						</tr>
						<tr>
							<td>내용</td>
							<td colspan="3">
								<%=dto.getContent().replace("\r\n","<br/>") %>
							</td>
						</tr>
						<tr>
							<td colspan="4" style="text-align:center;">
							<%
							//현재 로그인 된 아이디와 세션 영역에 저장된 아이디와 비교
							if(session.getAttribute("USER_ID").toString().equals(dto.getId()))
							{
							%>
								<button type="button" onclick="location.href='BoardEdit.jsp?num=<%=dto.getNum()%>&nowPage=<%=nowPage%>';">수정하기</button>
								&nbsp;&nbsp;
								<button type="button" onclick="javascript:isDelete();">삭제하기</button>
								&nbsp;&nbsp;
							<%
							}
							%>
								<button type="button" onclick="location.href='BoardList.jsp';">목록보기</button>
							</td>
						</tr>
					</table>
					</form>
				</fieldset>
				<br />
			</div>
			</div>
		</div>
		<!-- 회사 정보 등Copyright 나오는 부분 -->
		<div class="bottom">
				<%@ include file="../pageground/LayoutBottom.jsp" %>
		</div>
	</div>
</body>
</html>