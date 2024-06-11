<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
String loginID = (String) session.getAttribute("loginID");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Ticket World</title>
<link rel="stylesheet" href="./main-style.css?ver=<%=(int)(Math.random()*1000)%>">
<script src="./js-main.js?ver=<%=(int)(Math.random()*1000)%>" defer></script>
<script src="https://kit.fontawesome.com/8d66cd774b.js"
	crossorigin="anonymous"></script>
</head>
<body onload="call_js()">
	<div id="headfix">&nbsp;</div>
	<!-- top -->
	<header>
		<!-- right-top -->
		<nav class="right-top">
			<a href="main.jsp"><span>Home</span></a> 
			<a href="main.jsp?middleFile=/board/boardList.jsp"><span>Board</span></a> 
			<a href="main.jsp?middleFile=modifyForm.jsp"><span><%=loginID%> 님 환영합니다.</span></a>
			<a href="logout.jsp"><span>로그아웃</span></a>
		</nav>
		<div class="head">
			<!-- left-top -->
			<div class="call">
				<a href="#"><img
					src="./source/ticket.png" id="mainIcon"></a>
				<div class="representativeTel">
					<a href="main.jsp"><span>Ticket World</span></a><br>
				</div>
			</div>
			<h1>
				<!-- input tag insert -->
			</h1>
			<div>&nbsp;</div>
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
				<a href="#"><li>항공권예매</li></a>
				<a href="#"><li>예매항공권확인</li></a>
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
				<a href="#"><li>내장바구니</li></a>
				<a href="main.jsp?middleFile=modifyForm.jsp"><li>내정보수정하기</li></a>
				<a href="main.jsp?middleFile=deleteForm.jsp"><li>회원탈퇴</li></a>
				<a href="logout.jsp"><li>로그아웃</li></a>
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