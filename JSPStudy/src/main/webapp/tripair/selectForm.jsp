<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>select Form</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/tripair/selectForm-style.css?ver=<%=(int)(Math.random()*1000)%>">
<script src="https://kit.fontawesome.com/8d66cd774b.js"	crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/tripair/js-tripair.js?ver=<%=(int)(Math.random()*1000)%>" defer></script>
</head>
<body>
<article class="tripAirSelect">
<h1 id="title">떠나고 싶을 때, 트립에어</h1>
 <form action="<%=request.getContextPath()%>/tripair/selectAirportProc.jsp" id="selectForm">
 		<div id="topSelectBox">
 		<i class="fa-solid fa-plane-departure"></i>
 		<select name="tripType" class="topSelectBox">
        <option value=1 selected>편도</option>
    </select>
    <i class="fa-solid fa-person"></i>
    <label for="count">인원수</label>
    <input type="number" id="count" name="count" value="1" min="1">
    <i class="fa-solid fa-cart-shopping"></i>
    <select name="seatType" class="topSelectBox">
        <option value="1" selected>일반석/비즈니스석</option>
    </select>
 		</div>
 		<div id="bottomSelectBox">
    <select name="depAirport_name" class="bottomSelect">
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
    <select name="arrAirport_name" class="bottomSelect">
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
    <button type="submit" id="searchBB" onclick="check()"><i class="fa-solid fa-magnifying-glass"></i>검색</button>
    </div>
 </form>
 </article>
 <%@ include file="/member/bottom.jsp"%>
</body>
</html>