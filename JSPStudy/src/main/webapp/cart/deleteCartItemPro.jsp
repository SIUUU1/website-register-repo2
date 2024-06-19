<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="performance.PerformanceDAO"%>
<%@ page import="cart.CartDAO" %>
<%@ page import="java.util.*"%>
<%
String loginID = (String) session.getAttribute("loginID");
int cart_id = Integer.parseInt(request.getParameter("cart_id"));
int performance_id = Integer.parseInt(request.getParameter("performance_id"));

//장바구니 정보 가져오기
PerformanceDAO pDao = PerformanceDAO.getInstance();
CartDAO cDao = CartDAO.getInstance();
String[] cart = cDao.getCart(cart_id);

//공연 좌석 선택해제, 판매 좌석 정보수정
int result = pDao.seatsInfoUpdate(cart);
if(result==1) { //공연 정보 수정 성공
//장바구니 항목 삭제
int check=cDao.setCartDeletItem(loginID, cart_id);
//-1:데이터베이스 오류, 1:장바구니 항목 삭제 성공, 0:장바구니 항목 삭제 실패
if (check == 1) {
%>
<meta http-equiv="Refresh" content="0;url=<%=request.getContextPath()%>/member/main.jsp?middleFile=/cart/cartList.jsp">
<%
} else if (check == 0) {
	%>
	<script language="JavaScript">
		alert("장바구니 항목 삭제 실패");
		history.go(-1);
	</script>
	<%
} else {
	%>
	<script language="JavaScript">
		alert("데이터베이스 오류입니다.");
		history.go(-1);
	</script>
	<%
}//end of if (check == 1)
}else{
	%>
	<script language="JavaScript">
		alert("공연 수정 실패");
		history.go(-1);
	</script>
	<%
}//end of if(result==1)
%>
<html>
<head>
<title>delete cart item</title>
</head>
<body>

</body>
</html>