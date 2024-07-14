<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="tripair.AirportDAO"%>
<%@ page import="tripair.AirportVO"%>
<%@ page import="java.util.*"%>
<%
//항공권 정보 리스트 가져오기
AirportDAO dao = AirportDAO.getInstance();
Vector<AirportVO> depAirportList = dao.getAirportTotalList();
%>
<!DOCTYPE html>
<html>
<head>
<title>Airport manage</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/tripair/airportList-style.css?ver=<%=(int)(Math.random()*1000)%>">
</head>
<body>
<h3>항공권 리스트</h3>
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
				<td></td>
			</tr>
		</thead>
		<%
		if(depAirportList.isEmpty()){
			%>
			<tr>
				<td align="center" colspan="6">항공편이 없습니다.</td>
			</tr>
		<%
		}else{
			for (int i = 0; i < depAirportList.size(); i++) {
				AirportVO airportvo = depAirportList.elementAt(i);
						%>
						<tr>
							<td><%=airportvo.getVihicle_id()%></td>
							<td><%=airportvo.getAirline_name()%></td>
							<td><%=airportvo.getDepAirport_name()%></td>
							<td><%=airportvo.getArrAirport_name()%></td>
							<td><%=airportvo.getDep_plandtime().substring(0, 16)%></td>
							<td><%=airportvo.getArr_plandtime().substring(0, 16)%></td>
							<td><%=airportvo.getEconomy_charge()%></td>
							<td><%=airportvo.getPrestige_charge()==0?"-":airportvo.getPrestige_charge()%></td>
							<td onclick="location.href='<%=request.getContextPath()%>/tripair/airportDeletePro.jsp?airports_id=<%=airportvo.getAirports_id()%>'">
							<i class="fa-regular fa-square-minus"></i></td>
					  </tr>
					 <%
		}//end of for
		}//end of else
		%>
		</table>
</body>
</html>