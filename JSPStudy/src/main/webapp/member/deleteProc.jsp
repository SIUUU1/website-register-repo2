<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<%
MemberDAO dao = MemberDAO.getInstance();
String userId = (String) session.getAttribute("loginID");
String userPw = request.getParameter("userPw");
int check = dao.deleteMember(userId, userPw);
if (check != -1) {
	session.invalidate();
%>
<meta http-equiv="Refresh" content="3;url=main.jsp">
<body>
	<center>
		<font size="5" face="바탕체">회원정보가 삭제되었습니다.<br> <br>
			3초 후 메인페이지로 이동합니다.
		</font>
	</center>
	<%
	} else {//삭제 실패시
	%>
	<script>
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
	<%
}
%>
</body>
</html>