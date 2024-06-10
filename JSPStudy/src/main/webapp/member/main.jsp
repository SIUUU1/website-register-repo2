<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
String loginID = (String) session.getAttribute("loginID");
String topFile = request.getParameter("topFile");
String middleFile = request.getParameter("middleFile");

if (loginID != null) {
	if (loginID.equals("admin")) {
		topFile = "adminTop.jsp";
	} else {
		topFile = "memberTop.jsp";
	}
} else {
	topFile = "top.jsp";
}

if (middleFile == null) {
	middleFile = "submain.jsp";
}
%>

<jsp:include page='<%=topFile%>' />

<jsp:include page='<%=middleFile%>' />

