<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
MemberDAO dao = MemberDAO.getInstance();
String userId = (String) session.getAttribute("loginID");
String userPw = request.getParameter("userPw");
int check = dao.deleteMember(userId, userPw);
String message = "회원정보가 삭제되었습니다.";
%>
<!DOCTYPE html>
<html>
<head>
<title>회원탈퇴</title>
<script>
<% 
if (check != -1) {
session.invalidate();
%>
alert("<%=message%>");
location.href="main.jsp";
<% 
} else {
message = "비밀번호가 맞지 않습니다.";
%>
alert("<%=message%>");
history.go(-1);
<% 
}
%>
</script>
</head>
<body>
</body>
</html>