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
			<a href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/cart/cartList.jsp"><span>CART</span></a> 
			<a href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/member/modifyForm.jsp"><span><%=loginID%> 님 환영합니다.</span></a>
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
					<form action="<%=request.getContextPath()%>/performance/performSearchPro.jsp" method="get">
	        <input type="text" name="search" id="search" size="40" maxlength="40" placeholder="원하는 공연을 찾아보세요" />
	        <div id="button-search">
	          <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
	        </div>
	        </form>
        </div>
			</div>
		</div>
		<!-- main-menu -->
		<nav id="mainMenuTitle">
			<ul onmouseover="displayMenu('mouseover')"
				onmouseout="displayMenu('mouseout')">
				<li>공연예매</li>
				<li>트립에어</li>
				<li>커뮤니티</li>
				<li>장바구니</li>
				<li>마이페이지</li>
				<li>고객센터</li>
			</ul>
		</nav>
		<nav id="mainMenuContent" onmouseover="displayMenu('mouseover')"
			onmouseout="displayMenu('mouseout')">
			<ul>
				<a href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/performance/performanceTotalList.jsp?performance_genre=뮤지컬"><li>뮤지컬</li></a>
				<a href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/performance/performanceTotalList.jsp?performance_genre=콘서트"><li>콘서트</li></a>
				<a href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/performance/performanceTotalList.jsp?performance_genre=연극"><li>연극</li></a>
				<a href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/performance/performanceTotalList.jsp?performance_genre=클래식/무용"><li>클래식/무용</li></a>
			</ul>
			<ul>
				<a href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/tripair/selectForm.jsp"><li>항공권예매</li></a>
				<a href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/tripair/identifyForm.jsp"><li>예매항공권확인</li></a>
			</ul>
			<ul>
				<a href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/board/boardList.jsp"><li>게시판</li></a>
				<a href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/board/boardList.jsp"><li>공연관람후기</li></a>
			</ul>
			<ul>
				<a href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/cart/cartList.jsp"><li>장바구니</li></a>
				<a href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/payment/paymentTotalList.jsp"><li>공연결제내역</li></a>
				<a href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/tripair/currentPayment.jsp "><li>항공권결제내역</li></a>
			</ul>
			<ul>
				
				<a href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/member/modifyForm.jsp"><li>내정보수정하기</li></a>
				<a href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/member/deleteForm.jsp"><li>회원탈퇴</li></a>
				<a href="<%=request.getContextPath()%>/member/logout.jsp"><li>로그아웃</li></a>
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