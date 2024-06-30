<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
String[] cart_id = request.getParameterValues("cart_id");
session.setAttribute("cart_id", cart_id);
%>
<meta http-equiv='refresh' content='0;url=<%=request.getContextPath()%>/member/main.jsp?middleFile=/payment/paymentRegForm.jsp'>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

</body>
</html>