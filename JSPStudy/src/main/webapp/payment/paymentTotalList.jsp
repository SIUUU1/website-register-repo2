<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="payment.PaymentDAO"%>
<%@ page import="payment.PaymentVO"%>
<%@ page import="java.util.*"%>
<%
String loginID = (String) session.getAttribute("loginID");
PaymentDAO dao = PaymentDAO.getInstance();
//결제 수
int count = dao.getPayment_Count(loginID);
if(loginID==null){
	%>
	<script language="JavaScript">
	alert("로그인이 필요한 페이지입니다.");
	window.location.href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/member/login.jsp";
	</script>
	<%
}else{
%>
<html>
<head>
<title>결제내역</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/payment/paymentTotalList-style.css?ver=<%=(int)(Math.random()*1000)%>">
</head>
<body>
	<h1 id="title">결제 내역</h1>
		<%
		if(count==0){
			%>
		<table>
		<thead>
			<tr>
				<td>결제날짜</td>
				<td>고객명</td>
				<td>연락처</td>
				<td>배송지</td>
				<td>공연명</td>
				<!-- <td>공연일</td> -->
				<td>예매좌석</td>
				<td>총예매수</td>
				<td>총 티켓가격</td>
			</tr>
		</thead>
			<tr>
			<td colspan="9">결제 내역이 없습니다.</td>
		</tr>
			<% 
		}else {
		%>
		<%
		Vector<PaymentVO> paymentTotalList = dao.getPaymentList(loginID);
		int totalPayment = 0;
		for (int i = 0; i < paymentTotalList.size(); i++) {
			PaymentVO payment = paymentTotalList.elementAt(i);
			totalPayment += payment.getTotal_payment_amount();
		%>
		<table>
		<thead>
			<tr>
				<td>결제날짜</td>
				<td>고객명</td>
				<td>연락처</td>
				<td>배송지</td>
				<td>공연명</td>
				<!-- <td>공연일</td> -->
				<td>예매좌석</td>
				<td>총예매수</td>
				<td>총 티켓가격</td>
			</tr>
		</thead>
		<tr>
			<td><%=payment.getReservation_date()%></td>
			<td><%=payment.getRecipient_name()%></td>
			<td><%=payment.getRecipient_phone()%></td>
			<td><%=payment.getRecipient_address()%></td>
			<td><%=payment.getPerformance_name()%></td>
			<!-- <td>공연일</td> -->
			<td><%=payment.getReservation_seats()%></td>
			<td><%=payment.getTotal_reservation_seats()%></td>
			<td><%=payment.getTotal_payment_amount()%></td>
		</tr>
		<%
		} //end of for
		%>
		<%-- <tr>
			<td colspan="8">총 결제금액 : <%=totalPayment%></td>
		</tr> --%>
		<%
		}
		%>
	</table>
</body>
</html>
<%
}//end of if(loginID==null)
%>