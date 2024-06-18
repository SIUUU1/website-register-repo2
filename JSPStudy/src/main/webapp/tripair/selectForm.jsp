<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>select Form</title>
</head>
<body>
<h1 id="title">항공권예매하기</h1>
 <form action="<%=request.getContextPath()%>/tripair/selectAirportProc.jsp">
    <select name="depAirport_name">
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
    <select name="arrAirport_name">
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
    <select name="airline_name">
        <option value="AAR">아시아나항공</option>
        <option value="ABL">에어부산</option>
        <option value="ASV">에어서울</option>
        <option value="ESR">이스타항공</option>
        <option value="FGW">플라이강원</option>
        <option value="HGG">하이에어</option>
        <option value="JJA">제주항공</option>
        <option value="JNA">진에어</option>
        <option value="KAL">대한항공</option>
        <option value="TWB">티웨이항공</option>
    </select>
    <label for="dep_plandtime">출발날짜</label>
    <input type="date" name="dep_plandtime" id="dep_plandtime">
 <input type="submit" value="이동">
 </form>
</body>
</html>