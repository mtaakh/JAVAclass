<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="with=device-width, initial-scale=1" />
<link rel="stylesheet" href="../bootstrap3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="../bootstrap3.3.7/js/bootstrap.min.js"></script>

 <div class="container-left" style="width:200px; margin-top:50px;">
	
		<div class="panel-group" id="accordion">
			
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a href="#collapseAcc1" data-toggle="collapse" data-parent="#accordion">이 사이트란?</a>
					</h4>
				</div>
				<!-- <div id="collapseAcc1" class="pannel-collapse collapse in">
					<div class="panel-body">
						이 사이트란?<br />
						href="#collapseAcc1" 과 id="collapseAcc1" 을 매칭시킴
					</div>
				</div> -->
			</div>
		
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a href="#collapseAcc2" data-toggle="collapse" data-parent="#accordion">작가 소개</a>
					</h4>
				</div>
				<div id="collapseAcc2" class="pannel-collapse collapse">
					<div class="panel-body">
						<code><a href="../col1/IntroAuthor.jsp">갓-랑또</a></code><br />
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a href="#collapseAcc3" data-toggle="collapse" data-parent="#accordion">작품 소개</a>
					</h4>
				</div>
				<div id="collapseAcc3" class="pannel-collapse collapse">
					<div class="panel-body">
						<code><a href="../col1/IntroWork.jsp">줄거리</a></code><br />
						<code><a href="../col1/IntroPeople.jsp">인물소개</a></code><br />
					</div>
				</div>
			</div>
		</div>
 </div>