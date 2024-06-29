<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
String loginID = (String) session.getAttribute("loginID");
%>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<script src="./js-delete.js?ver=<%=(int)(Math.random()*1000)%>" defer></script>
<link rel="stylesheet" href="./delete-style.css?ver=<%=(int)(Math.random()*1000)%>">
</head>
<body onload="begin()">
	<div class="delete-box">
		<div id="back">
			<!-- top -->
			<h1 id="title">회원 탈퇴</h1>
			<p>정말로 티켓월드 회원 탈퇴하시겠습니까?</p>
			<form action="deleteProc.jsp" method="post" name="deleteForm">
				<!-- middle-top -->
				<div class="middle-top">
					<input type="text" name="userId" id="userId" size="20"
						maxlength="20" value=<%=loginID%> readonly> <br> <input
						type="password" name="userPw" id="userPw" size="20" maxlength="16"
						placeholder="비밀번호 입력">
				</div>
				<!-- bottom -->
				<div class="bottom">
					<button type="button" onclick="checkIt()">회원탈퇴</button>
					<a href="main.jsp"><button type="button" id="subButton">취소</button></a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>