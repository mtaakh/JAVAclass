<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>정보수정 페이지</title>
<link rel="shortcut icon" href="./resources/bootstrap3.3.7/images/D.ico" />

<link href="./resources/bootstrap3.3.7/css/join1.css" type="text/css" rel="stylesheet">
<link href="./resources/bootstrap3.3.7/css/join2.css" type="text/css" rel="stylesheet">
<link href="./resources/bootstrap3.3.7/css/join3.css" type="text/css" rel="stylesheet">
<link href="./resources/bootstrap3.3.7/css/join4.css" type="text/css" rel="stylesheet">
<link href="./resources/bootstrap3.3.7/css/join5.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@ include file="/WEB-INF/layout/head.jsp" %>
<style>
.navbar-brand{
 color:#6173f4;
}
</style>
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
      <div class="wrap_cont_necessary" >
                  <div class="col-md-12 section-heading text-center">
         <div class="row">
            <div class="col-md-8 col-md-offset-2 to-animate">
               <h3>정보수정 </h3>
            </div>
         </div>
      </div> 
            
   <div class="col-md-12 to-animate"  >
      <div class="text-center">
   <!-- 회원정보 폼 S -->
   <div id="wrap">      
   <h2 id="skip_cont" class="hide">컨텐츠영역</h2>
      <!-- 회원가입 -->
      <div class="wmp_join">
         <div class="join_banner">
              <map name="unitopbn8">
               </map>
         </div>
         <form id="frm" onSubmit="return false;" method="post" autocomplete="off"  style="margin-top:80px;">
            
            <fieldset>
               <input type="hidden" name="authType" id="authType" value=""/>
               <input type="hidden" name="u_name" id="u_name" value=""/>
               <input type="hidden" name="u_sex" id="u_sex" value=""/>
               <input type="hidden" name="u_birth" id="u_birth" value=""/>
               <input type="hidden" name="u_mobile" id="u_mobile" value=""/>
               <input type="hidden" name="u_ciscr_hash" id="u_ciscr_hash" value=""/>
               <input type="hidden" name="u_discr_hash" id="u_discr_hash" value=""/>
               <input type="hidden" name="u_discr_no" id="u_discr_no" value=""/>
               <input type="hidden" name="u_certificate_type" id="u_certificate_type" value=""/>
               <div class="join_content" >
               
               
                  <!-- 필수 정보 -->         
                     <div class="necessary_input" style="padding-right:20px; padding-left:20px;">
                   <!-- 정보 입력 공간 s -->
                   <table>
                   <div class="wrap_text_field"> <!-- 비밀번호 -->
                         <tr>   
                            <td>
                               <span style="font-size:1.5em;">새로운 비밀번호</span>
                            </td>
                            <td>
                               <div class="wrap_pass_field">
                                 <div class="clear_fix">                                 
                                    <input type="password" id="urepw" class="text_field" name="urepw" maxlength="15" style="width:213px; height:40px;" placeholder="비밀번호 재확인">
                                 </div>
                              </div>
                            </td>
                               
                         </tr>   
                         <tr>
                            <td>
                               <span style="font-size:1.5em;">비밀번호 확인</span>
                            </td>
                            <td>
                               <div class="wrap_pass_field">
                                 <div class="clear_fix">
                                    <input type="password" placeholder="비밀번호" id="upw" class="text_field" name="upw" maxlength="15" style="width:213px; height:40px;">
                                 </div>
                              </div>
                            </td>
                         </tr>
                      </div>    <!-- //비밀번호 -->
                      <tr>
                         <td>
                            <span style="font-size:1.5em;">이메일</span> 
                         </td>
                         <td>
                            <!-- 이메일 --> 
                           <div class="wrap_text_field">
                              <input type="text" id="uemail1" class="text_field" placeholder="이메일" dg-data="이메일" style="width:128px; height:40px; margin-top:5px;">&nbsp;&nbsp;&nbsp;
                              <span class="txt_mail" style="font-size:1.5em;">@</span>&nbsp;&nbsp;&nbsp;
                              <input type="text" id="uemail_direct" class="text_field" value="" style="width:128px; height:40px; margin-top:5px;">
                           </div>
                        <!-- //이메일 -->
                         </td>
                      </tr>
                         <!-- 이름, 휴대폰번호/기본 -->
                        <div class="wrap_text_field">
                            <tr>
                               <td>
                                  <span style="font-size:1.5em;">이름</span>
                               </td>
                               <td>
                                  <div class="wrap_name_field">
                                    <div class="clear_fix">
                                    <input type="text" id="uname" name="uname" class="text_field" style="width:213px; height:40px;" placeholder="이름 " dg-data="이름 " />
                                                                                                      </div>
                                    <p id="uname_error" class="help_block">이름을 입력해주세요.</p>
                                 </div>
                               </td>
                            </tr>
                            <tr>
                               <td>
                                  <span style="font-size:1.5em;">휴대전화</span>
                               </td>
                               <td>
                                  <div class="wrap_name_field">
                                    <input type="text" id="umobile" class="text_field" style="width:213px; height:40px;" maxlength="13" placeholder="휴대폰번호" dg-data="휴대폰번호" />
                                 </div>
                               </td>
                            </tr>
                      </div>
                        <!-- //이름, 휴대폰번호/기본 -->
                        
                        <!-- 학과 -->
                        <div class="wrap_text_field">
                            <tr>
                               <td>
                                  <span style="font-size:1.5em;">학교</span>
                               </td>
                               <td>
                                  <div class="wrap_pass_field">
                                    <div class="clear_fix">
                                       <input type="text" placeholder="학교" id="" class="text_field" name="" maxlength="15" style="width:213px; height:40px;">
                                    </div>
                                 </div>
                               </td>
                            </tr>
                            <tr>
                               <td>
                                  <span style="font-size:1.5em;">학과</span>
                               </td>
                               <td>
                                  <div class="wrap_pass_field">
                                    <div class="clear_fix">
                                       <input type="text" placeholder="학과" id="" class="text_field" name="" maxlength="15" style="width:213px; height:40px;">
                                    </div>
                                 </div>
                               </td>
                            </tr>
                         </div>
                        <!-- //학과 -->
                   </table>
                   <!-- 정보 입력 공간 e -->
                   <br />
                     
                     <div class="wrap_center_btn">
                        <button type="submit" id="joinConfirmBtn" class="btn_wmp_join btn_wmp_red btn_large">
                           <span class="inner">수정하기</span>
                        </button>
                     </div>
                     <br /><br />
                     <div class="wrap_center_btn" style="text-align:right">
                       	<a href="myOut">
                           <span class="inner" style="color:red;">탈퇴하기</span>
                        </a>
                     </div>
                  </div>
               </div>
               </div>
            </fieldset>
         </form>
         </div>
<!-- 회원정보 E  -->   
         </div>
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