<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="tripair.PaymentDAO"%>
<%@ page import="tripair.PaymentVO"%>
<%@ page import="java.util.*"%>
<%request.setCharacterEncoding("utf-8");%>
<%
String loginID = (String) session.getAttribute("loginID");

//값 받아오기
int count = (Integer) session.getAttribute("count");
int airports_id = Integer.parseInt(request.getParameter("airports_id"));
int prestige_count = Integer.parseInt(request.getParameter("prestige_count"));
int economy_count = Integer.parseInt(request.getParameter("economy_count"));
String[] customer_name = request.getParameterValues("customer_name");
String[] customer_phone = request.getParameterValues("customer_phone");
String[] customer_email = request.getParameterValues("customer_email");

//결제등록
int check=-1;
PaymentDAO dao = PaymentDAO.getInstance();
for (int i = 0; i < count; i++) {
	PaymentVO pvo = new PaymentVO();
	pvo.setAirports_id(airports_id);
	pvo.setEconomy_count(economy_count);
	pvo.setPrestige_count(prestige_count);
	pvo.setCustomer_name(customer_name[i]);
	pvo.setCustomer_phone(customer_phone[i]);
	pvo.setCustomer_email(customer_email[i]);
	check = dao.setPaymentRegister(pvo,loginID);
}

//세션값 버리기
session.removeAttribute("tripType");
session.removeAttribute("count");
session.removeAttribute("depAirport_name");
session.removeAttribute("arrAirport_name");
session.removeAttribute("arr_plandtime");

//-1:데이터베이스 오류, 1:결제 성공, 0:결제 실패
if (check == 1) {
%>
<script language="JavaScript">
		alert("결제 성공");
		window.location.href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/tripair/currentPayment.jsp";
	</script>
<%
} else if (check == 0) {
%>
<script language="JavaScript">
		alert("결제 실패");
		window.location.href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/tripair/selectForm.jsp";
	</script>
<%
} else {
%>
<script language="JavaScript">
		alert("데이터베이스 오류입니다.");
		window.location.href="<%=request.getContextPath()%>
	/member/main.jsp?middleFile=/tripair/selectForm.jsp";
</script>
<%
}
%>
<html>
<head>
<title>payment register procedure</title>
</head>
<body>
</body>
</html>