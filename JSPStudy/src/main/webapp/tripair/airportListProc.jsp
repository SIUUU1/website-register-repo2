<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="tripair.AirportDAO"%>
<%@ page import="tripair.AirportVO"%>
<%@ page import="java.util.*"%>
<%
String depAirport_name = request.getParameter("depAirport_name");
String arrAirport_name = request.getParameter("arrAirport_name");
String dep_plandtime = request.getParameter("dep_plandtime");
String airline_name = request.getParameter("airline_name");
AirportDAO dao = AirportDAO.getInstance();
Vector<AirportVO> airportDataList = dao.getAirportList(depAirport_name, arrAirport_name, dep_plandtime);
%>
<!DOCTYPE html>
<html>
<head>
<title>airportList Procedure</title>
</head>
<body>

</body>
</html>