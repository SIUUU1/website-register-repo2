<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
//로그인 완료했는지 점검
String loginID = (String) session.getAttribute("loginID");
%>
<html lang="ko">
<head>
<title>Login Process</title>
<script src="<%=request.getContextPath()%>/member/js-login.js?ver=<%=(int)(Math.random()*1000)%>" defer></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/member/login-style.css?ver=<%=(int)(Math.random()*1000)%>">
</head>
<body onload="begin()">
	<%
	if (loginID == null) {
	%>
	<div class="login-box">
		<div id="back">
			<!-- top -->
			<h1 id="title">로그인</h1>
			<form action="<%=request.getContextPath()%>/member/loginProc.jsp" method="post" name="loginForm">
				<div class="top">
				&nbsp;
				</div>
				<!-- middle-top -->
				<div class="middle-top">
					<div>
						<input type="text" name="userId" id="userId" size="20"
							maxlength="20" placeholder="아이디"> <br> <input
							type="password" name="userPw" id="userPw" size="20"
							maxlength="16" placeholder="비밀번호">
					</div>
					<button type="button" onclick="inputCheck()">로그인</button>
				</div>
				<!-- middle-bottom -->
				<div class="middle-bottom">
				&nbsp;
				</div>
				<!-- bottom -->
				<div class="bottom">
					<a href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/member/regForm.jsp"><button type="button">회원가입</button></a>
					<a href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/member/identifyForm.jsp?type=1"><button
							type="button">아이디 찾기</button></a> <a
						href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/member/identifyForm.jsp?type=0"><button
							type="button">비밀번호 찾기</button></a>
				</div>
			</form>
		</div>
	</div>
	<%
	} else {
	%>
	<jsp:include page="submain.jsp" />
	<%
	}
	%>
</body>
</html>