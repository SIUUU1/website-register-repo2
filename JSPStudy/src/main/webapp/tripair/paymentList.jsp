<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="tripair.PaymentVO"%>
<%@ page import="tripair.PaymentDAO"%>
<%@ page import="java.util.*"%>
<%
String customer_name = request.getParameter("customer_name");
String customer_phone = request.getParameter("customer_phone");
//결제 내역 가져오기
PaymentDAO dao = PaymentDAO.getInstance();
Vector<String[]> paymentDataList = dao.getPaymentList(customer_name, customer_phone);
%>
<!DOCTYPE html>
<html>
<head>
<title>항공권예매내역</title>
</head>
<body>
	<h1 id="title">항공권 예매내역</h1>
	<table>
		<thead>
			<tr>
				<td>항공편명</td>
				<td>결제일</td>
				<td>이름</td>
				<td>전화번호</td>
				<td>출발공항</td>
				<td>도착공항</td>
				<td>출발시간</td>
				<td>일반석</td>
				<td>비즈니스석</td>
				<td>항공사명</td>
				<td>총결제금액</td>
			</tr>
		</thead>
		<%
		if (paymentDataList.isEmpty()) {
		%>
		<tr>
			<td>결제내역이 없습니다.</td>
		</tr>
		<%
		} else {
		for (int i = 0; i < paymentDataList.size(); i++) {
		%><tr>
			<%
			for (int j = 0; j < paymentDataList.get(i).length; j++) {
			%>
			<td><%=paymentDataList.get(i)[j]%></td>
			<%
			} //end of for
			%>
		</tr>
		<%
		} //end of for
		} //end of if
		%>
	</table>
	<div id="ticketButton">
		<input type="button" value="메인페이지"
			onclick="location.href='<%=request.getContextPath()%>/member/main.jsp?middleFile=/tripair/selectForm.jsp'">
	</div>
</body>
</html>