<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="tripair.AirportDAO"%>
<%@ page import="tripair.AirportVO"%>
<%@ page import="java.util.*"%>
<%
int airports_id = Integer.parseInt(request.getParameter("airports_id"));
//항공권 삭제하기
AirportDAO dao = AirportDAO.getInstance();
//-1:데이터베이스 오류, 1:항공권 삭제 성공, 0:항공권 삭제 실패
int check=dao.deleteAirport(airports_id);
if (check == 1) {
%>
<script language="JavaScript">
alert("항공권 삭제 성공");
</script>
<meta http-equiv="Refresh" content="0;url=<%=request.getContextPath()%>/member/main.jsp?middleFile=/tripair/airportTotalList.jsp">
<%
} else if (check == 0) {
	%>
	<script language="JavaScript">
		alert("항공권 삭제 실패");
		history.go(-1);
	</script>
	<%
} else {
	%>
	<script language="JavaScript">
		alert("데이터베이스 오류입니다.");
		history.go(-1);
	</script>
	<%
}//end of if (check == 1)
%>
</head>
<body>

</body>
</html>