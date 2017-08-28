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
.btn:hover, .btn:active, .btn:focus{
 background:aliceblue !important;
 color:black;
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
               <h3>정보인증 </h3>
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
						   <tr>
						   		<td style="text-align:center;">
							    	<button class="btn" style="background-color:aliceblue;">학생증 업로드</button>
						   		</td>
						   		<td style="text-align:left;">
						   			파일명
						   		</td>
						   </tr>
						</div>
						<!-- //학과 -->
                   </table>
                   <!-- 정보 입력 공간 e -->
                   <br />
                     
                     <div class="wrap_center_btn">
                        <button type="submit" id="joinConfirmBtn" class="btn_wmp_join btn_wmp_red btn_large">
                           <span class="inner">인증하기</span>
                        </button>
                     </div>
                     <br /><br />                     
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