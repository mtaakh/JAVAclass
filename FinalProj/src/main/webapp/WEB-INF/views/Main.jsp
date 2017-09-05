<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="with=device-width, initial-scale=1" />
<link rel="stylesheet" href="./bootstrap3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="./bootstrap3.3.7/js/bootstrap.min.js"></script>
<title>GadamPage</title>
<style>
	div{
		text-align:center;
		width:90%; height:400px;
		margin:5%;
	}
	#rect{
		
		background-color:black;
		/* 애니메이션을 적용하기 위한 속성 */
		animation-duration:1s;
		animation-timing-function:ease-in-out;
		animation-name:myani; /* 키프레임 애니메니션 이름 지정 */
		
		/*animation-iteration-count:5; /* 5회 진행*/
	}
	#second{
		color:#fbe3f1; font-weight:none; font-size:5em; font-family:Algerian;
		/* 애니메이션을 적용하기 위한 속성 */
		animation-duration:2s;
		animation-timing-function:ease-in-out;
		animation-name:second; /* 키프레임 애니메니션 이름 지정 */
	}

	/* 
		#rect에 키프레임 규칙 적용 : 이렇게 해야 애니메이션이 일어난다.
	*/
	@keyframes myani{
		from{ /* ~~로부터  */
			color:black;
		}
		50%{
			color:white;
		}
		to{ /* ~~까지 */
			color:gold;
		}
	}
	@keyframes second{
		from{ /* ~~로부터  */
			color:black;
		}
		50%{
			color:black;
		}
		to{ /* ~~까지 */
			color:#fbe3f1;
		}
	}

</style>
<script>
	
</script>
</head>
<body>
	<div class="container-fluid" style="background-color:black;" onclick="javascript:location.href='./col1/IntroPage.jsp';">
	<br /><br /><br />
		<span id="rect" style="color:gold; font-weight:bold; font-size:7em; margin-height:40px;">가담항설</span>
		<br /><br />
		<span id="rect" style="color:gold; font-size:1.7em;">길 위의 노래</span>
		<br /><br />
		<p id="second">fan-page</p>
	</div>
</body>
</html>