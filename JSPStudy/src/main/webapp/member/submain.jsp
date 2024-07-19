<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html lang="ko">
<head>
<link rel="stylesheet" href="./slideshow/slideshow-style.css?ver=<%=(int)(Math.random()*1000)%>">
<link rel="stylesheet" href="./submain-style.css?ver=<%=(int)(Math.random()*1000)%>">
<script src="./slideshow/js-slideshow.js?ver=<%=(int)(Math.random()*1000)%>"></script>
<script src="https://kit.fontawesome.com/8d66cd774b.js"	crossorigin="anonymous"></script>
</head>
<body>
<!-- sildshow -->
<article class="slideshow-box">
	<div class="sildshow">
		<div class="slidshow_imgs">
			<a href="#"><img src="./source/performance12.jpg" alt="slide1"></a>
			<a href="#"><img src="./source/performance11.jpg" alt="slide2"></a>
			<a href="#"><img src="./source/performance14.jpg" alt="slide3"></a>
			<a href="#"><img src="./source/performance13.jpg" alt="slide4"></a>
		</div>
		<div class="slidshow_nav">
			<a href="#" id="prev"><i class="fa-solid fa-angles-left"></i></a> <a
				href="#" id="next"><i class="fa-solid fa-angles-right"></i></a>
		</div>
		<div class="indicator">
			<a href="#" class="active"><i class="fa-solid fa-circle"></i></a> <a
				href="#"><i class="fa-solid fa-circle"></i></a> <a href="#"><i
				class="fa-solid fa-circle"></i></a> <a href="#"><i
				class="fa-solid fa-circle"></i></a>
		</div>
	</div>
</article>
<article class="article2">
<h2>티켓오픈</h2>
<div class="article2-content">
	<div class="content1">
		<p class="content-engtitle1">Classic</p>
		<p class="content-kortitle1">손열음 랩소디인블루</p>
		<p class="content-description1">
			2024-09-16 <br> 올림픽공원 88잔디마당
		</p>
	</div>
	<div class="content6">
		<div>
			<p class="content-engtitle1">Classic</p>
			<p class="content-kortitle1">차이코프스키를 위하여</p>
			<p class="content-description1">
				2024-09-09 <br> 예술의전당 콘서트홀
			</p>
		</div>
		<div>
			<p class="content-engtitle">Concert</p>
			<p class="content-kortitle">두아 리파 내한공연</p>
			<p class="content-description">
				2024-12-13 <br> 고척스카이돔
			</p>
		</div>
		<div>
			<p class="content-engtitle">Musical</p>
			<p class="content-kortitle">하데스타운</p>
			<p class="content-description">
				2024-08-09 <br> 샤롯데씨어터 
				<br>
			</p>
		</div>
		<div>
			<p class="content-engtitle">Musical</p>
			<p class="content-kortitle">베르사유의 장미</p>
			<p class="content-description">
				2024-09-27 <br> 충무아트센터 대극장
			</p>
		</div>
		<div>
			<p class="content-engtitle">Opera</p>
			<p class="content-kortitle">투란도트 아레나 디베로나</p>
			<p class="content-description">
				2024-08-22 <br> 올림픽체조경기장
			</p>
		</div>
		<div>
			<p class="content-engtitle1">Classic</p>
			<p class="content-kortitle1">라 바야데르</p>
			<p class="content-description1">
				2024-09-12 <br> 예술의전당 오페라극장 
			</p>
		</div>
	</div>
</div>
</article>
</body>
<%@ include file="bottom.jsp"%>