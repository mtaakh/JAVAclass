<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>대뽐!!</title>
<link rel="shortcut icon" href="./resources/bootstrap3.3.7/images/D.ico" />

<link href="./resources/bootstrap3.3.7/css/join1.css" type="text/css" rel="stylesheet">
<link href="./resources/bootstrap3.3.7/css/join2.css" type="text/css" rel="stylesheet">
<link href="./resources/bootstrap3.3.7/css/join3.css" type="text/css" rel="stylesheet">
<link href="./resources/bootstrap3.3.7/css/join4.css" type="text/css" rel="stylesheet">
<link href="./resources/bootstrap3.3.7/css/join5.css" type="text/css" rel="stylesheet">

<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />

<!--     Fonts and icons     -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />

<!-- CSS Files -->
<link href="./resources/assets/css/modal.css" rel="stylesheet" />
<link href="./resources/assets/css/material-kit.css" rel="stylesheet"/>
   
<style>
   #btn_small_color{background-color:yellowgreen;}
   #btn_content_color{background-color:yellowgreen;}
   .inner{font-family:Tahoma;}
</style>
<!--   Core JS Files   -->
<script src="./resources/assets/js/jquery.min.js" type="text/javascript"></script>
<script src="./resources/assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="./resources/assets/js/material.min.js"></script>
<script type="text/javascript">
var isBusinessUser = 0;

$(function() {
   // 브라우저 종류, 버전 체크
   if($.browser.msie) {
      $('body').attr("id", "ie").attr("class", "ie"+version_data[0]);
   } else if($.browser.webkit) {
      $('body').attr("id", "cr").attr("class", "cr"+version_data[0]);
   } else if($.browser.mozilla) {
      $('body').attr("id", "ff").attr("class", "ff"+version_data[0]);
   } else {
      $('body').attr("id", "other").attr("class", "other"+version_data[0]);
   }

   // IE8일 경우 INPUT FOCUS BUG 해결
   if(($.browser.msie == true) && (version_data[0] <= 8)) {
      $('input').focus().blur();
   }

   for (var i = new Date().getFullYear() - 14; i > 1909; i--) {
      $('#select_year').append('<a href="javascript:void(0);" dg-data="'+i+'">'+i+'</a>');
   }
   for (i = 1; i < 13; i++) {
      $('#select_month').append('<a href="javascript:void(0);" dg-data="'+i+'">'+i+'</a>');
   }
   updateNumberOfDays();

   // SELECT BOX
   var search_name = 0;
   var $selectArea = $('[data-id="select_area"]');

   $('[data-id="select_active"]').bind('click', function(e) {
      $this = $(this);
      $this.parent().toggleClass('unfold');
      $selectArea.not($this.parent()).removeClass('unfold');
      e.stopPropagation();
   });

   $(document).bind('click', function(e){
      if ($(e.target).parents('[data-id="select_area"]').length == 0) {
         $selectArea.removeClass('unfold');
      }
   });

   $('[data-id="select_list"] a').bind('click', function() {
      $this = $(this);
      search_name = $(this).attr('dg-data');

      $this.parent().find('[data-id="selected"]').removeClass('selected').removeAttr('data-id');
      $this.addClass('selected').attr('data-id','selected');
      $this.parents('[data-id="select_area"]').children('a').attr('dg-data',search_name).text(search_name);
      $this.parents('[data-id="select_area"]').removeClass('unfold');

      if ($this.parents('[data-id="select_area"]').children('a').attr('id') == 'selected_year' || $this.parents('[data-id="select_area"]').children('a').attr('id') == 'selected_month'){
         updateNumberOfDays();
      }

      if ($this.parents('[data-id="select_area"]').children('a').attr('id') == 'uemail2') {
         var uemail2 = $('#uemail2').attr('dg-data');
         if($this.index() == 0) {
            $('#uemail_direct').val('').attr('disabled', false).focus();
         } else {
            $('#uemail_direct').val(uemail2).attr('disabled', true);
         }
         displayHide("uemail_error");
         email_dup_check();
      }
   });

   $(':radio[name="select_sex"]').click(function() {
      var sex = $(':radio[name="select_sex"]:checked').val();
      if(sex != undefined) {
         $('#sex_error').hide();
      }
   });

   // 160405 #MOBILE-997
   // app푸시동의 여부를 약관에 녹이기, 해당 영역 제거
   /*$('[data-id="agree_event_select_all"]').click(function() {
      setTimeout(function() {
         if ($('[data-id="agree_event_select_all"]').attr('checked') == true) {
            $('[data-id="check_agree_event"]').attr('checked', true);
         } else {
            $('[data-id="check_agree_event"]').attr('checked', false);
         }
      }, 50);
   });

   $('[data-id="check_agree_event"]').each(function() {
      $(this).change(function() {
         if ($('[data-id="check_agree_event"]').length == $('[data-id="check_agree_event"]:checked').length) {
            $('[data-id="agree_event_select_all"]').attr('checked', true);
         } else {
            $('[data-id="agree_event_select_all"]').attr('checked', false);
         }
      });
   });*/

   // 선택항목 전체동의
   $('[data-id="agree_optional_info_select_all"]').click(function() {
      $('#sex_error').hide();
      $('#birth_error').hide();

      setTimeout(function() {
         if ($('[data-id="agree_optional_info_select_all"]').attr('checked') == true) {
            var day = $('#selected_day').attr('dg-data');
            var month = $('#selected_month').attr('dg-data');
            var year = $('#selected_year').attr('dg-data');
            if(isNaN(day) || isNaN(month) || isNaN(year)) {
               $('#birth_error').show();
            }

            var sex = $(':radio[name="select_sex"]:checked').val();
            if(sex == undefined) {
               $('#sex_error').show();
            }

            $('[data-id="check_agree_optional_info"]').attr('checked', true);
         } else {
            $('[data-id="check_agree_optional_info"]').attr('checked', false);
         }
      }, 50);
   });

   $('[data-id="check_agree_optional_info"]').each(function() {
      $(this).change(function() {
         if ($('[data-id="check_agree_optional_info"]').length == $('[data-id="check_agree_optional_info"]:checked').length) {
            $('[data-id="agree_optional_info_select_all"]').attr('checked', true);
         } else {
            $('[data-id="agree_optional_info_select_all"]').attr('checked', false);
         }

         if($('#agree_sex')[0].checked) {
            var sex = $(':radio[name="select_sex"]:checked').val();
            if(sex == undefined) {
               $('#sex_error').show();
            }
         } else {
            $('#sex_error').hide();
         }

         if (!isBusinessUser) {
            if($('#agree_birth')[0].checked) {
               var day = $('#selected_day').attr('dg-data');
               var month = $('#selected_month').attr('dg-data');
               var year = $('#selected_year').attr('dg-data');
               if(isNaN(day) || isNaN(month) || isNaN(year)) {
                  $('#birth_error').show();
               }
            } else {
               $('#birth_error').hide();
            }
         }
      });
   });

   // INPUT
   var sel_text = '';
   $('input').bind('focus blur', function(event) {
      sel_text = $(this).attr('dg-data');

      if((event.type == 'focus') && ($(this).val() == '이메일') || ($(this).val() == '이름 ') || ($(this).val() == '담당자 이름') || ($(this).val() == '휴대폰번호') || ($(this).val() == '인증번호') || ($(this).val() == '아이디')) {
         $(this).removeClass('off').val('');
      } else if((event.type == 'blur') && ($(this).val() == '')) {
         $(this).addClass('off').val(sel_text);
      }
   });

   // 이메일 대문자 입력시 소문자 변경
   $('#uemail1, #uemail_direct').bind('keyup', function() {
      if(navigator.userAgent.match(/Trident\/7\./)) {
         $(this).val(function (_, v) {
            return v.replace(/\s+/g, '').toLowerCase();
         });
      } else {
         var val = $(this).val();
         var pattern = /\s+/g;
         if (val.match(pattern)) {
            var pos = $(this).caret();
            pos = (pos > 0) ? pos - 1 : 0;
            $(this).val(function (_, v) {
               return v.replace(pattern, '');
            });
            $(this).caret(pos);
         }

         if (val != val.toLowerCase()) {
            var pos = $(this).caret();
            pos = (pos > 0) ? pos : 0;
            $(this).val(function (_, v) {
               return v.toLowerCase();
            });
            $(this).caret(pos);
         }
      }
   });
});
</script>
</head>

<body onLoad="return false;">
<div id="wmpSkip">
   <a href="#header" onclick="skipNavigation('#header');return false;"><span>메뉴 바로가기</span></a>
   <a href="#container" onclick="skipNavigation('#container');return false;"><span>본문 바로가기</span></a>
</div>
<div id="wrap">
   <div id="container">
      <h2 id="skip_cont" class="hide">컨텐츠영역</h2>
      <!-- 회원가입 -->
      <div class="wmp_join">
         <div class="join_banner">
             <map name="unitopbn8"></map>
         </div>
         <form id="frm" onSubmit="return false;" method="post" autocomplete="off">
            <fieldset>
               <legend>회원가입</legend>
               <input type="hidden" name="authType" id="authType" value=""/>
               <input type="hidden" name="u_name" id="u_name" value=""/>
               <input type="hidden" name="u_sex" id="u_sex" value=""/>
               <input type="hidden" name="u_birth" id="u_birth" value=""/>
               <input type="hidden" name="u_mobile" id="u_mobile" value=""/>
               <input type="hidden" name="u_ciscr_hash" id="u_ciscr_hash" value=""/>
               <input type="hidden" name="u_discr_hash" id="u_discr_hash" value=""/>
               <input type="hidden" name="u_discr_no" id="u_discr_no" value=""/>
               <input type="hidden" name="u_certificate_type" id="u_certificate_type" value=""/>
               <div class="join_content">
                  <!-- 필수 정보 -->
                  <div class="wrap_cont_necessary">
                     <h1 class="text-center" style="font-size:50px; color:green;">
                     <a href="Main">大 PPOM</a></h1>

                     
                     <h4 class="tit_wmp_join tit_join_necessary mg-section-sm">필수 정보</h4>
                     <div class="necessary_input">
                     
                        <div class="wrap_text_field">
                           <input type="text" placeholder="아이디" id="id" class="text_field" name="id" maxlength="15" style="width:213px;">
                           <span>&nbsp;&nbsp;&nbsp;아이디 중복결과</span>
                           &nbsp;&nbsp;
                           <button type="button" class="btn_wmp_join btn_wmp_red" id="skyblue">
                              <span class="inner">중복확인</span>
                           </button>
                        </div>
                                                                        <!-- 비밀번호 -->
                        <div class="wrap_text_field">
                           <input type="text" placeholder="비밀번호" id="id" class="text_field" name="id" maxlength="15" style="width:213px;">
                           <span style="line-height:39px; padding:2px 8px 0 0; color:red;">&nbsp;&nbsp;&nbsp;비밀번호 일치여부</span>
                           &nbsp;&nbsp;
                        </div>
                        <div class="wrap_text_field">
                           <div class="wrap_pass_field">
                              <div class="clear_fix">
                                 <input type="password" placeholder="비밀번호재확인" id="urepw" class="text_field" name="upw" maxlength="15" style="width:213px;">
                              </div>
                           </div>
                        </div>
                        
                        <!-- 비밀번호 찾기 질문 & 답 -->
                        <div class="wrap_text_field">
                           <div class="wrap_pass_field">
                              <div class="clear_fix">
                                 <select id="passHint" style="width:234px; height:40px;">
                                 	<option value="">비밀번호 찾기 질문</option>
                                 	<option value="1">여자친구 이름은?</option>
                                 	<option value="2">첫사랑 이름은?</option>
                                 	<option value="3">나의 가장 소중한 보물은?</option>
                                 	<option value="4">당신이 나온 학교이름은?</option>
                                 	<option value="5">당신의 보유 자산은?</option>
                                 	<option value="6">당신이 살고 싶은 도시는?</option>
                                 </select>
                              </div>
                           </div>
                        </div>
                        <div class="wrap_text_field">
                           <div class="wrap_pass_field">
                              <div class="clear_fix">
                                 <input type="text" placeholder="답변" id="passAnswer" class="text_field" style="width:455px;">
                              </div>
                           </div>
                        </div>
                        
                        <!-- //비밀번호 -->
                                                <!-- 이메일 -->
                        <div class="wrap_text_field">
                           <input type="text" id="uemail1" class="text_field" placeholder="이메일" dg-data="이메일" style="width:128px;">
                           <span class="txt_mail">@</span>
                           <input type="text" id="uemail_direct" class="text_field" value="" style="width:128px;">
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           <button type="button" id="joinConfirmBtn" class="btn_wmp_join btn_wmp_red">
                              <span class="inner">인증하기</span>
                           </button>
                        </div>
                        <p class="help_block help_block_notice ico_dot" id="mobile_notice">이메일은 아이디 또는 비밀번호를 찾기 위한 정보이므로 정확하게 입력해 주세요.</p>
                        <!-- //이메일 -->
                        <!-- 이름, 휴대폰번호/기본 -->
                        <div class="wrap_text_field">
                           <div class="wrap_name_field">
                              <div class="clear_fix">
                                 <input type="text" id="uname" name="uname" class="text_field" style="width:213px;" placeholder="이름" dg-data="이름 " />
                              </div>
                              <p id="uname_error" class="help_block">이름을 입력해주세요.</p>
                           </div>
                           <div class="wrap_name_field">
                              <input type="text" id="umobile" class="text_field" style="width:213px;" maxlength="13" placeholder="휴대폰번호" dg-data="휴대폰번호" />
                           </div>
                        </div>
                        <div class="help_box" id="div_sms_auth_overlap" style="display:none;">
                           <p class="help_txt_red"><span id="sms_overlap_id"></span> 아이디로 가입된 휴대폰번호입니다.</p>
                           <ul class="login_area">
                              <li><a href="javascript:void(0);" id="btn_login">로그인</a></li>
                              <li><a href="javascript:void(0);" id="btn_search_pw">비밀번호 찾기</a></li>
                           </ul>
                           <span class="help_txt_black">새로 가입하시려면, 휴대폰 점유인증을 해주세요.</span>
                           <button type="button" class="btn_wmp_join btn_wmp_white btn_small" id="btn_sms_send">
                              <span class="inner">인증번호 받기</span>
                           </button>
                        </div>
                        <div class="help_box" id="div_sms_auth" style='display:none;'>
                           <div class="wrap_text_field">
                              <input type="text" id="txt_sms_auth" class="text_field" style="width:200px;" value="인증번호" dg-data="인증번호">
                              <button type="button" class="btn_wmp_join btn_certification btn_wmp_red" id="btn_sms_auth">
                                 <span class="inner_small">인증하기</span>
                              </button>
                              <button type="button" class="btn_wmp_join btn_certification btn_wmp_gray" id="btn_sms_reAuth">
                                 <span class="inner_small">재발송</span>
                              </button>
                              <input type="hidden" id='join_sms_hidden' />
                           </div>
                           <div class="time_area" id="umobile_error">
                              <span class="help_txt_black">인증번호가 전송되었습니다.</span>
                              <span class="help_txt_red">남은 시간 04:59</span>
                           </div>
                        </div>
                        <div class="help_box" id="div_sms_auth_complete" style='display:none;'>
                           <span class="help_txt_black">휴대폰 점유인증이 완료되었습니다. 가입을 진행해 주세요.</span>
                           <button type="button" class="btn_wmp_join btn_wmp_white btn_small" id="btn_sms_auth_cancel">
                              <span class="inner">인증 취소</span>
                           </button>
                        </div>
                                                <!-- //이름, 휴대폰번호/기본 -->
                        <!-- 학과 -->
                        <div class="wrap_text_field">
                           <div class="wrap_pass_field">
                              <div class="clear_fix">
                                 <input type="text" placeholder="학교" id="" class="text_field" name="" maxlength="15" style="width:213px;">
                              </div>
                           </div>
                           <div class="wrap_pass_field">
                              <div class="clear_fix">
                                 <input type="text" placeholder="학과" id="" class="text_field" name="" maxlength="15" style="width:213px;">
                              </div>
                           </div>
                        </div>
                        <!-- //학과 -->
                        
                                                <!-- 이용약관동의 -->
                        <div class="wrap_text_field wrap_agree_area">
                           <div class="wrap_check_agree">
                              <div class="row" id="modals">
                                  <div class="col-sm-6">
                                    <strong>이용약관 동의</strong>
                                   <a data-toggle="modal" href="#myModal" id="btn_small_color" class="btn_wmp_join btn_wmp_white btn_small">
                                      <span class="inner" id="btn_content_color">내용보기</span>
                                   </a>
                                 </div>
                                 <div class="col-sm-6">
                                   <div class="wrap_check_agree">
                                       <label>
                                          <input type="radio" class="check" name="agree" value="1" disabled/>
                                                동의
                                       </label>
                                    </div>
                                    <div class="wrap_check_agree">
                                       <label>
                                          <input type="radio" class="check" name="agree" value="2" disabled/>
                                                거절
                                       </label>
                                    </div>
                                 </div>
                             </div>
                            </div>
                        </div>
                        <div class="container">
                        <p class="help_block help_block_notice ico_dot">본 약관에는 마케팅 정보 수신에 대한 동의에 관한 내용이 포함되어 있으며, 회원은 언제든지 정보 메시지 수신 설정 메뉴에서 수신 거부로 변경할 수 있습니다.</p>
                        <p class="help_block">이용약관동의 여부를 체크해주세요.</p>
                        <!-- //이용약관동의 -->
                        <!-- 개인정보 수집 및 이용안내 -->
                        <p class="tit_wmp_join tit_agree_collecting">개인정보 수집 및 이용안내</p>
                        <table summary="개인정보 수집 및 이용안내 목적, 항목, 보유 및 이용기간에 대한 정보 제공">
                           <caption>개인정보 수집 및 이용안내</caption>
                           <colgroup>
                              <col width="34%" />
                              <col width="33%" />
                              <col width="33%" />
                           </colgroup>
                           <thead>
                              <tr>
                                 <th>
                                       목적
                                 </th>
                                 <th>
                                       항목
                                 </th>
                                 <th>
                                       보유 및 이용 기간
                                 </th>
                              </tr>
                           </thead>
                           <tbody>
                              <tr>
                                 <td>
                                       이용자 식별,<br/> 서비스 이용 및 상담
                                 </td>
                                 <td>
                                       이름, 이메일,<br/>비밀번호, 전화번호
                                 </td>
                                                                                                   <td>
                                       회원탈퇴 후 5일 까지
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                        <!-- //개인정보 수집 및 이용안내 -->
                        </div>
                  </div>
                  <!-- //필수 정보 -->
                  <!-- 부가 정보 -->
<!--                   <div class="wrap_cont_select"> -->
<!--                      <h4 class="tit_wmp_join tit_join_select">부가 정보</h4> -->
<!--                                           성별, 전체동의 -->
<!--                      <div class="wrap_text_field wrap_agree_area"> -->
<!--                         <div class="select_sex"> -->
<!--                            <span class="txt_sex">성별</span> -->
<!--                            <div class="wrap_check_agree"> -->
<!--                               <label> -->
<!--                                  <input type="radio" class="check" name="select_sex" value="1" /> -->
<!--                                  남자 -->
<!--                               </label> -->
<!--                            </div> -->
<!--                            <div class="wrap_check_agree"> -->
<!--                               <label> -->
<!--                                  <input type="radio" class="check" name="select_sex" value="2" /> -->
<!--                                  여자 -->
<!--                               </label> -->
<!--                            </div> -->
<!--                            <p id="sex_error" class="help_block">성별 정보를 입력해주세요.</p> -->
<!--                         </div> -->
<!--                      </div> -->
                     <!-- //성별, 전체동의 -->
                     <!-- 선택항목 전체동의 동의 -->
<!--                      <div class="wrap_text_field wrap_agree_area"> -->
<!--                         <div class="wrap_check_agree"> -->
<!--                            <label> -->
<!--                               <input type="checkbox" class="check" data-id="agree_optional_info_select_all" /> -->
<!--                               <strong>전체동의</strong> -->
<!--                            </label> -->
<!--                                                       <span> -->
<!--                               ( -->
<!--                               <label> -->
<!--                                  <input type="checkbox" id="agree_sex" data-id="check_agree_optional_info" class="check" name="agree_sex"> -->
<!--                                  성별 수집동의 -->
<!--                               </label> -->
<!--                            </span> -->
<!--                            <span> -->
<!--                               <label> -->
<!--                                  <input type="checkbox" id="agree_birth" data-id="check_agree_optional_info" class="check" name="agree_birth"> -->
<!--                                  생년월일 수집동의 ) -->
<!--                               </label> -->
<!--                            </span> -->
<!--                                                                               </div> -->
<!--                      </div> -->
                     <!-- //선택항목 전체동의 동의 -->
<!--                      <p class="help_block_notice_red"> 선택항목은 동의하지 않아도 회원가입이 가능하며, 원하는 항목만 동의할 수 있습니다.</p> -->
                     <!-- 개인정보 수집 및 이용안내 -->
<!--                      <p class="tit_wmp_join tit_agree_collecting">개인정보 수집 및 이용안내</p> -->
<!--                      <table summary="개인정보 수집 및 이용안내 목적, 항목, 보유 및 이용기간에 대한 정보 제공"> -->
<%--                         <caption>개인정보 수집 및 이용안내</caption> --%>
<%--                         <colgruop> --%>
<%--                            <col width="34%" /> --%>
<%--                            <col width="33%" /> --%>
<%--                            <col width="33%" /> --%>
<%--                         </colgruop> --%>
<!--                         <thead> -->
<!--                            <tr> -->
<!--                               <th> -->
<!--                                  목적 -->
<!--                               </th> -->
<!--                               <th> -->
<!--                                  항목 -->
<!--                               </th> -->
<!--                               <th> -->
<!--                                  보유 및 이용 기간 -->
<!--                               </th> -->
<!--                            </tr> -->
<!--                         </thead> -->
<!--                         <tbody> -->
<!--                            <tr> -->
<!--                               <td> -->
<!--                                  맞춤형 상품 추천 등<br/>마케팅 활용 -->
<!--                               </td> -->
<!--                               <td> -->
<!--                                  성별, 생년월일                                                                </td> -->
<!--                               <td> -->
<!--                                  회원탈퇴 후 5일 까지 -->
<!--                               </td> -->
<!--                            </tr> -->
<!--                         </tbody> -->
<!--                      </table> -->
<!--                      //개인정보 수집 및 이용안내 -->
                     <div class="wrap_center_btn">
                        <button type="submit" id="joinConfirmBtn" class="btn_wmp_join btn_wmp_red btn_large">
                           <span class="inner">동의하고 회원가입</span>
                        </button>
                     </div>
                     <br /><br /><br />
<!--                   </div> -->
                  <!-- //선택 항목 -->
               </div>
            </fieldset>
         </form>
      </div>
      <!-- //회원가입 -->
   </div>
   <!-- // container -->
   </div> 
<!-- Sart Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <h4 class="modal-title">이용약관</h4>
         </div>
         <div class="modal-body">
            <p>
               <%@ include file="/WEB-INF/layout/agreement.jsp" %>
            </p>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default btn-simple">동의</button>
            <button type="button" class="btn btn-danger btn-simple" data-dismiss="modal">거절</button>
         </div>
      </div>
   </div>
</div>
<!--  End Modal -->
</body>
</html>