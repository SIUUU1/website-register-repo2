<%@page import="member.MemberDAO"%>
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
if (count != -1) {
%>
<html>
<head>
<title>Update Process</title>
</head>
<meta http-equiv="Refresh" content="3;url=main.jsp">
<body>
	<center>
		<font size="5" face="바탕체">입력하신 내용대로 <b>회원정보가 수정되었습니다.</b><br>
		<br> 3초 후 메인페이지로 이동합니다.
		</font>
	</center>
</body>
</html>
<%
} else {
%>
<script>
	alert("수정이 완료되지 않았습니다.");
	history.go(-1);
</script>
<%
}
%>