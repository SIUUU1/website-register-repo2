<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="performance.PerformanceDAO"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="performance" class="performance.PerformanceVO"/>
<jsp:setProperty property="*" name="performance"/>
<%
PerformanceDAO dao = PerformanceDAO.getInstance();
//-1:데이터베이스 오류, 1:공연수정 성공, 0:공연수정 실패
int check=dao.setPerformanceUpdate(performance);
if(check==1){
	%>
	<script language="JavaScript">
		alert("공연수정 성공");
		window.location.href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/performance/performanceList.jsp";
	</script>
	<%
}else if(check == 0){
	%>
	<script language="JavaScript">
		alert("공연수정 실패");
		history.go(-1);
	</script>
	<%
}else{
	%>
	<script language="JavaScript">
		alert("데이터베이스 오류입니다.");
		history.go(-1);
	</script>
	<%
}
%>
<html>
<head>
<title>performance update</title>
</head>
<body>

</body>
</html>