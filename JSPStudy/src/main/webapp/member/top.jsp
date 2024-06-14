<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Ticket World</title>
<link rel="stylesheet" href="<%=contextPath%>/member/main-style.css?ver=<%=(int)(Math.random()*1000)%>">
<script src="https://kit.fontawesome.com/8d66cd774b.js"	crossorigin="anonymous"></script>
<script src="<%=contextPath%>/member/js-main.js?ver=<%=(int)(Math.random()*1000)%>" defer></script>
</head>
<body onload="call_js()">
	<div id="headfix">&nbsp;</div>
	<!-- top -->
	<header>
		<!-- right-top -->
		<nav class="right-top">
			<a href="main.jsp"><span>Home</span></a> 
			<a href="main.jsp?middleFile=/board/boardList.jsp"><span>Board</span></a>
			<a href="main.jsp?middleFile=login.jsp"><span>로그인</span></a> <a
				href="main.jsp?middleFile=regForm.jsp"><span>회원가입</span></a>
		</nav>
		<div class="head">
			<!-- left-top -->
			<div class="call">
				<a href="main.jsp"><img src="./source/ticket.png" id="mainIcon"></a>
				<div class="representativeTel">
					<a href="main.jsp"><span>Ticket World</span></a><br>
				</div>
				<div class="search">
					<form action="performSearch.jsp" method="get" name="search">
	        <input type="text" size="40" maxlength="40" placeholder="원하는 공연을 찾아보세요" />
	        </form>
	        <div id="button-search">
	          <i class="fa-solid fa-magnifying-glass"></i>
	        </div>
        </div>
			</div>
		</div>
		<!-- main-menu -->
		<nav id="mainMenuTitle">
			<ul onmouseover="displayMenu('mouseover')"
				onmouseout="displayMenu('mouseout')">
				<li>티켓월드</li>
				<li>공연예매하기</li>
				<li>트립에어</li>
				<li>MD샵</li>
				<li>커뮤니티</li>
				<li>오픈공지</li>
				<li>마이페이지</li>
				<li>고객센터</li>
			</ul>
		</nav>
		<nav id="mainMenuContent" onmouseover="displayMenu('mouseover')"
			onmouseout="displayMenu('mouseout')">
			<ul>
				<a href="#"><li>About
						Ticket World</li></a>
				<a href="#"><li>Ticket World-Overview</li></a>
			</ul>
			<ul>
				<a href="#"><li>뮤지컬</li></a>
				<a href="#"><li>콘서트</li></a>
				<a href="#"><li>연극</li></a>
				<a href="#"><li>클래식/무용</li></a>
				<a href="#"><li>전시/행사</li></a>
			</ul>
			<ul>
				<a href="main.jsp?middleFile=/tripair/selectForm.jsp"><li>항공권예매</li></a>
				<a href="main.jsp?middleFile=/tripair/identifyForm.jsp"><li>예매항공권확인</li></a>
			</ul>
			<ul>
				<a href="#"><li>굿즈샵</li></a>
			</ul>
			<ul>
				<a href="#"><li>공연관람후기</li></a>
				<a href="#"><li>항공사별이용후기</li></a>
			</ul>
			<ul>
				<a href="#"><li>오픈공연공지</li></a>
			</ul>
			<ul>
				<a href="main.jsp?middleFile=login.jsp"><li>로그인</li></a>
				<a href="main.jsp?middleFile=regForm.jsp"><li>회원가입</li></a>
				<a href="https://kh-academy.co.kr/login/find.kh"><li>아이디/비밀번호
						찾기</li></a>
			</ul>
			<ul>
				<a href="main.jsp?middleFile=/board/boardList.jsp"><li>티켓월드 고객센터</li></a>
				<a href="#"><li>트립에어 고객센터</li></a>
			</ul>
		</nav>
	</header>
	<!-- middle -->
	<section>
		<article class="middle">