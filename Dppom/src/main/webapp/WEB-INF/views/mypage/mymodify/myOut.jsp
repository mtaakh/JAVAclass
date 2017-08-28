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
em{color:red;}
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
               <h3>졸업안내</h3>
               <p>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</p>
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
      <div class="section_delete">
         <h3> 사용하고 계신 아이디(<em>session.getAttribute("id")</em>)는 탈퇴할 경우 재사용 및 복구가 불가능합니다. </h3>
         <p><em>탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가</em>하오니 신중하게 선택하시기 바랍니다.</p>
         <h3>탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</h3>
         <p>  회원정보 등 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.<br>삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.</p>
         탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.
         
         <h3>탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</h3>
         <p>올린 게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다.
         <br>삭제를 원하는 게시글이 있다면 <em>반드시 탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.</em>              
         <br>탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.
         탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.
         </p>
           
         <form name="fm" id ="fm" method="post" action="/user2/help/leaveId.nhn?m=viewInputUserInfo">
            <input type="hidden" name="token_help" value="EiXDb6AeIEsWm7X3" />
            <input type="hidden" name="lang" value="ko_KR" />
            <div>
               <p>
                  <strong>탈퇴 후에 아이디와 데이터는 복구할 수 없습니다.
                       <br> 게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다. 
                  </strong>
               </p>
               <input type="checkbox" id="dropoutAgree" name="dropoutAgree" onclick="" >
               <label for="dropoutAgree"><strong>안내 사항을 모두 확인하였으며, 이에 동의합니다.</strong></label>
            </div>
            <div>
               <p>
                  <a href="myOut2" id="" class=""><b>확인</b></a>
               </p>
            </div>            
         </form>
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