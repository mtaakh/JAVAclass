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
<title>졸 업 ㅠ ㅠ </title>
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
      
   <!-- My Page(메뉴) -->
   
   <%@ include file="/WEB-INF/layout/LayoutMyPage.jsp" %>
   
   <!-- My Page(메뉴) E  -->
      

   <div class="row row-bottom-padded-lg" id="about-us" >
      <div class="col-md-12 section-heading text-center">
         <div class="row">
            <div class="col-md-8 col-md-offset-2 to-animate">
               <h3>회원탈퇴 신청</h3>
               <p>그동안 大PPOM을 이용해 주셔서 감사합니다.</p>
            </div>
         </div>
      </div>
            
   <div class="col-md-12 to-animate"  >
      <div class="text-center">
   <!-- 회원정보 폼 S -->      
<div id="container">
      <!-- CONTENTS -->
      <!-- CONTENTS -->
<div id="content">
   <div class="c_header">
   </div>
   <div>
      <div>
         <h3>탈퇴아이디 확인</h3>
      </div>
      <table class="text-center;" width="100%">
         <tr>
            <td>아이디 : session.getAttribute("id")</td>
         </tr>
         <tr>
            <td>이름 : session.getAttribute("name")</td>
         </tr>
      </table>
      <br />
      <div>
         <h3>大PPOM을 탈퇴하시는 이유는 무엇인가요?</h3>
         <p>회원님께서 大PPOM을 탈퇴하는 이유를 알려주시면 보다 좋은 서비스 제공을 위해 노력하겠습니다.</p>
      </div>

      <form action="/user2/help/leaveId.nhn?m=actionLeaveId"  name="fm" id="fm" method="post">
         <input type="hidden" name="token_help" value="aVBTbXjqpE9RJUR0" />
         <input type="hidden" name="proc" value="" />
         <input type="hidden" name="nv_id" value="pudingchutest" />
         
         <div>
            <!-- [D] 감추기 보이기 display:block/none -->
            <div class="txtbox_w" id="div_proposal" style="display:block">
               <textarea type="text" name="proposal" id="proposal" title="탈퇴 사유 입력" 
                      cols="40" rows="2"></textarea>
            </div>
         </div>
         <div>
            <p class="btn_area">
               <br /><br />
               <a href="Main" onclick="" class="btn_model"><b>탈퇴확인</b></a>
               <a href="#" onclick="" class="btn_model"><b>탈퇴취소</b></a>
            </p>
         </div>
      </form>
   </div>
</div>
   </div>
<!-- 회원정보 E  -->   
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