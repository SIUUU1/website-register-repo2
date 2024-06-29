<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="tripair.PaymentVO"%>
<%@ page import="tripair.PaymentDAO"%>
<%@ page import="java.util.*"%>
<%
String loginID = (String) session.getAttribute("loginID");

//현재 결제 내역 가져오기
PaymentDAO dao = PaymentDAO.getInstance();
Vector<String[]> paymentvec = dao.getPaymentList(loginID);
if (paymentvec != null) {
%>
<!DOCTYPE html>
<html>
<head>
<title>current Payment</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/tripair/paymentList-style.css?ver=<%=(int)(Math.random()*1000)%>">
</head>
<body>
	<h1 id="title">결제 내역</h1>
	<table>
		<thead>
			<tr>
				<td>항공편명</td>
				<td>결제일</td>
				<td>이름</td>
				<td>출발공항</td>
				<td>도착공항</td>
				<td>출발시간</td>
				<td>도착시간</td>
				<td>일반석</td>
				<td>비즈니스석</td>
				<td>항공사명</td>
				<td>총결제금액</td>
			</tr>
		</thead>
			<%
			for (int i = 0; i < paymentvec.size(); i++) {
				String[] payment=paymentvec.get(i);
				%>
				<tr>
				<%
				for(int j=0;j<payment.length;j++){
					%>
					<td><%=payment[j]%></td>
					<%
				}
				%>
				</tr>
				<%
			} //end of for (int i = 0; i < paymentvec.size(); i++)
			} //end of if
			%>
	</table>
	<div id="ticketButton">
	<button type="button" onclick="location.href='<%=request.getContextPath()%>/member/main.jsp?middleFile=/tripair/selectForm.jsp'">메인페이지</button>
	</div>
</body>
</html>