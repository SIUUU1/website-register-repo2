<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="tripair.AirportDAO"%>
<%@ page import="tripair.AirportVO"%>
<%@ page import="java.util.*"%>
<%
String tripType = request.getParameter("tripType"); //1.왕복 2.편도
int count = Integer.parseInt(request.getParameter("count"));
String seatType = request.getParameter("seatType"); //1.일반석 2. 일반/비즈니스 3. 비즈니스
String depAirport_name = request.getParameter("depAirport_name");
String arrAirport_name = request.getParameter("arrAirport_name");
String dep_plandtime = request.getParameter("dep_plandtime");
String arr_plandtime = request.getParameter("arr_plandtime");
dep_plandtime = dep_plandtime.replaceAll("-", "");
arr_plandtime = arr_plandtime.replaceAll("-", "");

session.setAttribute("tripType", tripType);
session.setAttribute("count", count);
session.setAttribute("depAirport_name", depAirport_name);
session.setAttribute("arrAirport_name", arrAirport_name);
session.setAttribute("arr_plandtime", arr_plandtime);

//항공편 정보 불러오기
AirportDAO dao = AirportDAO.getInstance();
Vector<AirportVO> depAirports = dao.selectAirport(depAirport_name, arrAirport_name, dep_plandtime);
//데이터베이스에 항공편 정보 저장하기
dao.setAirportRegister(depAirports);

Vector<AirportVO> arrAirports = null;
if (tripType.equals("1")) {
	arrAirports = dao.selectAirport(arrAirport_name, depAirport_name, arr_plandtime);
	//데이터베이스에 항공편 정보 저장하기
	dao.setAirportRegister(arrAirports);
}

%>
<script language="JavaScript">
location.href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/tripair/airportList.jsp?dep_plandtime=<%=dep_plandtime%>";
</script>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
</body>
</html>