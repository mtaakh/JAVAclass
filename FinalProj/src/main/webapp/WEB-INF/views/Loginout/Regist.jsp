<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../bootstrap3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="../bootstrap3.3.7/js/bootstrap.min.js"></script>
<title>Regist</title>
	<script type="text/javascript">
			//아이디 중복 확인
			function overlappingPop(frm)
			{
				//1. 아이디 입력 확인
				if(frm.id.value==""){
					alert("아이디 입력 후 버튼을 눌러주세요");
					frm.id.focus();
					return;
				}
				
				//2. 입력된 아이디를 중복확인창으로 전달해 팝업창 띄움
				//window.open("창의 URL(경로)", "창의 이름", "창의 속성값")'
			function idUse()
			{
				opener.memberFrm.id.value = frm.id.value;
				//아이디 인풋박스를 읽기전용으로 바꿈
				opener.memberFrm.id.readOnly = true;
				//중복확인을 끝내게 되면 값은 1로 변경된다
				opener.memberFrm.overFlag.value = 1;
			}

		var isValidate = function(obj){
			//아이디 검증
			if(obj.id.value==""){
				alert("아이디를 입력하세요.");
				obj.id.focus();
				return false;
			}
			if(obj.overFlag.value=="0"){
				alert("아이디 중복확인은 반드시 하셔야 합니다.");
				return false;
			}
			//패스워드 검증
			if(obj.pwd.value==""){
				alert("패스워드를 입력하세요.");
				obj.pwd.focus();
				return false;
			}
			if(obj.pwd_re.value.length==0){
				alert("패스워드 확인을 입력하세요.");
				obj.pwd_re.focus();
				return false;
			}
			//패스워드 1.2가 동일한지 검증
			if(obj.pwd.value != obj.pwd_re.value){
				alert("입력한 패스워드가 틀립니다. 다시 입력해주세요.");
				obj.pwd.value="";
				obj.pwd_re.value="";
				obj.pwd.focus();
				return false;
			}
			//이름 검증
			if(obj.name.value==""){
				alert("이름을 입력하세요.");
				obj.name.focus();
				return false;
			}
			//성별(라디오박스)에 대한 검증 :  value에 대한 검증이 아니라 체크가 됐는지에 대한 검증이 이뤄져야 함
			var isGender = false;
			for(var i=0; i<obj.gender.length; i++)
			{
				if(obj.gender[i].checked==true)
				{
					isGender = true;
					break; 
				}
			}
			if(isGender==false){
				alert("성별을 선택하세요.");
				obj.gender[0].focus();
				return false;
			}
			//이메일 검증(박스&셀렉트) : selectedIndex는 option 중 선택한 항목의 index값을 반환한다.(반환값은 0부터)
			if(obj.email_domain.value=="" && obj.email_choice.selectedIndex==0){
				alert("이메일을 입력해주세요.");
				obj.email_domain.focus();
				return false;
			}
			//휴대전화 검증
			if(obj.mobile1.value=="" || obj.mobile2.value=="" || obj.mobile3.value==""){
				alert("전화번호를 입력해주세요");
				obj.mobile1.focus();
				return false;
			}
			
			return true; //false 를 반환하지 않으면 기본값으로 true가 반환. submit하는데는 문제없음

		}

	</script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function postOpen()
{
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
			var fn = document.memberFrm;
			fn.zipcode.value = data.zonecode;
			fn.address1.value = data.address;
			//회원정보 통계를 위한 추가 입력폼
			fn.sido.value = data.sido;
			fn.gugun.value = data.sigungu;

			fn.address2.focus();
        }
    }).open();
}
</script>
</head>
	<body>
	<form name="memberFrm" action="http://daum.net" method="get" onsubmit="return isValidate(this);">

	<!-- 아이디 중복확인 절차를 거쳤는지 확인하기 위한 히든 인풋박스 -->
	<input type="hidden" name="overFlag" value="0" />

	<!-- 	<h2>회원정보</th><span style="font color:#ff0000;"></span><font color="#ff0000">(필수)</font></h2> -->
			<!-- 텍스트 컬러를 변경할 때 위 두가지 방법 모두를 사용할 수 있으나 HYML5에서는 주로 span태그를 이용해 style을 지정하는 방식으로 사용됨 -->

	<!-- 
	ceellspacing : 셀과 셀 사이의 간격 설정
	cellpadding : 셀 안쪽의 요소(텍스트 등)와의 간격 설정
	-->
		<table align="center" border="0" style="border-collapse:collapse;"  cellpadding="0" cellspacing="10" width="90%">
		<colgroup>
			<col width="25%" />
			<col width="75%" /> <!-- *로 대체해도 됨  -->
		</colgroup>
		<tr>
			<td style="font-size:24px;"><b>회원정보<span style="color:#ff0000;">(필수)</span></b>
		</td>
		</tr>
			<tr>
				<td>아이디</td>
				<td> <input type="text" name="id" style="width:200px; height:30px;" value="" placeholder="4자리 이상" />
				<input type="button" value="아이디중복확인" style="background-color:#4da495; color:white; height:40px;" onclick="overlappingPop(this.form);" />
				<span style="color:red; font-size:12px;">아이디 형식에 맞춰주세요.(영문, 숫자 조합 4문자 이상)</span>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="pwd" style="width:200px; height:30px;" value="" placeholder="********" /> <span style="color:#999999; font-size:12px;">8~20자리의 영문,숫자 조합(영문, 숫자, 특수 기호 조합을 권장합니다)</span></td>
			</tr>
			<tr>
				<td>비밀번호확인</td>
				<td><input type="text" name="pwd_re" style="width:200px; height:30px;" value="" placeholder="********" /> </td>
			</tr>
			<tr>
				<td>이름</td>
				<td colspan="3"><input type="text" name="name" style="width:200px; height:30px;" value="" /> </td>
			</tr>
			<tr>
				<td style="height:30px;">성별</td>
				<td colspan="3">
				<input type="radio" id="gender" name="gender" value="M" />
				<label for="gender1"></label>남성
				&nbsp;
				<input type="radio" id="gender" name="gender" value="W" />
				<label for="gender2"></label>여성
				</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td colspan="3">
				<input type="Date" name="birthday" style="width:200px; height:30px;" value="" />
				&nbsp;&nbsp;
				<input type="radio" id="solar" name="solarLunar" value="양" />
				<label for="solar"></label>양력
				&nbsp;
				<input type="radio" id="lunar" name="solarLunar" value="음" />
				<label for="lunar"></label>음력
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
				<input type="text" name="email_id" style="width:200px; height:30px;" value="" /> @ 
				<input type="text" name="email_domain" style="width:200px; height:30px;" value="" />
				<select name="email_choice" style="width:100px; height:33px;">
					<option value="uni2">-직접입력-</option>
					<option value="ele">gmail.com</option>
					<option value="hig">naver.com</option>
					<option value="mid">hanmail.net</option>
					<option value="uni1">nate.com</option>
					<option value="uni2">yahoo.com</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>휴대전화</td>
				<td>
				<input type="text" name="mobile1" style="width:50px; height:30px;" maxlength="3" value="" /> - 
				<input type="text" name="mobile2" style="width:70px; height:30px;" maxlength="4" value="" /> - 
				<input type="text" name="mobile3" style="width:70px; height:30px;" maxlength="4" value="" />
				<br />
				</td>
			</tr>
			</table>
			<br/><br/><br/><br/><br/>


			<!-- <h2>부가정보<font color="#ff0000">(선택)</font></h2> -->
		<table align="center" border="0" style="border-collapse:collapse;"  cellpadding="5" cellspacing="0" width="90%" bgcolor="#f0f0f0">
		<colgroup>
			<col width="25%" />
			<col width="75%" />
		</colgroup>
			<tr>
				<td colspan="2" style="font-size:24px;">
					<strong>부가정보<span style="color:#ff0000;">(선택)</span></strong>
				</td>
			</tr>
			</table>

			<p align="center">
			<input class="btn" type="submit" value="회원가입하기" style="width:150px; height:80px; background-color:#4da495; color=white;" />
			</p>
		</form>
	</body>
</html>
