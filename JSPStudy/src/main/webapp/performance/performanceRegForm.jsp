<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>performance regForm</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/performance/performanceRegForm-style.css?ver=<%=(int)(Math.random()*1000)%>">
</head>
<body>
	<h1 id="title">공연 등록</h1>
	<form method="post" name="performRegForm"
		action="<%=request.getContextPath()%>/performance/performRegProc.jsp">
		<table>
			<tr>
				<th><label for="writer">공연이름</label></th>
				<td class="below"><input type="text" name="performance_name" id="performance_name" size="40" maxlength="40"></td>
			</tr>
			<tr>
				<th><label for="writer">공연장르</label></th>
				<td class="below"><input type="text" name="performance_genre" id="performance_genre" size="40" maxlength="40"></td>
			</tr>
			<tr>
				<th><label for="writer">공연일</label></th>
				<td class="below"><input type="date" name="performance_day" id="performance_day" size="40" maxlength="40"></td>
			</tr>
			<tr>
				<th><label for="writer">공연장소</label></th>
				<td class="below"><input type="text" name="performance_venue" id="performance_venue" size="40" maxlength="40"></td>
			</tr>
			<tr>
				<th><label for="writer">관람제한연령</label></th>
				<td class="below"><input type="number" name="performance_limit_age" id="performance_limit_age" size="40" maxlength="40"></td>
			</tr>
			<tr>
				<th><label for="writer">총좌석수</label></th>
				<td class="below"><input type="number" name="performance_total_seats" id="performance_total_seats" size="40" maxlength="40"></td>
			</tr>
			<tr>
				<th><label for="writer">티켓가격</label></th>
				<td class="below"><input type="number" name="performance_ticket_price" id="performance_ticket_price" size="40" maxlength="40"></td>
			</tr>
		</table>
		<div id="ticketButton">
			<button type="submit" id="subButton" onclick="writeCheck()">완료</button>
			<a href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/performance/performanceList.jsp">
				<button type="button" id="clearB">취소</button></a>
		</div>
	</form>
</body>
</html>