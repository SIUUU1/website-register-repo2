<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="tripair.PaymentVO"%>
<%@ page import="tripair.PaymentDAO"%>
<%@ page import="java.util.*"%>
<%
//결제 내역 가져오기
PaymentDAO dao = PaymentDAO.getInstance();
Vector<String[]> paymentTotalList =dao.getPaymentList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/tripair/paymentList-style.css?ver=<%=(int)(Math.random()*1000)%>">
</head>
<body>
<h1 id="title">항공권 결제 리스트</h1>
<table>
		<thead>
			<tr>
				<td>항공편명</td>
				<td>결제일</td>
				<td>아이디</td>				
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
		if (paymentTotalList.isEmpty()) {
		%>
		<tr>
			<td colspan="12">결제내역이 없습니다.</td>
		</tr>
		<%
		} else {
		for (int i = 0; i < paymentTotalList.size(); i++) {
		%><tr>
			<%
			for (int j = 0; j < paymentTotalList.get(i).length; j++) {
			%>
			<td><%=paymentTotalList.get(i)[j]%></td>
			<%
			} //end of for
			%>
		</tr>
		<%
		} //end of for
		} //end of if
		%>
	</table>
</body>
</html>