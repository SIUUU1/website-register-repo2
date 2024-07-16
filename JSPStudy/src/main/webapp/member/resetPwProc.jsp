<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="member.MemberDAO"%>
<%
String userId = request.getParameter("userId");
String userPw = request.getParameter("userPw");
MemberDAO dao = MemberDAO.getInstance();
int check=dao.resetPassword(userPw, userId);
//-1:데이터베이스 오류, 1:패스워드 재설정 성공, 0:패스워드 재설정 실패
if (check == 1) {
%>
<script language="JavaScript">
		alert("패스워드 재설정 성공");
		if(window.confirm('로그인 하시겠습니까?')){
		location.href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/member/login.jsp";
		}else {
		location.href="<%=request.getContextPath()%>/member/main.jsp";
		}
	</script>
<%
} else if (check == 0) {
	%>
	<script language="JavaScript">
		alert("패스워드 재설정 실패");
		history.go(-1);
	</script>
	<%
} else {
	%>
	<script language="JavaScript">
		alert("데이터베이스 오류입니다.");
		history.go(-1);
	</script>
	<%
}//end of if (check == 1)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>