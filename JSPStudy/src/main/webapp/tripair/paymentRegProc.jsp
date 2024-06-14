<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="tripair.PaymentDAO"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="payment" class="tripair.PaymentVO" scope="page"/>
<jsp:setProperty property="*" name="payment"/>
<%
PaymentDAO dao = PaymentDAO.getInstance();
int check = dao.setPaymentRegister(payment);
//-1:데이터베이스 오류, 1:결제 성공, 0:결제 실패
if(check==1){
	request.setAttribute("payment", payment);
	%>
	<script language="JavaScript">
		alert("결제 성공");
		window.location.href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/tripair/currentPayment.jsp?customer_phone=<%=payment.getCustomer_phone()%>&airports_id=<%=payment.getAirports_id()%>";
	</script>
	<%
}else if(check == 0){
	%>
	<script language="JavaScript">
		alert("결제 실패");
		window.location.href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/tripair/selectForm.jsp";
	</script>
	<%
}else{
	%>
	<script language="JavaScript">
		alert("데이터베이스 오류입니다.");
		window.location.href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/tripair/selectForm.jsp";
	</script>
	<%
}
%>
<html>
<head>
<title>payment register procedure</title>
</head>
<body>
</body>
</html>