<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="apple-touch-icon" sizes="76x76" href="./resources/assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="./resources/assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />

<!--     Fonts and icons     -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />

<!-- CSS Files -->
<link href="./resources/assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="./resources/assets/css/material-kit.css" rel="stylesheet"/>

<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="./resources/assets/css/demo.css" rel="stylesheet" />
<title>로그인 폼</title>
<link rel="shortcut icon" href="./resources/bootstrap3.3.7/images/D.ico" />
<!--   Core JS Files   -->
<script src="./resources/assets/js/jquery.min.js" type="text/javascript"></script>
<script src="./resources/assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="./resources/assets/js/material.min.js"></script>
<style>
   .card .header-primary{background: linear-gradient(20deg, #d9e5ea, #1c609d);}
   #black{color:black;}
</style>
</head>
<body>
<div class="section section-full-screen section-signup" style="background-image: url('assets/img/city.jpg'); background-size: cover; background-position: top center; min-height: 700px;">
         <div class="container">
            <div class="row">
               <div class="col-sm-4 col-sm-offset-4">
                  <div class="card card-signup">
                     <form class="form" method="" action="">
                        <div class="header header-primary text-center">
                              <a href="Main" style="color:white; text-decoration:none" ><h2>패스워드 찾기</h2></a>
                        </div>
                        <br /><br />
                        <div class="content">
                           <div class="input-group">
                              <span class="input-group-addon">
                                 <i class="material-icons">face</i>
                              </span>
                              <input type="text" class="form-control" placeholder="아이디">
                           </div>

                           <div class="input-group">
                              <span class="input-group-addon">
                                 <i class="material-icons">email</i>
                              </span>
                              <input type="text" placeholder="이메일" class="form-control" />
                           </div>
                           <div class="input-group">
                              <span class="input-group-addon">
                                 <i class="material-icons">live_help</i>
                              </span>
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
                           <div class="input-group">
                              <span class="input-group-addon">
                                 <i class="material-icons">vpn_key</i>
                              </span>
                              <input type="text" placeholder="답변" class="form-control" />
                           </div>
                        </div>
                        <div class="footer text-center">
                           <a href="#pablo" id="black" class="btn btn-simple btn-primary btn-lg">패스워드 찾기</a>
                        </div>
                     </form>
                  </div>
               </div>
            </div>
         </div>
      </div>
</body>
   
</html>