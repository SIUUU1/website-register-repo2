<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="payment.PaymentDAO"%>
<%@ page import="payment.PaymentVO"%>
<%@ page import="java.util.*" %>
<%
String loginID = (String) session.getAttribute("loginID");
String userName = request.getParameter("userName");
String userPhoneNum = request.getParameter("userPhoneNum");
String postCode = request.getParameter("postCode");
String recipient_address = request.getParameter("defaultAddress") + " " + request.getParameter("extraAddress") + " "
		+ request.getParameter("detailedAddress");

String[] cart_id = (String[])session.getAttribute("cart_id");
PaymentDAO dao = PaymentDAO.getInstance();
int check = dao.setPaymentRegister(loginID, userName, userPhoneNum, postCode, recipient_address, cart_id);
//-1:데이터베이스 오류, 1:결제 성공, 0:결제 실패
if (check == 1) {
%>
<script language="JavaScript">
		alert("결제 성공");
		window.location.href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/payment/paymentList.jsp";
</script>
<% 
} else if (check == 0) {
	%>
	<script language="JavaScript">
			alert("결제 실패");
			window.location.href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/cart/cartList.jsp";
	</script>
	<% 
} else {
	%>
	<script language="JavaScript">
			alert("데이터베이스 오류입니다.");
			window.location.href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/cart/cartList.jsp";
	</script>
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