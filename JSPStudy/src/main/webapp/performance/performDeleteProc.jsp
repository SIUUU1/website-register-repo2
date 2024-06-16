<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="performance.PerformanceVO"%>
<%@ page import="performance.PerformanceDAO"%>
<%@ page import="java.util.*"%>
<%
int performance_id = Integer.parseInt(request.getParameter("performance_id"));
//공연 정보 삭제하기
PerformanceDAO dao = PerformanceDAO.getInstance();
int check = dao.setPerformanceDelete(performance_id);
//-1:데이터베이스 오류, 1:공연삭제 성공, 0:공연삭제 실패
String message = "공연삭제 성공";
if (check == 1) {

} else if (check == 0) {
	message = "공연삭제 실패";

} else {
	message = "데이터베이스 오류입니다.";
}
%>
<script language="JavaScript">
		alert(message);
		window.location.href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/performance/performanceList.jsp";
</script>
<html>
<head>
<title>performace delete procedure</title>
</head>
<body>

</body>
</html>