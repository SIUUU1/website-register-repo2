<%@ page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="vo" class="member.MemberVO" scope="page" />
<jsp:setProperty property="*" name="vo" />
<%
MemberDAO dao = MemberDAO.getInstance();
String loginID = (String) session.getAttribute("loginID");
//session값이 없으면 돌려보내야한다.
vo.setUserId(loginID);
int count = dao.updateMember(vo);
String message ="회원정보가 성공적으로 수정되었습니다.";
%>
<!DOCTYPE html>
<html>
<head>
<title>Update Process</title>
<script>
<%
if (count != -1) {
%>
alert("<%=message%>");
location.href="main.jsp";
<%
} else {
message ="수정이 완료되지 않았습니다.";
%>
alert("수정이 완료되지 않았습니다.");
history.go(-1);
<%
}
%>
</script>
</head>
<body>
</body>
</html>