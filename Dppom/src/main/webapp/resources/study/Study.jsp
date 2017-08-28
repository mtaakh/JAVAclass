<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/layout/head.jsp" %>

        <link rel="stylesheet" href="./resources/assets/study/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="./resources/assets/study/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="./resources/assets/study/css/animate.css">
        <link rel="stylesheet" href="./resources/assets/study/css/magnific-popup.css">
        <link rel="stylesheet" href="./resources/assets/study/flexslider/flexslider.css">
        <link rel="stylesheet" href="./resources/assets/study/css/form-elements.css">
        <link rel="stylesheet" href="./resources/assets/study/css/style.css">
        <link rel="stylesheet" href="./resources/assets/study/css/media-queries.css">



<style>
.navbar-brand{
 color:#6173f4;
}
</style>
</head>

<title>Study</title>
<link rel="shortcut icon" href="./resources/bootstrap3.3.7/images/D.ico" />

<body>
<header role="banner" id="fh5co-header">
	
	<!--  TOP ( 메뉴 )  -->
		<%@ include file="/WEB-INF/layout/LayoutTop2.jsp" %>
		 
	<!-- TOP (E) -->
</header>
	
	
<div class="container">
<br /><br /><br /><br />
<div class="row row-bottom-padded-lg" id="about-us" >
	<div class="wrap_cont_necessary" >
              	<div class="col-md-12 section-heading text-center">
		<div class="row">
			<div class="col-md-8 col-md-offset-2 to-animate">
				<h3>정보수정 </h3>
			</div>
		</div>
	</div> 
</div>
<div>
<!-- Portfolio -->
        <div class="portfolio-container">
        	<!--  전체/어학/자격증 카테고리 -->
	        <div class="container">
	            <div class="row">
	            	<div class="col-sm-12 portfolio-filters wow fadeInLeft">
	            		<a href="#" class="filter-all active">All</a> / 
	            		<a href="#" class="filter-web-design">Web Design</a> / 
	            		<a href="#" class="filter-logo-design">Logo Design</a> / 
	            		<a href="#" class="filter-print-design">Print Design</a>
	            	</div>
	            </div>
	            <!-- ㄹㅇ -->
	            <div class="row">
	            	<div class="col-sm-12 portfolio-masonry">
		                <div class="portfolio-box web-design col-sm-3">
		                	<div class="portfolio-box-container">
			                	<img src="./resources/assets/img/portfolio/work1.jpg" alt="" data-at2x="./resources/assets/img/portfolio/work1.jpg">
			                	<div class="portfolio-box-text">
			                		<h3>Lorem Website</h3>
			                		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.</p>
			                	</div>
			                </div>
		                </div>
		                <div class="portfolio-box logo-design col-sm-3">
		                	<div class="portfolio-box-container portfolio-video" data-portfolio-big="http://vimeo.com/84910153?autoplay=0">
			                	<img src="assets/img/portfolio/work2.jpg" alt="" data-at2x="assets/img/portfolio/work2.jpg">
			                	<i class="portfolio-box-icon fa fa-play"></i>
		                		<div class="portfolio-box-text">
		                			<h3>Ipsum Logo</h3>
		                			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.</p>
		                		</div>
	                		</div>
		                </div>
		                <div class="portfolio-box print-design col-sm-3">
		                	<div class="portfolio-box-container">
			                	<img src="assets/img/portfolio/work3.jpg" alt="" data-at2x="assets/img/portfolio/work3.jpg">
		                		<div class="portfolio-box-text">
		                			<h3>Dolor Prints</h3>
		                			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.</p>
		                		</div>
	                		</div>
		                </div>
		                <div class="portfolio-box web-design col-sm-3">
		                	<div class="portfolio-box-container">
			                	<img src="assets/img/portfolio/work4.jpg" alt="" data-at2x="assets/img/portfolio/work4.jpg">
		                		<div class="portfolio-box-text">
		                			<h3>Sit Amet Website</h3>
		                			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.</p>
		                		</div>
	                		</div>
		                </div>
		                <!-- 반복 E  -->
		                <div class="portfolio-box logo-design col-sm-3">
		                	<div class="portfolio-box-container portfolio-video" data-portfolio-big="https://www.youtube.com/watch?v=tFTLxkMmY4M">
			                	<img src="assets/img/portfolio/work5.jpg" alt="" data-at2x="assets/img/portfolio/work5.jpg">
			                	<i class="portfolio-box-icon fa fa-play"></i>
		                		<div class="portfolio-box-text">
		                			<h3>Consectetur Logo</h3>
		                			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.</p>
		                		</div>
	                		</div>
		                </div>
		                <div class="portfolio-box print-design col-sm-3">
		                	<div class="portfolio-box-container">
			                	<img src="assets/img/portfolio/work6.jpg" alt="" data-at2x="assets/img/portfolio/work6.jpg">
		                		<div class="portfolio-box-text">
		                			<h3>Adipisicing Print</h3>
		                			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.</p>
		                		</div>
	                		</div>
		                </div>
		                <div class="portfolio-box web-design col-sm-3">
		                	<div class="portfolio-box-container portfolio-video" data-portfolio-big="http://vimeo.com/84910153?autoplay=0">
			                	<div class="embed-responsive embed-responsive-16by9">
		                    		<iframe class="embed-responsive-item" 
		                    			src="//player.vimeo.com/video/84910153?title=0&amp;byline=0&amp;portrait=0&amp;badge=0&amp;color=9d426b" 
		                    					webkitallowfullscreen mozallowfullscreen allowfullscreen>
		                    		</iframe>
		                    	</div>
		                		<div class="portfolio-box-text">
		                			<h3>Elit Website</h3>
		                			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.</p>
		                		</div>
	                		</div>
		                </div>
		                <div class="portfolio-box print-design col-sm-3">
		                	<div class="portfolio-box-container">
			                	<img src="assets/img/portfolio/work8.jpg" alt="" data-at2x="assets/img/portfolio/work8.jpg">
		                		<div class="portfolio-box-text">
		                			<h3>Sed Do Prints</h3>
		                			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.</p>
		                		</div>
	                		</div>
		                </div>
		                <div class="portfolio-box web-design col-sm-3">
		                	<div class="portfolio-box-container">
			                	<img src="assets/img/portfolio/work9.jpg" alt="" data-at2x="assets/img/portfolio/work9.jpg">
		                		<div class="portfolio-box-text">
		                			<h3>Eiusmod Website</h3>
		                			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.</p>
		                		</div>
	                		</div>
		                </div>
		                <div class="portfolio-box logo-design col-sm-3">
		                	<div class="portfolio-box-container portfolio-video" data-portfolio-big="https://www.youtube.com/watch?v=cfOa1a8hYP8">
		                		<div class="embed-responsive embed-responsive-16by9">
			                		<iframe class="embed-responsive-item" 
			                			src="//www.youtube.com/embed/cfOa1a8hYP8?rel=0&amp;controls=0&amp;showinfo=0" allowfullscreen>
			                		</iframe>
			                	</div>			                	
		                		<div class="portfolio-box-text">
		                			<h3>Tempor Logo</h3>
		                			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.</p>
		                		</div>
	                		</div>
		                </div>
		                <div class="portfolio-box web-design col-sm-3">
		                	<div class="portfolio-box-container">
			                	<img src="assets/img/portfolio/work11.jpg" alt="" data-at2x="assets/img/portfolio/work11.jpg">
		                		<div class="portfolio-box-text">
		                			<h3>Incididunt Website</h3>
		                			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.</p>
		                		</div>
	                		</div>
		                </div>
		                <div class="portfolio-box print-design col-sm-3">
		                	<div class="portfolio-box-container">
			                	<img src="assets/img/portfolio/work12.jpg" alt="" data-at2x="assets/img/portfolio/work12.jpg">
		                		<div class="portfolio-box-text">
		                			<h3>Ut Labore Print</h3>
		                			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.</p>
		                		</div>
	                		</div>
		                </div>
	                </div>
	            </div><!-- E -->
	        </div>
        </div>
        
        <script src="./resources/assets/js/jquery-1.11.1.min.js"></script>
        <script src="./resources/assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="./resources/assets/js/bootstrap-hover-dropdown.min.js"></script>
        <script src="./resources/assets/js/jquery.backstretch.min.js"></script>
        <script src="./resources/assets/js/wow.min.js"></script>
        <script src="./resources/assets/js/retina-1.1.0.min.js"></script>
        <script src="./resources/assets/js/jquery.magnific-popup.min.js"></script>
        <script src="./resources/assets/flexslider/jquery.flexslider-min.js"></script>
        <script src="./resources/assets/js/jflickrfeed.min.js"></script>
        <script src="./resources/assets/js/masonry.pkgd.min.js"></script>
        <script src="http://maps.google.com/maps/api/js?sensor=true"></script>
        <script src="./resources/assets/js/jquery.ui.map.min.js"></script>
        <script src="./resources/assets/js/scripts.js"></script>
        
        
        
        
        
		
	<!-- Botton (S) -->
	<%@ include file="/WEB-INF/layout/LayoutBottom.jsp" %>
	<!--  Bottom(E) -->
	
	

</body>
</html>