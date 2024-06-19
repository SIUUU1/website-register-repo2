<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="performance.PerformanceDAO"%>
<%@ page import="cart.CartDAO" %>
<%@ page import="java.util.*"%>
<%
String loginID = (String) session.getAttribute("loginID");

//장바구니 정보 가져오기
PerformanceDAO pDao = PerformanceDAO.getInstance();
CartDAO cDao = CartDAO.getInstance();
Vector<String[]> cartList = cDao.getCartTotalList(loginID);
//공연 좌석 선택해제, 판매 좌석 정보수정
int result=pDao.seatsInfoUpdate(cartList);
//장바구니 비우기
int check=cDao.setCartDelete(loginID);
//-1:데이터베이스 오류, 1:장바구니 비우기 성공, 0:장바구니 비우기 실패
if (check == 1) {
%>
<meta http-equiv="Refresh" content="0;url=<%=request.getContextPath()%>/member/main.jsp?middleFile=/cart/cartList.jsp">
<%
} else if (check == 0) {
	%>
	<script language="JavaScript">
		alert("장바구니 비우기 삭제 실패");
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
}
%>
<html>
<head>
<title>clear cart</title>
</head>
<body>

</body>
</html>