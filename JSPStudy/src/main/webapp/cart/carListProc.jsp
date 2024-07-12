<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
String[] cart_id = request.getParameterValues("cart_id");
if(cart_id == null){
	%>
	<script>
	alert('결제상품을 선택하세요.');
	history.go(-1);
	</script>
	<%
}else{	
session.setAttribute("cart_id", cart_id);
	%>
	<meta http-equiv='refresh' content='0;url=<%=request.getContextPath()%>/member/main.jsp?middleFile=/payment/paymentRegForm.jsp'>
	<%
	}
	%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

</body>
</html>