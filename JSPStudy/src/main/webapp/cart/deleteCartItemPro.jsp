<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="performance.PerformanceDAO"%>
<%@ page import="cart.CartDAO" %>
<%@ page import="java.util.*"%>
<%
String loginID = (String) session.getAttribute("loginID");
int cart_id = Integer.parseInt(request.getParameter("cart_id"));
int performance_id = Integer.parseInt(request.getParameter("performance_id"));

//공연 정보 가져오기
PerformanceDAO pDao = PerformanceDAO.getInstance();
int[][] seat = pDao.getPerformanceSeats(performance_id);
CartDAO dao = CartDAO.getInstance();

//공연 좌석 선택해제, 판매 좌석 정보수정


//장바구니 삭제
int check=dao.setCartDeletItem(loginID, performance_id);
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
}
%>
<html>
<head>
<title>delete cart item</title>
</head>
<body>

</body>
</html>