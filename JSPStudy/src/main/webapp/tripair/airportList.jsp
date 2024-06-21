<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="tripair.AirportDAO"%>
<%@ page import="tripair.AirportVO"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
String dep_plandtime = request.getParameter("dep_plandtime");
String depAirport_name = (String)session.getAttribute("depAirport_name");
String arrAirport_name = (String)session.getAttribute("arrAirport_name");
String tripType = (String)session.getAttribute("tripType"); //1.왕복 2.편도
int count = (Integer)session.getAttribute("count");

//항공권 정보 리스트 가져오기
AirportDAO dao = AirportDAO.getInstance();
Vector<AirportVO> depAirportList = dao.getAirportList(depAirport_name, arrAirport_name, dep_plandtime);
/* Vector<AirportVO> arrAirportList= null;
if(tripType.equals("1")){//1.왕복
	 arrAirportList = dao.getAirportList(arrAirport_name, depAirport_name, arr_plandtime);
} */
%>
<!DOCTYPE html>
<html>
<head>
<title>항공편</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/tripair/airportList-style.css?ver=<%=(int)(Math.random()*1000)%>">
<script src="<%=request.getContextPath()%>/tripair/slideshow/js-slideshow.js?ver=<%=(int)(Math.random()*1000)%>"></script>
<script src="https://kit.fontawesome.com/8d66cd774b.js"	crossorigin="anonymous"></script>
</head>
<body>
<table>
		<thead>
			<tr>
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
		if(depAirportList.isEmpty()){
			%>
			<tr>
				<td align="center" colspan="6">검색한 조건에 맞는 항공편이 없습니다.</td>
			</tr>
		<%
		}else{
			for (int i = 0; i < depAirportList.size(); i++) {
				AirportVO airportvo = depAirportList.elementAt(i);
						%>
						<tr onclick="location.href='<%=request.getContextPath()%>/tripair/prestigeCheckProc.jsp?airports_id=<%=airportvo.getAirports_id()%>'">
							<td><%=airportvo.getVihicle_id()%></td>
							<td><%=airportvo.getAirline_name()%></td>
							<td><%=airportvo.getDepAirport_name()%></td>
							<td><%=airportvo.getArrAirport_name()%></td>
							<td><%=airportvo.getDep_plandtime().substring(0, 16)%></td>
							<td><%=airportvo.getArr_plandtime().substring(0, 16)%></td>
							<td><%=airportvo.getEconomy_charge()*count%></td>
							<td><%=airportvo.getPrestige_charge()==0?"-":airportvo.getPrestige_charge()*count%></td>
					 </tr>
					 <%
		}//end of for
		}//end of else
		%>
		</table>
</body>
</html>