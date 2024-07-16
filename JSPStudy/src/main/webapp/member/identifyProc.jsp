<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="member.MemberDAO"%>
<%
//1:아이디찾기 0:비밀번호 재설정
String type = request.getParameter("type");
String userName = request.getParameter("userName");
String userId = request.getParameter("userId");
String userPhoneNum = request.getParameter("userPhoneNum");

MemberDAO dao = MemberDAO.getInstance();
String findUserId = dao.identifyMember(userName, userPhoneNum, userId);
if(findUserId == null){	//조건에 맞는 회원이 없음
		%>
		<script language="JavaScript">
			alert("존재하지 않는 회원입니다.");
			history.go(-1);
		</script>
		<%
}else{//조건에 맞는 회원을 찾음
if(type.equals("1")){//아이디 찾기
	%>
	<script language="JavaScript">
		if (window.confirm('찾으시는 아이디는 <%=findUserId%> 입니다.\n로그인 하시겠습니까?')) {
			location.href = '<%=request.getContextPath()%>/member/main.jsp?middleFile=/member/login.jsp';
		} else {
			history.go(-1);
		}
	</script>
	<%
	}else{//패스워드 재설정
		%>
		<script language="JavaScript">
		location.href = '<%=request.getContextPath()%>/member/main.jsp?middleFile=/member/resetPassword.jsp?userId=<%=findUserId%>';
		</script>
		<%
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<title>IdentifyProc</title>
</head>
<body>
</body>
</html>