<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
String loginID = (String) session.getAttribute("loginID");
String topFile = request.getParameter("topFile");
String middleFile = request.getParameter("middleFile");

if (loginID != null) {
	if (loginID.equals("admin")) {
		topFile = "adminTop";
	} else {
		topFile = "memberTop";
	}
} else {
	topFile = "top";
}

if (middleFile == null) {
	middleFile = "submain";
}
%>

<jsp:include page='<%=topFile + ".jsp"%>' />

<jsp:include page='<%=middleFile + ".jsp"%>' />

<%@ include file="bottom.jsp"%>