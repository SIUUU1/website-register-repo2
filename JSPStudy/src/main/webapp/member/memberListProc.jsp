<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
MemberDAO dao = MemberDAO.getInstance();
String userId = request.getParameter("deleteId");
int check = dao.deleteMember(userId);
String message = "회원정보 삭제 성공하셨습니다.";

if (check > 0) {
} else {
	message = "회원정보 삭제 실패하셨습니다.";
}
%>
<script>
	alert("<%=message%>");
	location.replace("main.jsp?middleFile=memberListForm.jsp");
</script>
<!DOCTYPE html>
<html>
<head>
<title>회원정보삭제</title>
</head>
<body>
</body>
</html>