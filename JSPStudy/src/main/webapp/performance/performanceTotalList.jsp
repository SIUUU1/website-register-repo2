<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="performance.PerformanceVO" %>
<%@ page import="performance.PerformanceDAO" %>
<%@ page import="java.util.*"%>
<%
String performance_genre = request.getParameter("performance_genre");
//공연 정보 리스트 가져오기
PerformanceDAO dao = PerformanceDAO.getInstance();
int count = 0;
count = dao.getPerformance_Count(performance_genre);
%>
<!DOCTYPE html>
<html>
<head>
<title>공연리스트</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/performance/performanceTotalList-style.css?ver=<%=(int)(Math.random()*1000)%>">
</head>
<body>
<h1 id="title">공연리스트</h1>
<form>
<table>
		<thead>
			<tr>
				<td>공연명</td>
				<td>장르</td>
				<td>공연일</td>
				<td>장소</td>
				<td>제한연령</td>
				<td>잔여좌석/총좌석</td>
				<td>티켓가격</td>
			</tr>
		</thead>
		<%
		if(count==0){
			%>
			<tr>
				<td align="center" colspan="6">등록된 공연 정보가 없습니다.</td>
			</tr>
		<%
		}else{
			Vector<PerformanceVO> performanceList = dao.getPerformanceTotalList(performance_genre);
			for (int i = 0; i < performanceList.size(); i++) {
		%>
	<tr onclick="location.href='<%=request.getContextPath()%>/member/main.jsp?middleFile=/cart/seatForm.jsp?performance_id=<%=performanceList.get(i).getPerformance_id()%>'">
			<td><%=performanceList.get(i).getPerformance_name()%></td>
			<td><%=performanceList.get(i).getPerformance_genre()%></td>
			<td><%=performanceList.get(i).getPerformance_day()%></td>
			<td><%=performanceList.get(i).getPerformance_venue()%></td>
			<td><%=performanceList.get(i).getPerformance_limit_age()%></td>
			<td><%=performanceList.get(i).calcRemainingSeat()%>/<%=performanceList.get(i).getPerformance_total_seats()%></td>
			<td><%=performanceList.get(i).getPerformance_ticket_price()%></td>
	 </tr>
 <%
		}//end of for
		}//end of else
		%>
		</table>
		</form>
</body>
</html>