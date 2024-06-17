<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Ticket World</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/member/main-style.css?ver=<%=(int)(Math.random()*1000)%>">
<script src="<%=request.getContextPath()%>/member/js-main.js?ver=<%=(int)(Math.random()*1000)%>" defer></script>
<script src="https://kit.fontawesome.com/8d66cd774b.js" crossorigin="anonymous"></script>
</head>
<body onload="call_js()">
	<div id="headfix">&nbsp;</div>
	<!-- top -->
	<header>
		<!-- right-top -->
		<nav class="right-top">
			<a href="<%=request.getContextPath()%>/member/main.jsp"><span>Home</span></a>
		  <a href="<%=request.getContextPath()%>/member/main.jsp?middleFile=memberListForm.jsp"><span>회원관리</span></a> 
			<a href="<%=request.getContextPath()%>/member/logout.jsp"><span>로그아웃</span></a>
		</nav>
		<div class="head">
			<!-- left-top -->
			<div class="call">
				<a href="<%=request.getContextPath()%>/member/main.jsp"><img src="./source/ticket.png" id="mainIcon"></a>
				<div class="representativeTel">
					<a href="<%=request.getContextPath()%>/member/main.jsp"><span>Ticket World</span></a><br>
				</div>
				<div class="search">
					<form action="<%=request.getContextPath()%>/performance/performSearchPro.jsp" method="get" name="search">
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
				<li>메인페이지관리</li>
				<li>티켓월드관리</li>
				<li>트립에어관리</li>
				<li>MD샵관리</li>
				<li>커뮤니티관리</li>
				<li>오픈공연관리</li>
				<li>회원관리</li>
				<li>고객센터관리</li>
			</ul>
		</nav>
		<nav id="mainMenuContent" onmouseover="displayMenu('mouseover')"
			onmouseout="displayMenu('mouseout')">
		<ul>
				<a href="#"><li>About	Ticket World</li></a>
				<a href="#"><li>Ticket World-Overview</li></a>
			</ul>
			<ul>
				<a href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/performance/performanceList.jsp"><li>공연정보관리</li></a>
				<a href="#"><li>회원장바구니정보관리</li></a>
				<a href="#"><li>회원결제정보관리</li></a>
			</ul>
			<ul>
				<a href="#"><li>항공권정보관리</li></a>
				<a href="#"><li>항공권예매정보관리</li></a>
			</ul>
			<ul>
				<a href="#"><li>굿즈샵관리</li></a>
			</ul>
			<ul>
				<a href="#"><li>공연관람후기관리</li></a>
				<a href="#"><li>항공사이용후기관리</li></a>
			</ul>
			<ul>
				<a href="#"><li>오픈공연공지관리</li></a>
			</ul>
			<ul>
				<a href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/member/memberListForm.jsp"><li>회원관리하기</li></a>
			</ul>
			<ul>
				<a href="#"><li>티켓월드 고객센터</li></a>
				<a href="#"><li>트립에어 고객센터</li></a>
			</ul>
		</nav>
	</header>
	<!-- middle -->
	<section>
		<article class="middle">