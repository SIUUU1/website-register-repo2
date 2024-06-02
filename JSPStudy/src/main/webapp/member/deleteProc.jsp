<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
MemberDAO dao = MemberDAO.getInstance();
String userId = (String) session.getAttribute("loginID");
String userPw = request.getParameter("userPw");
int check = dao.deleteMember(userId, userPw);
String message = "회원정보가 삭제되었습니다.";

if (check != -1) {
	session.invalidate();
	message = "회원정보가 삭제되었습니다.";
}else{
	message = "비밀번호가 맞지 않습니다.";
}
%>
<script>
alert("<%=message%>");
history.go(-1);
</script>
<!DOCTYPE html>
<html>
<head>
<title>회원탈퇴</title>
</head>
<body>
</body>
</html>