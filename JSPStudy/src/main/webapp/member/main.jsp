<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
String file = request.getParameter("file");
if (file == null) {
	file = "submain";
}
%>
<%@ include file="top.jsp"%>

<jsp:include page='<%=file + ".jsp"%>'></jsp:include>

<%@ include file="bottom.jsp"%>