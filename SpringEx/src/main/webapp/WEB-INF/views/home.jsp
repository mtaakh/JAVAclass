<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>SPRING MVC</title>
	
	<!-- SyntaxHighlighter 사용하기s -->
	<script src="./resources/syntaxhigh/scripts/shCore.js"></script>
	<script src="./resources/syntaxhigh/scripts/shBrushJava.js"></script>
	<script src="./resources/syntaxhigh/scripts/shBrushCss.js"></script>
	<link type="text/css" rel="stylesheet" href="./resources/syntaxhigh/styles/shCore.css" />
	<link type="text/css" rel="stylesheet" href="./resources/syntaxhigh/styles/shCoreRDark.css" />
	<script>
		SyntaxHighlighter.all();
	</script>
	<!-- SuntaxHighlighter 사용하기e -->
</head>
<body>
<h1>
	Spring MVC 둘러보기
</h1>

<P>  The time on the server is ${serverTime}. </P>

	<fieldset>
		<legend>MVC 기초와 컨트롤러</legend>
		<ul>
			<li><a href="./helloSpring">First MVC</a></li>
		</ul>
		
		<h3>Form 데이터</h3>
		<ul>
			<li><a href="./form/servletRequest?id=kosmo&pw=1234">/form/servletRequest</a></li>
			<li>
				<a href="./form/requestParam?name=홍길동&id=hong&pw=9999&email=hong@gildong.com">/form/requestParam</a>
			</li>
			<li>
				<a href="./form/simpleGet?name=홍길동&id=hong&pw=9999&email=hong@gildong.com">/form/simpleGet[폼값 한번에받기]</a>
			</li>
			<li>
				<a href="./form/GilDong100">@PathVariable을 이용해서 폼값받기</a>
			</li>
		</ul>
		
		<h3>@RequestMapping 어노테이션</h3>
		<ul>
			<li>
				<a href="requestMapping/index">시작페이지 가기</a>
			</li>
		</ul>
		
		<h3>폼 데이터 검증</h3>
		<ul>
			<li>
				<a href="validate/memberForm">회원가입 바로가기</a>
			</li>
		</ul>
		
		<h3>Spring board</h3>
		<ul>
			<li><a href="board/list.do">리스트 바로가기</a></li>
		</ul>
		
		<h3>트랜젝션(Transaction)</h3>
		<h4 style="color:orange;">
			주의: 트랜젝션 예제는 동시에 동작되지 않음. 컨트롤러에서 @Controller를 주석처리하며 개별적으로 테스트 해야함
		</h4>
		<ul>
			<li><a href="transaction/buyTicketYesTS.do">트랜젝션 처리없이 구매하기</a></li>
			<li><a href="transaction/buyTicketYesTS.do">트랜젝션 처리후 구매하기</a></li>
			<li><a href="transaction/buyTicketTSTemplate.do">트랜젝션 템플릿 사용하기</a></li>
		</ul>
		
		<h3>Mybatis 게시판</h3>
		<ul>
			<li><a href="mybatis/list.do">리스트 바로가기</a></li>
		</ul>
		
		<h3>로그인(Session 이용)</h3>
		<ul>
			<li><a href="login/login.html">로그인 바로가기</a></li>
		</ul>
		
		
	</fieldset>

	<h2>기본 경로 사용해서 이미지 표시하기</h2>
	<!-- servlet-context.xml 기본 엘리먼트 
		<resources mapping="/resources/**" location="/resources/" />에서 사용 
	-->
	<div>
		<ul>
			<li>경로1 : ./resources/1.jpg</li>
			<li> <img src="./resources/1.jpg" alt="1번이미지" /> </li>
		</ul>
	</div>
	<!-- resources 폴더는 기본경로이므로 하위에 추가적으로 생성하는 경로는 별도의 설정없이 사용가능 -->
	<div>
		<ul>
			<li>경로2 : ./resources/images/2.jpg</li>
			<li> <img src="./resources/images/2.jpg" alt="2번이미지" /> </li>
		</ul>
	</div>
	<!-- resources 폴더와 동일한 depth(깊이)에 경로를 추가할 경우에는 servlet-context.xml에 추가해야 할 것이 있음
		<resources mapping="/my_image/**" location="/my_image/" />
		※ 모든 변경과정 후에는 반드시 서버를 재시작해야함
	-->
	<div>
		<ul>
			<li>경로3 : ./my_image/3.jpg</li>
			<li> <img src="./my_image/3.jpg" alt="3번이미지" /> </li>
		</ul>
	</div>
	
	<h2>SyntaxHighlighter 사용하기</h2>
	<h3>JAVA 코드 샘플 : 5번줄 하이라이트 처리</h3>
<pre class="brush:java; highlight:[2,5]">
class HelloWorld
{
	public static void main(String[] args)
	{
		System.out.println("Welcome to JAVA");
		System.out.println("Hello World");
	}
}
</pre>
	<h3>CSS 코드 샘플 : 3번줄 하이라이트 처리</h3>
<pre class="brush:css highlight:[3]">
*{
	margin:0px; padding:0px;
	font-family:Tahoma;
}
div.Wrap{
	width:90%;
	margin:0 auto; /* 가운데 정렬 */
	text-align:center; /* 위 마진이 적용되지 않는 브라우저를 대비 */
}
</pre>	
	
</body>
</html>
