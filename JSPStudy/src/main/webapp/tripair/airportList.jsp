<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="tripair.AirportDAO"%>
<%@ page import="tripair.AirportVO"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
String depAirport_name = request.getParameter("depAirport_name");
String arrAirport_name = request.getParameter("arrAirport_name");
String dep_plandtime = request.getParameter("dep_plandtime");
String airline_name = request.getParameter("airline_name");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

AirportDAO dao = AirportDAO.getInstance();
Vector<AirportVO> airportDataList = dao.getAirportList(depAirport_name, arrAirport_name, dep_plandtime, airline_name);

%>
<!DOCTYPE html>
<html>
<head>
<title>항공편</title>
</head>
<body>
<h1 id="title">항공편 보기</h1>
<table>
		<thead>
			<tr>
				<td>항공권ID</td>
				<td>항공편명</td>
				<td>항공사명</td>
				<td>출발공항</td>
				<td>도착공항</td>
				<td>출발시간</td>
				<td>도착시간</td>
				<td>일반석운임</td>
				<td>비즈니스석운임</td>
			</tr>
		</thead>
		<%
		if(airportDataList.isEmpty()){
			%>
			<tr>
				<td align="center" colspan="6">검색한 조건에 맞는 항공편이 없습니다.</td>
			</tr>
		<%
		}else{
			for (int i = 0; i < airportDataList.size(); i++) {
				AirportVO airportvo = airportDataList.elementAt(i);
		%>
		<tr>
			<td><%=airportvo.getAirports_id()%></td>
			<td><%=airportvo.getVihicle_id()%></td>
			<td><%=airportvo.getAirline_name()%></td>
			<td><%=airportvo.getDepAirport_name()%></td>
			<td><%=airportvo.getArrAirport_name()%></td>
			<td><%=airportvo.getDep_plandtime()%></td>
			<td><%=airportvo.getArr_plandtime()%></td>
			<td><%=airportvo.getEconomy_charge()%></td>
			<td><%=airportvo.getPrestige_charge()%></td>
	 </tr>
</body>
</html>