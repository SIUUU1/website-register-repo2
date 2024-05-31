<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
//로그인 완료했는지 점검
String loginID = (String) session.getAttribute("loginID");
%>
<html lang="ko">
<head>
<title>로그인</title>
<script src="./js-login.js" defer></script>
<link rel="stylesheet" href="./login-style.css?ver=4">
</head>
<body>
	<%
	if (loginID != null) {
		if (loginID.equals("admin")) {
 				%>
 				<jsp:forward page="memberListForm.jsp"></jsp:forward>
 				<%
		} else {
	%>
	<table border="1" width="300">
		<tr>
			<td colspan="3" align="center"><%=loginID%>님 환영합니다.</td>
		</tr>
		<tr>
			<td align="center" width="100"><a href="modifyForm.jsp">정보수정</a></td>
			<td align="center" width="100"><a href="deleteForm.jsp">회원탈퇴</a></td>
			<td align="center" width="100"><a href="logout.jsp">로그아웃</a></td>
		</tr>
	</table>
	<%
	}
	} else {
	%>
	<div class="login-box">
	<div id="back">
		<!-- top -->
		<h1>로그인</h1>
		<form action="loginProc.jsp" method="post" name="loginForm">
			<div class="top">
				<div>
					<input type="radio" name="member" id="member1" value="1" checked>
					<label for="member1">회원</label>
				</div>
				<div>
					<input type="radio" name="member" id="nonMember" value="2">
					<label for="nonMember">비회원(주문조회)</label>
				</div>
			</div>
			<!-- middle-top -->
			<div class="middle-top">
				<div>
					<input type="text" name="userId" id="userId" size="20"
						maxlength="20" placeholder="아이디"> <br> <input
						type="password" name="userPw" id="userPw" size="20" maxlength="16"
						placeholder="비밀번호">
				</div>
				<button type="submit" onclick="allCheck(event)">로그인</button>
			</div>
			<!-- middle-bottom -->
			<div class="middle-bottom">
				<div>
					<input type="checkbox" name="saveId" id="saveId" value="1">
					<label for="saveId">아이디저장</label>
				</div>
				<div>
					<a href="#">OTP 로그인</a>
					<button type="button" id="question-button">?</button>
				</div>
			</div>
			<!-- bottom -->
			<div class="bottom">
				<a href="main.jsp?file=regForm"><button type="button">회원가입</button></a>
				<a href="https://kh-academy.co.kr/login/find.kh"><button
						type="button">아이디 찾기</button></a> <a
					href="https://www.kh-academy.co.kr/login/password.kh"><button
						type="button">비밀번호 찾기</button></a>
			</div>
		</form>
	</div>
	</div>
	<%
	}
	%>
</body>
</html>