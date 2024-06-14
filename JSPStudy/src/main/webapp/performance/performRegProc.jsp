<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="performance.PerformanceDAO" %>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="performance" class="performance.PerformanceVO"/>
<jsp:setProperty property="*" name="performance"/>
<%
PerformanceDAO dao = PerformanceDAO.getInstance();
//-1:데이터베이스 오류, 1:공연등록 성공, 0:공연등록 실패
int check=dao.setPerformanceRegister(performance);
if(check==1){
	%>
	<script language="JavaScript">
		alert("공연등록 성공");
		window.location.href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/performance/performanceList.jsp";
	</script>
	<%
}else if(check == 0){
	%>
	<script language="JavaScript">
		alert("공연등록 실패");
		history.go(-1);
	</script>
	<%
}else{
	%>
	<script language="JavaScript">
		alert("데이터베이스 오류입니다.");
		window.location.href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/performance/performanceList.jsp";
	</script>
	<%
}
%>
<html>
<head>
<title>performance register</title>
</head>
<body>
</body>
</html>