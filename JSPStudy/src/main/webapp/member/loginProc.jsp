<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
MemberDAO dao = MemberDAO.getInstance();
String userId = request.getParameter("userId");
String userPw = request.getParameter("userPw");
int check = dao.loginCheck(userId, userPw);
String message = "비밀번호가 틀렸습니다.";
//로그인 성공 세션 등록
if (check == 1) {
	session.setAttribute("loginID", userId);
	response.sendRedirect("login.jsp");
} else if (check == 0) {
	//아이디는 있는데 비밀번호 오류
} else {
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
<title>Insert title here</title>
</head>
<body>

</body>
</html>