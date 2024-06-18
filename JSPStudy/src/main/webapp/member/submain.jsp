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
<!-- slideshow-bottom -->
<article class="slideshow-bottom">
	<div>
		<a href=""><img src="./source/icon1.PNG"><br> <span>온라인
				상담</span></a>
	</div>
	<div>
		<a href=""><img src="./source/icon2.PNG"><br> <span>국비대상자조회</span></a>
	</div>
	<div>
		<a href=""><img src="./source/icon3.PNG"><br> <span>방문상담
				예약</span></a>
	</div>
	<div>
		<a href=""><img src="./source/icon4.PNG"><br> <span>카카오
				상담</span></a>
	</div>
	<div class="call">
		<div id="call-icon">
			<a href="https://kh-academy.co.kr/question/online.kh?location=h"><img
				src="./source/rightquick07.png"></a>
		</div>
		<div class="representativeTel">
			<a href="https://kh-academy.co.kr/question/online.kh?location=h"><span>1544-9970</span></a><br>
			<a href="https://kh-academy.co.kr/question/online.kh?location=h"><span>전국대표문의전화(연중무휴)</span></a>
		</div>
	</div>
</article>
<article class="article2">
<h2>교육과정</h2>
<p class="subtitle">KH정보교육원만의 독보적인 커리큘럼을 만나보세요.</p>
<div class="article2-content">
	<div class="content1">
		<p class="content-engtitle1">Class Schedule</p>
		<p class="content-kortitle1">전제 개강일정</p>
		<p class="content-description1">
			IT, 게임제작, 영상제작 과정의 <br> 개강일정을 보실 수 있습니다.
		</p>
	</div>
	<div class="content6">
		<div>
			<p class="content-engtitle1">java Developers</p>
			<p class="content-kortitle1">S/W 개발자 과정</p>
			<p class="content-description1">
				개발자 취업을 위한 필수 지식과 <br> 기술을 이론과 실습을 통해 습득하는 <br> 과정입니다.
			</p>
		</div>
		<div>
			<p class="content-engtitle">K-Digital Training</p>
			<p class="content-kortitle">IaC기반 CDC엔지니어</p>
			<p class="content-description">
				실무 기반 프로젝트를 수행하고, <br> 고급 프로그래밍 기술과 문제해결 <br> 능력을 습득하는
				과정입니다. <br> <br>
			<div class="i-style">
				<i class="fa-solid fa-lock"></i>
			</div>
			</p>
		</div>
		<div>
			<p class="content-engtitle">K-디지털 기초역량훈련(KDC)</p>
			<p class="content-kortitle">C언어 핵심 요점 정리</p>
			<p class="content-description">
				언제 어디서든 업무와 훈련을 <br> 병행할 수 있도록 100%원격으로 <br> 운영됩니다. <br>
				<br>
			<div class="i-style">
				<i class="fa-solid fa-gear"></i>
			</div>
			</p>
		</div>
		<div>
			<p class="content-engtitle">아텐츠게임아카데미</p>
			<p class="content-kortitle">게임 제작자 과정</p>
			<p class="content-description">
				기초부터 포트폴리오까지 한걸음씩 <br> 성장하는 재미를 느낄 수 있는 <br> 게임 제작자 과정입니다.
				<br> <br>
			<div class="i-style">
				<i class="fa-solid fa-globe"></i>
			</div>
			</p>
		</div>
		<div>
			<p class="content-engtitle">KH영상아카데미</p>
			<p class="content-kortitle">영상 제작자 과정</p>
			<p class="content-description">
				기초부터 심화까지, <br> 누구나 배울수 있는 개인 맞춤형 <br> 실무 교육을 제공합니다. <br>
				<br>
			<div class="i-style">
				<i class="fa-brands fa-youtube"></i>
			</div>
			</p>
		</div>
		<div>
			<p class="content-engtitle1">Information Security</p>
			<p class="content-kortitle1">정보보안 전문자</p>
			<p class="content-description1">
				현엽에서 필요로한 기초 지식, <br> 대응 실력을 이론 수업과 프로젝트 <br> 실습을 통해 습득하는
				과정입니다.
			</p>
		</div>
	</div>
</div>
</article>
</body>
<%@ include file="bottom.jsp"%>