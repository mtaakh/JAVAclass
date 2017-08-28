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
               <h3>비밀번호 재확인</h3>
               <p>안전한 네이버 사용을 위해 비밀번호를 다시 한 번 입력해주세요.</p>
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
      <div class="section_pwconfirm">
         <div class="spc_header">
         </div>
         <form id="fm" name="fm" action="myOut3" method="post" onSubmit="return mainSubmit();">
         <input type="hidden" id="token_help" name="token_help" value="aVBTbXjqpE9RJUR0" />
         <input type="hidden" id="encPasswd" name="encPasswd">
         <input type="hidden" id="encNm" name="encNm">
         <div class="spc_content">
            <fieldset>
                <p class="spc_row"><span class="txt_userid">session.getAttribute("id")</span></p>
               <p class="spc_row2">
                  <label id="lb_upw" for="upw">비밀번호</label>
                  <input type="password" id="upw" name="upw" maxlength="20"
                         onkeyup="checkShiftUp(event);" 
                         onFocus="convertDiv('upw', 'none')"
                         onBlur="convertDiv('upw', 'block');hideCapsLock('help2_1');"                
                         onkeypress="capslock(event);showCapslock();" 
                         onkeydown="checkShiftDown(event);" style="width:336px">

                  <!-- [D] 감추기 보이기 display:none/block -->
                  <span id="help2_1" class="ly_msg_arrow" style="display:none">
                     <span class="txt">
                            키보드에 <strong>Caps Lock</strong>이 켜져 있습니다.
                       </span>
                     <span class="arrow"></span>
                  </span>
               </p>
               <p>
                  <button type="submit">확인</button>
               </p>
            </fieldset>
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