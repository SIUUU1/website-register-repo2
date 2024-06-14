<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="tripair.PaymentDAO"%>
<%
String airports_id = request.getParameter("airports_id");
//비즈니스석 존재 확인
PaymentDAO dao = PaymentDAO.getInstance();
//-1:데이터베이스오류 0:비즈니스석 없음 양수:비즈니스석 있음
int check = dao.checkPrestige(Integer.parseInt(airports_id));
%>
<meta http-equiv="Refresh" content="0;url=<%=request.getContextPath()%>/member/main.jsp?middleFile=/tripair/paymentForm.jsp?check=<%=check%>&airports_id=<%=airports_id%>">
<html>
<head>
<title>Insert title here</title>
</head>
<body>

</body>
</html>