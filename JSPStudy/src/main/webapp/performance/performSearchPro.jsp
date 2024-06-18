<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="performance.PerformanceVO" %>
<%@ page import="performance.PerformanceDAO" %>
<%@ page import="java.util.*"%>
<%
String search = request.getParameter("search");
%>
<meta http-equiv="Refresh" content="0;url=<%=request.getContextPath()%>/member/main.jsp?middleFile=/performance/performanceSelectList.jsp?search=<%=search%>">
<html>
<head>
<title>공연리스트</title>
</head>
<body>

</body>
</html>