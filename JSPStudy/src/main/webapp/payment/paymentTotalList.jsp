<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="payment.PaymentDAO"%>
<%@ page import="payment.PaymentVO"%>
<%@ page import="java.util.*"%>
<%
String loginID = (String) session.getAttribute("loginID");
PaymentDAO dao = PaymentDAO.getInstance();
//결제 수
int count = dao.getPayment_Count(loginID);
%>
<!DOCTYPE html>
<html>
<head>
<title>결제내역</title>
</head>
<body>
	<h1 id="title">결제 내역</h1>
	<table>
		<thead>
			<tr>
				<td>결제내역</td>
				<td>고객명</td>
				<td>연락처</td>
				<td>배송지</td>
				<td>공연명</td>
				<td>예매좌석</td>
				<td>총예매수</td>
				<td>총 티켓가격</td>
			</tr>
		</thead>
		<%
		if(count==0){
			%>
			<tr>
			<td colspan="8">결제 내역이 없습니다.</td>
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
		<tr>
			<td><%=payment.getReservation_date()%></td>
			<td><%=payment.getRecipient_name()%></td>
			<td><%=payment.getRecipient_phone()%></td>
			<td><%=payment.getRecipient_address()%></td>
			<td><%=payment.getPerformance_name()%></td>
			<td><%=payment.getReservation_seats()%></td>
			<td><%=payment.getTotal_reservation_seats()%></td>
			<td><%=payment.getTotal_payment_amount()%></td>
		</tr>
		<%
		} //end of for
		%>
		<tr>
			<td colspan="8">총 결제금액 : <%=totalPayment%></td>
		</tr>
		<%
		}
		%>
	</table>
	<div id="ticketButton">
		<input type="button"
			onclick="location.href='<%=request.getContextPath()%>/performance/performanceTotalList.jsp'"
			value="메인페이지">
	</div>
</body>
</html>