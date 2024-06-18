<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="performance.PerformanceDAO"%>
<%@ page import="cart.CartDAO"%>
<%@ page import="java.util.*"%>
<%
String loginID = (String) session.getAttribute("loginID");
String[] p_seatArr = request.getParameterValues("p_seat");
int performance_id = Integer.parseInt(request.getParameter("performance_id"));
//좌석정보 가져오기
PerformanceDAO pDao = PerformanceDAO.getInstance();
int[][] seat = pDao.getPerformanceSeats(performance_id);
//공연좌석정보 수정
pDao.seatsInfoUpdate(p_seatArr, p_seatArr.length, seat, performance_id);
//장바구니 정보 등록
CartDAO cdao = CartDAO.getInstance();
cdao.setCartRegister(loginID, performance_id, p_seatArr);
%>
<script language="JavaScript">
	alert("장바구니 등록 성공");
	window.location.href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/cart/cartList.jsp";
</script>
<html>
<head>
<title>cart register procedure</title>
</head>
<body>
</body>
</html>