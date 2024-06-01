<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
String loginID = (String) session.getAttribute("loginID");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>KH정보교육원</title>
<link rel="stylesheet" href="./main-style.css?ver=4">
<link rel="stylesheet" href="./slideshow/slideshow-style.css">
<link rel="stylesheet" href="./submain-style.css?ver=4">
<script src="https://kit.fontawesome.com/8d66cd774b.js"
	crossorigin="anonymous"></script>
<script src="./js-main.js" defer></script>
<script src="./slideshow/js-slideshow.js"></script>
<script src="https://kit.fontawesome.com/8d66cd774b.js"
	crossorigin="anonymous"></script>
</head>
<body onload="call_js()">
	<div id="headfix">&nbsp;</div>
	<!-- top -->
	<header>
		<!-- right-top -->
		<nav class="right-top">
			<a href="./main.jsp"><span>Home</span></a> <a
				href="#"><span>Board</span></a> <a
				href="main.jsp?middleFile=modifyForm"><span><%=loginID%> 님 환영합니다.</span></a> <a
				href="logout.jsp"><span>로그아웃</span></a>
		</nav>
		<div class="head">
			<!-- left-top -->
			<div class="call">
				<a href="https://kh-academy.co.kr/question/online.kh?location=h"><img
					src="./source/rightquick07.png"></a>
				<div class="representativeTel">
					<a href="https://kh-academy.co.kr/question/online.kh?location=h"><span>1544-9970</span></a><br>
					<a href="https://kh-academy.co.kr/question/online.kh?location=h"><span>전국대표문의전화(연중무휴)</span></a>
				</div>
			</div>
			<h1>
				<a href="./main.jsp"><span>KH </span>정보교육원</a>
			</h1>
			<div>&nbsp;</div>
		</div>
		<!-- main-menu -->
		<nav id="mainMenuTitle">
			<ul onmouseover="displayMenu('mouseover')"
				onmouseout="displayMenu('mouseout')">
				<li>국비지원과정</li>
				<li>교육원소개</li>
				<li>취업지원센터</li>
				<li>프로젝트</li>
				<li>커뮤니티</li>
				<li>산학연계</li>
				<li>마이페이지</li>
				<li>상담센터</li>
			</ul>
		</nav>
		<nav id="mainMenuContent" onmouseover="displayMenu('mouseover')"
			onmouseout="displayMenu('mouseout')">
			<ul>
				<a href="https://kh-academy.co.kr/edu/curriculumDetailView.kh?no=2"><li>개발자
						양성과정</li></a>
				<a
					href="https://kh-academy.co.kr/edu/curriculumDetailView.kh?no=1&acq=security"><li>정보보안
						전문가</li></a>
				<a href="https://kh-academy.co.kr/edu/curriculumList_kdc.kh?acq=kdc"><li>K-디지털
						기초역량훈련</li></a>
				<a
					href="https://kh-academy.co.kr/edu/curriculumList.kh?no=5&acq=kdt"><li>K-디지털
						트레이닝</li></a>
				<a href="https://kh-academy.co.kr/intro/edu.kh"><li>개강일정</li></a>
				<a href="https://kh-academy.co.kr/edu/sub_2.jsp"><li>국비지원이란?</li></a>
				<a
					href="https://atentsgame.com/curriculumDetail.do?no=125&acq=drawing"><li>게임
						제작자 과정</li></a>
				<a href="https://kh-fx.com/curriculum.do"><li>영상 제작자 과정</li></a>
			</ul>
			<ul>
				<a href="https://kh-academy.co.kr/intro/KHoverview.kh"><li>About
						KH</li></a>
				<a href="https://kh-academy.co.kr/intro/intro.kh"><li>KH-Overview</li></a>
				<a href="https://kh-academy.co.kr/intro/history.kh"><li>걸어온길</li></a>
				<a href="https://kh-academy.co.kr/intro/teacher.kh"><li>강사소개</li></a>
				<a href="https://kh-academy.co.kr/work/jobSupport.kh"><li>상담선생님
						소개</li></a>
				<a href="https://kh-academy.co.kr/intro/businessAsk.kh"><li>사업
						제휴 문의</li></a>
				<a href="https://kh-academy.co.kr/intro/press.kh"><li>언론보도</li></a>
				<a href="https://kh-academy.co.kr/intro/educationInfo.kh"><li>시설안내</li></a>
				<a href="https://kh-academy.co.kr/intro/contact.kh"><li>오시는길</li></a>
				<a href="https://kh-academy.co.kr/intro/trecruit.kh"><li>강사
						구인</li></a>
			</ul>
			<ul>
				<a href="https://kh-academy.co.kr/work/system.kh"><li>취업
						프로세스</li></a>
				<a href="#"><li onclick="openBoardPage(event)">학사공지</li></a>
				<a href="https://kh-academy.co.kr/work/preInterview.kh"><li>기업모의면접</li></a>
				<a href="https://kh-academy.co.kr/work/companyLec.kh"><li>기업
						초청특강</li></a>
				<a href="https://kh-academy.co.kr/work/empl.kh"><li>취업현황</li></a>
				<a href="https://kh-academy.co.kr/recruit/collaborate.kh"><li>협력기업</li></a>
				<a href="https://kh-academy.co.kr/recruit/insertRecruitFrm.kh"><li>인재
						채용 문의</li></a>
			</ul>
			<ul>
				<a href="https://kh-academy.co.kr/project/classList.kh"><li>KH
						프로젝트</li></a>
				<a href="https://kh-academy.co.kr/project/team.kh"><li>수강생
						프로젝트</li></a>
			</ul>
			<ul>
				<a href="https://kh-academy.co.kr/community/notice.kh"><li>교육정보</li></a>
				<a href="https://kh-academy.co.kr/community/interview.kh"><li>수료생
						인터뷰</li></a>
				<a href="https://kh-academy.co.kr/community/phrase.kh"><li>수강후기</li></a>
				<a href="https://kh-academy.co.kr/community/khOn.kh"><li>KH
						채널 ON</li></a>
			</ul>
			<ul>
				<a href="https://kh-academy.co.kr/company/advice.kh"><li>기술자문위원</li></a>
				<a href="https://kh-academy.co.kr/company/company.kh"><li>실무자인터뷰</li></a>
				<a href="https://kh-academy.co.kr/company/industrialEdu.kh"><li>산학협력</li></a>
				<a href="https://kh-academy.co.kr/company/itSpecialLecture.kh"><li>IT특강</li></a>
			</ul>
			<ul>
				<a href="main.jsp?middleFile=modifyForm"><li>내정보수정하기</li></a>
				<a href="#"><li>내장바구니</li></a>
				<a href="main.jsp?middleFile=deleteForm"><li>회원탈퇴</li></a>
				<a href="logout.jsp"><li>로그아웃</li></a>
			</ul>
			<ul>
				<a href="https://kh-academy.co.kr/question/online.kh?location=h"><li>온라인
						상담</li></a>
				<a href="https://kh-academy.co.kr/question/simple.kh?location=h"><li>국비대상자
						간편조회</li></a>
				<a href="https://kh-academy.co.kr/question/visit.kh?location=h"><li>방문상담
						예약</li></a>
				<a href="https://kh-academy.co.kr/question/register.kh?location=h"><li>온라인
						수강신청</li></a>
				<a href="https://kh-academy.co.kr/question/faq.kh"><li>FAQ</li></a>
			</ul>
		</nav>
	</header>
	<!-- middle -->
	<section>
		<!-- sildshow -->
		<article>
			<div class="sildshow">
				<div class="slidshow_imgs">
					<a href="#"><img src="./source/computer1.jpg" alt="slide1"></a>
					<a href="#"><img src="./source/computer2.jpg" alt="slide2"></a>
					<a href="#"><img src="./source/computer3.jpg" alt="slide3"></a>
					<a href="#"><img src="./source/computer4.jpg" alt="slide4"></a>
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
		<article class="middle">