<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="performance.PerformanceDAO"%>
<%@ page import="cart.CartDAO" %>
<%@ page import="java.util.*"%>
<%
String loginID = (String) session.getAttribute("loginID");
int[][] seat = (int[][]) request.getAttribute("seat");
String[] p_seatArr = request.getParameterValues("p_seat");
int performance_id = Integer.parseInt(request.getParameter("performance_id"));

if(loginID!=null){
//공연좌석정보 수정
PerformanceDAO pdao = PerformanceDAO.getInstance();
pdao.seatsInfoUpdate(p_seatArr, p_seatArr.length, seat, performance_id);
//장바구니 정보 등록
CartDAO cdao = CartDAO.getInstance();
cdao.setCartRegister(loginID, performance_id, p_seatArr);
	%>
	<script language="JavaScript">
	alert("장바구니 등록 성공");
	window.location.href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/cart/cartList.jsp";
	</script>
	<%
}else {
	%>
	<script language="JavaScript">
	alert("로그인이 필요한 페이지입니다.");
	window.location.href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/member/login.jsp";
	</script>
	<%
}
%>
<html>
<head>
<title>cart register procedure</title>
</head>
<body>
</body>
</html>