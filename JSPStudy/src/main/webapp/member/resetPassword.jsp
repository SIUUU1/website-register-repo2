<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
String userId = request.getParameter("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./js-login.js?ver=<%=(int)(Math.random()*1000)%>" defer></script>
<link rel="stylesheet" href="./delete-style.css?ver=<%=(int)(Math.random()*1000)%>">
</head>
<body>
<div class="delete-box">
		<div id="back">
			<!-- top -->
			<h1 id="title">패스워드 재설정</h1>
			<form action="resetPwProc.jsp" method="post" name="resetPwForm">
				<!-- middle-top -->
				<div class="middle-top">
					<input type="hidden" name="userId" id="userId" value=<%=userId%>>
					<input type="password" name="userPw" id="userPw" size="20" maxlength="16" placeholder="비밀번호 입력" onkeyup="userPwCheck('keyup')">
					<input type="password" name="userPwConfirm" id="userPwConfirm" size="20" maxlength="16" placeholder="비밀번호 재입력" onblur="userPwCheck('blur')">
				</div>
				<!-- bottom -->
				<div class="bottom">
					<a href="main.jsp"><button type="button" >취소</button></a>
					<button type="button" onclick="checkIt()" id="subButton">재설정</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>