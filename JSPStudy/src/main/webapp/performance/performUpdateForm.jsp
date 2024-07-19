<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="performance.PerformanceVO" %>
<%@ page import="performance.PerformanceDAO" %>
<%@ page import="java.util.*"%>
<%
int performance_id = Integer.parseInt(request.getParameter("performance_id"));
//공연 정보 가져오기
PerformanceDAO dao = PerformanceDAO.getInstance();
PerformanceVO pvo = dao.getPerformance(performance_id);
%>
<!DOCTYPE html>
<html>
<head>
<title>performance Update Form</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/performance/performanceRegForm-style.css?ver=<%=(int)(Math.random()*1000)%>">
</head>
<body>
<h1 id="title">공연 정보 수정</h1>
	<br>
	<form method="post" name="performUpdateForm"
		action="<%=request.getContextPath()%>/performance/performUpdateProc.jsp">
		<input type="hidden" name="performance_id" id="performance_id" value="<%=pvo.getPerformance_id()%>">
		<table>
			<tr>
				<th><label for="writer">공연이름</label></th>
				<td class="below"><input type="text" name="performance_name" id="performance_name" size="40" maxlength="40" value="<%=pvo.getPerformance_name()%>"></td>
			</tr>
			<tr>
				<th><label for="writer">공연장르</label></th>
				<td class="below"><input type="text" name="performance_genre" id="performance_genre" size="40" maxlength="40" value="<%=pvo.getPerformance_genre()%>"></td>
			</tr>
			<tr>
				<th><label for="writer">공연일</label></th>
				<td class="below"><input type="date" name="performance_day" id="performance_day" size="40" maxlength="40" value="<%=pvo.getPerformance_day()%>"></td>
			</tr>
			<tr>
				<th><label for="writer">공연장소</label></th>
				<td class="below"><input type="text" name="performance_venue" id="performance_venue" size="40" maxlength="40" value="<%=pvo.getPerformance_venue()%>"></td>
			</tr>
			<tr>
				<th><label for="writer">관람제한연령</label></th>
				<td class="below"><input type="number" name="performance_limit_age" id="performance_limit_age" size="40" maxlength="40" value="<%=pvo.getPerformance_limit_age()%>"></td>
			</tr>
			<tr>
				<th><label for="writer">총좌석수</label></th>
				<td class="below"><input type="number" name="performance_total_seats" id="performance_total_seats" size="40" maxlength="40" value="<%=pvo.getPerformance_total_seats()%>"></td>
			</tr>
			<tr>
				<th><label for="writer">티켓가격</label></th>
				<td class="below"><input type="number" name="performance_ticket_price" id="performance_ticket_price" size="40" maxlength="40" value="<%=pvo.getPerformance_ticket_price()%>"></td>
			</tr>
		</table>
		<div id="ticketButton">
			<button type="submit" id="subButton" onclick="writeCheck()">수정</button>
			<button type="button" id="subButton" onclick="location.href='<%=request.getContextPath()%>/performance/performDeleteProc.jsp?performance_id=<%=performance_id%>'">삭제</button>
			<a
				href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/performance/performanceList.jsp"><button type="button" id="cancleB">취소</button></a>
		</div>
	</form>
</body>
</html>