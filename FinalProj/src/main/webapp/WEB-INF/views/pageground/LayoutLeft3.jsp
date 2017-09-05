<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="with=device-width, initial-scale=1" />
<link rel="stylesheet" href="../bootstrap3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="../bootstrap3.3.7/js/bootstrap.min.js"></script>

 <div class="container-left" style="width:200px; margin-top:100px;">
		<div class="panel-group" id="accordion">
			
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a href="#collapseAcc1" data-toggle="collapse" data-parent="#accordion">자유게시판</a>
					</h4>
				</div>
				<div id="collapseAcc1" class="pannel-collapse collapse in">
					<div class="panel-body">
						<code><a href="../col3/BoardList.jsp">모든 글이 자유☆</a></code><br />
					</div>
				</div>
			</div>
		
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a href="#collapseAcc2" data-toggle="collapse" data-parent="#accordion">작품자랑</a>
					</h4>
				</div>
				<div id="collapseAcc2" class="pannel-collapse collapse">
					<div class="panel-body">
						<code><a href="#">썰풀기</a></code><br />
						<code><a href="#">화백되기</a></code><br />
					</div>
				</div>
			</div>
			
		</div>
 </div>