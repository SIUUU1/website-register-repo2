<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
MemberDAO dao = MemberDAO.getInstance();
String userId = request.getParameter("userId");
String userPw = request.getParameter("userPw");
int check = dao.loginCheck(userId, userPw);
String message = "";

if (check == 1) {
	//로그인 성공 세션 등록
	message = "로그인 성공";
	session.setAttribute("loginID", userId);
	response.sendRedirect("main.jsp");
} else if (check == 2) {
	//admin 로그인 성공 세션 등록
	message = "관리자님 환영합니다.";
	session.setAttribute("loginID", userId);
	response.sendRedirect("main.jsp");
} else if (check == 0) {
	//아이디는 있는데 비밀번호 오류
	message = "비밀번호가 틀렸습니다.";
} else {
	//아이디가 존재하지 않음
	message = "존재하지 않는 아이디입니다.";
}
%>
<script>
alert("<%=message%>");
history.go(-1);
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
</body>
</html>