<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="tripair.AirportDAO"%>
<%@ page import="tripair.AirportVO"%>
<%@ page import="java.util.*"%>
<%
String depAirport_name = request.getParameter("depAirport_name");
String arrAirport_name = request.getParameter("arrAirport_name");
String dep_plandtime = request.getParameter("dep_plandtime");
dep_plandtime = dep_plandtime.replaceAll("-", "");
String airline_name = request.getParameter("airline_name");

//오픈 api에서 항공편 정보 불러오기
AirportDAO dao = AirportDAO.getInstance();
Vector<AirportVO> vecAirports = dao.selectAirport(depAirport_name, arrAirport_name, dep_plandtime, airline_name);
Vector<AirportVO> airportDataList = null;
int result = -1;
if (!vecAirports.isEmpty()) {
	//데이터베이스에 항공편 정보 저장하기
	result = dao.setAirportRegister(vecAirports);
%>
<script language="JavaScript">
	location.href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/tripair/airportList.jsp?depAirport_name=<%=depAirport_name%>&arrAirport_name=<%=arrAirport_name%>&dep_plandtime=<%=dep_plandtime%>&airline_name=<%=airline_name%>";
  </script>
<%
} 
%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
</body>
</html>