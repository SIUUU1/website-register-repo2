<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>select Form</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/tripair/slideshow/slideshow-style.css?ver=<%=(int)(Math.random()*1000)%>">
<link rel="stylesheet" href="<%=request.getContextPath()%>/tripair/selectForm-style.css?ver=<%=(int)(Math.random()*1000)%>">
<script src="<%=request.getContextPath()%>/tripair/slideshow/js-slideshow.js?ver=<%=(int)(Math.random()*1000)%>"></script>
<script src="https://kit.fontawesome.com/8d66cd774b.js"	crossorigin="anonymous"></script>
</head>
<body>
<!-- sildshow -->
<article class="slideshow-box">
	<div class="sildshow">
		<div class="slidshow_imgs">
			<a href="#"><img src="<%=request.getContextPath()%>/tripair/source/trip01.jpg" alt="slide1"></a>
			<a href="#"><img src="<%=request.getContextPath()%>/tripair/source/trip02.jpg" alt="slide2"></a>
			<a href="#"><img src="<%=request.getContextPath()%>/tripair/source/trip03.jpg" alt="slide3"></a>
			<a href="#"><img src="<%=request.getContextPath()%>/tripair/source/trip04.jpg" alt="slide4"></a>
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
<article class="tripAirSelect">
<h1 id="title">떠나고 싶을 때, 트립에어</h1>
 <form action="<%=request.getContextPath()%>/tripair/selectAirportProc.jsp" id="selectForm">
    <select name="depAirport_name" class="airSelectBox">
    		<option disabled hidden selected>출발지</option>
        <option value="NAARKJB">무안</option>
        <option value="NAARKJJ">광주</option>
        <option value="NAARKJK">군산</option>
        <option value="NAARKJY">여수</option>
        <option value="NAARKNW">원주</option>
        <option value="NAARKNY">양양</option>
        <option value="NAARKPC">제주</option>
        <option value="NAARKPK">김해</option>
        <option value="NAARKPS">사천</option>
        <option value="NAARKPU">울산</option>
        <option value="NAARKSI">인천</option>
        <option value="NAARKSS">김포</option>
        <option value="NAARKTH">포항</option>
        <option value="NAARKTN">대구</option>
        <option value="NAARKTU">청주</option>
    </select>
    <i class="fa-solid fa-plane"></i>
    <select name="arrAirport_name" class="airSelectBox">
    		<option disabled hidden selected>도착지</option>
        <option value="NAARKJB">무안</option>
        <option value="NAARKJJ">광주</option>
        <option value="NAARKJK">군산</option>
        <option value="NAARKJY">여수</option>
        <option value="NAARKNW">원주</option>
        <option value="NAARKNY">양양</option>
        <option value="NAARKPC">제주</option>
        <option value="NAARKPK">김해</option>
        <option value="NAARKPS">사천</option>
        <option value="NAARKPU">울산</option>
        <option value="NAARKSI">인천</option>
        <option value="NAARKSS">김포</option>
        <option value="NAARKTH">포항</option>
        <option value="NAARKTN">대구</option>
        <option value="NAARKTU">청주</option>
    </select>
    <div id="timeBox">
    <input type="date" name="dep_plandtime" id="dep_plandtime">
    <i class="fa-solid fa-minus"></i>
    <input type="date" name="arr_plandtime" id="arr_plandtime">
    </div>
    <button type="submit" id="searchBB"><i class="fa-solid fa-magnifying-glass"></i>검색</button>
 </form>
 </article>
 <%@ include file="/member/bottom.jsp"%>
</body>
</html>