<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="cart.CartDAO" %>
<%@ page import="cart.CartVO" %>
<%@ page import="java.util.*"%>
<%
String loginID = (String) session.getAttribute("loginID");
//장바구니 리스트 가져오기
CartDAO dao = CartDAO.getInstance();
int count = 0;
count = dao.getCart_Count(loginID);
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
<title>내 장바구니</title>
</head>
<body>
<h1 id="title">내 장바구니</h1>
<form action="<%=request.getContextPath()%>/payment/paymentListProc.jsp" method="post">
<table>
		<thead>
			<tr>
				<td>공연명</td>
				<td>공연일</td>
				<td>예매좌석</td>
				<td>총 예매수</td>
				<td>총 티켓가격</td>
				<td></td>
				<td></td>
			</tr>
		</thead>
		<%
		if(count==0){
			%>
			<tr>
				<td align="center" colspan="5">장바구니가 비어있습니다.</td>
			</tr>
		<%
		}else{
			Vector<String[]> cartList = dao.getCartTotalList(loginID);
			for (int i = 0; i < cartList.size(); i++) {
		%>
	<tr>
			<td><%=cartList.get(i)[1]%></td>
			<td><%=cartList.get(i)[2]%></td>
			<td><%=cartList.get(i)[3]%></td>
			<td><%=cartList.get(i)[4]%></td>
			<td><%=cartList.get(i)[5]%></td>
			<td><input type="checkbox" id="cart_id" name="cart_id" value="<%=cartList.get(i)[6]%>"></td>
			<td onclick="location.href='<%=request.getContextPath()%>/cart/deleteCartItemPro.jsp?cart_id=<%=cartList.get(i)[6]%>&performance_id=<%=cartList.get(i)[0]%>'">
			<i class="fa-solid fa-minus"></i></td>
	 </tr>
 <%
		}//end of for
		}//end of else
		%>
		</table>
		<div id="ticketButton">
			<button type="button" onclick="location.href='<%=request.getContextPath()%>/cart/clearCartPro.jsp'">전체항목삭제</button>
		</div>
		<div id="ticketButton">
			<button type="submit">결제하기</button>
		</div>
		</form>
</body>
</html>
<%
}//end of if(loginID==null)
%>