<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="performance.PerformanceDAO" %>
<%@ page import="java.util.*"%>
<%
int p_seat = 0; // 선택 가능한 좌석
int s_seat = 1; // 선택된 좌석
int n_seat = 9; // 선택할 수 없는 좌석
int performance_id = Integer.parseInt(request.getParameter("performance_id"));
int[][] seat = null;

//좌석정보 가져오기
PerformanceDAO pDao = PerformanceDAO.getInstance();
seat = pDao.getPerformanceSeats(performance_id);
if(seat==null){
	%>
	<script language="JavaScript">
		alert("데이터베이스 오류입니다.");
		history.go(-1);
	</script>
	<%
}else{
	request.setAttribute("seat", seat);
	%>
	<html>
<head>
<title>cart register form</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/cart/seatForm-style.css?ver=<%=(int)(Math.random()*1000)%>">
</head>
<body>
	<h1 id="title">무대</h1>
	<form action="<%=request.getContextPath()%>/cart/cartRegProc.jsp" method="post" name="seatForm">
	<input type="hidden" name="performance_id" value="<%=performance_id%>">
		<table>
	<%
	char ch = 'A';
	for (int i = 0; i < seat.length; i++) {
		%>
		<tr><td>
		<%
		for (int j = 0; j < seat[i].length; j++) {
			switch (seat[i][j]) {
			case 0:
				%>
				<input type="checkbox" class="p_seat" id="<%=(char)(ch + i)%><%=j+1%>" name="p_seat" value="<%=(char)(ch + i)%><%=j+1%>">
				<label for="<%=(char)(ch + i)%><%=j+1%>"></label>
				<%
				break;
			default:
				%>
				<input type="checkbox" class="s_seat" id="<%=(char)(ch + i)%><%=j+1%>" onClick="return false">
				<label for="<%=(char)(ch + i)%><%=j+1%>"></label>
				<%
				break;
			}
		}
		%>
		</td></tr>
		<%
	}//end of for
}//end of else
%>
		</table>
			<div class="wriButton">
			<button type="submit" id="subButton" onclick="writeCheck()">예매하기</button>
			</div>
	</form>
</body>
</html>