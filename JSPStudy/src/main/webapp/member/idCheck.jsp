<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
MemberDAO dao = MemberDAO.getInstance();
String userId = request.getParameter("userId");
boolean check = dao.idCheck(userId);
%>
<html>
<head>
<meta charset="UTF-8">
<title>ID중복체크</title>
</head>
<body>
	<br>
	<center>
		<b><%=userId%></b>
		<%
		if (check) {
			out.println("는 이미 존재하는 ID입니다.<br><br>");
		} else {
			out.println("는 사용가능한 ID입니다.<br><br>");
		}
		%>
		<a href="#" onClick="javascript:self.close()">닫기</a>
	</center>
</body>
</html>