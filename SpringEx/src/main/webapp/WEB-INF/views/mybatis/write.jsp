<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function mybatitsCheck(){
		var f = document.mybatisFrm;
		if(f.mWriter.value==""){
			alert("작성자를 입력하세요.");
			f.mWriter.focus();
			return false;
		}
		if(!f.mContent.value){
			alert("한줄내용을 입력하세요.");
			f.mContent.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<h2>Mybatis 게시판 - 쓰기</h2>
	<form name="mybatisFrm" method="post" action="writeAction.do" onsubmit="return mybatitsCheck();">
		<table width="600" border="1" cellpadding="5" cellspacing="0">
			<tr>
				<td width="30%">작성자</td>
				<td width="70%">
					<input type="text" name="mWriter" size="10" value="" />
				</td>
			</tr>
			<tr>
				<td>한줄내용</td>
				<td>
					<input type="text" name="mContent" size="45" value="" />
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center;">
					<input type="submit" value="한줄쓰기" />
					<input type="button" value="목록보기" onclick="location.href='list.do';" />
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>