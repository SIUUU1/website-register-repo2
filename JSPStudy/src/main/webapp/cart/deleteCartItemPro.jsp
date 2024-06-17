<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="cart.CartDAO" %>
<%@ page import="java.util.*"%>
<%
String loginID = (String) session.getAttribute("loginID");
int performance_id = Integer.parseInt(request.getParameter("performance_id"));
CartDAO dao = CartDAO.getInstance();
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