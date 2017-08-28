<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

   <head>
   <%@ include file="/WEB-INF/layout/head.jsp" %>
   <meta name="description" content="This is a free Bootstrap landing page theme created for BootstrapZero. Feature video background and one page design." />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="generator" content="Codeply">
    <link rel="stylesheet" href="./resources/siteinfo/css/bootstrap.min.css" />
    <link rel="stylesheet" href="./resources/siteinfo/css/animate.min.css" />
    <link rel="stylesheet" href="./resources/siteinfo/css/ionicons.min.css" />
    <link rel="stylesheet" href="./resources/siteinfo/css/styles.css" />
    <!--scripts loaded here -->
    <script src="./resources/siteinfo/js/jquery.min.js"></script>
    <script src="./resources/siteinfo/js/bootstrap.min.js"></script>
    <script src="./resources/siteinfo/js/jquery.easing.min.js"></script>
    <script src="./resources/siteinfo/js/wow.js"></script>
    <script src="./resources/siteinfo/js/scripts.js"></script>
   </head>
   
   <title>大PPOM 커뮤니티사이트 사이트소개</title>
   <link rel="shortcut icon" href="./resources/bootstrap3.3.7/images/D.ico" />
    
   <body>
   <header role="banner" id="fh5co-header">
   
   <!--  TOP ( 메뉴 )  -->
      <%@ include file="/WEB-INF/layout/LayoutTop.jsp" %>
       
   <!-- TOP (E) -->
   </header>
   <br /><br />

<!-- 슬라이더  -->
    <section class="container-fluid" id="four">
        <div class="row">
            <div class="col-xs-10 col-xs-offset-1 col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4">
                <div class="row" id="team">
               <div class="col-md-12 section-heading text-center to-animate">
                  <h2 style="font-style:Source Sans Pro, Arial, sans-serif">ABOUT</h2>   
               </div>
            </div>
                <div class="media wow fadeInRight">
                    <h3>大PPOM로고</h3>
                    <div class="media-body media-middle">
                        <p>우리 사이트는 대학교 뽐내기를 줄여 大PPOM이라고 지었습니다.</p>
                    </div>
                    <div class="media-right">
                        <i class="icon-lg ion-ios-heart-outline"></i>
                    </div>
                </div>
                <hr>
                <div class="media wow fadeIn">
                    <h3>소개</h3>
                    <div class="media-left">
                        <i class="icon-lg ion-ios-heart-outline"></i>
                    </div>
                    <div class="media-body media-middle">
                        <p>대학교 생활을 하는 모든 대학생들이 한 공간에 모여서 함께 소통하는 사이트를 만들었습니다.</p>
                    </div>
                </div>
                <hr>
                <div class="media wow fadeInRight">
                    <h3>제작자들</h3>
                    <div class="media-body media-middle">
                        <p>IKOSMO 26기 원미, 민수, 종건, 미영</p>
                    </div>
                    <div class="media-right">
                        <i class="icon-lg ion-ios-heart-outline"></i>
                    </div>
                </div>
                <hr>
                <div class="media wow fadeIn">
                    <h3>간단한 기능들</h3>
                    <div class="media-left">
                        <i class="icon-lg ion-ios-heart-outline"></i>
                    </div>
                    <div class="media-body media-middle">
                        <p>후기게시판, 자료실, 사람찾기, 등등</p>
                    </div>
                </div>
                <hr>
                <div class="media wow fadeInRight">
                    <h3>포인트 기능</h3>
                    <div class="media-body media-middle">
                        <p>포인트를 모아 원하는 자료를 다운받을 수 있습니다.</p>
                    </div>
                    <div class="media-right">
                        <i class="icon-lg ion-ios-heart-outline"></i>
                    </div>
                </div>
            </div>
        </div>
    </section>
      
   <!-- Botton (S) -->
   <%@ include file="/WEB-INF/layout/LayoutBottom.jsp" %>
   
   <!--  Bottom(E) -->
   

   </body>
</html>

