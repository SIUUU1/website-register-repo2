<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="vo" class="member.MemberVO" />
<jsp:setProperty property="*" name="vo" />
<!DOCTYPE html>
<html>
<head>
<title>Register Process</title>
</head>
<script>
<%
MemberDAO dao = MemberDAO.getInstance();
boolean flag = dao.memberInsert(vo);
String message = "회원가입을 축하드립니다.";

if (flag) {
%>
alert("<%=message%>");
location.href="main.jsp?middleFile=login";
<% 
} else {
message = "회원가입에 실패하셨습니다.";
%>
alert("<%=message%>");
history.go(-1);
<% 
}
%>
</script>
<body>
</body>
</html>