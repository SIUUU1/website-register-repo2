<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
//1:아이디찾기 0:비밀번호 재설정
String type = request.getParameter("type");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>identifyForm</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/member/identifyForm-style.css?ver=<%=(int) (Math.random() * 1000)%>">
<script src="<%=request.getContextPath()%>/member/js-login.js?ver=<%=(int)(Math.random()*1000)%>" defer></script>
</head>
<body>
<div class="identify-box">
		<div id="back">
			<!-- top -->
			<h1 id="title">본인 인증</h1>
			<p>개인정보를 안전하게 보호하기 위해<br> <span>인증 절차</span>가 필요해요.</p>
			<%
if(type.equals("1")){
			%>
			<form action="<%=request.getContextPath()%>/member/identifyProc.jsp?type=<%=type%>" method="post" name="identifyForm" onblur="userNameCheck()">
				<!-- middle-top -->
				<div class="middle-top">
					<input type="text" name="userName" id="userName" size="20" maxlength="10" placeholder="이름"> <br> 
						<input type="text" name="userPhoneNum" id="userPhoneNum" size="20" placeholder="전화번호" onblur="userPhoneNumCheck()">
				</div>
				<!-- bottom -->
				<div class="bottom">
					<a href="<%=request.getContextPath()%>/member/main.jsp"><button type="button" >취소</button></a>
					<button type="button" onclick="allCheck()" id="subButton">다음</button>
				</div>
			</form>
<%
}else {
	%>
		  <form action="<%=request.getContextPath()%>/member/identifyProc.jsp?type=<%=type%>" method="post" name="identifyForm" onblur="userNameCheck()">
				<!-- middle-top -->
				<div class="middle-top">
					<input type="text" name="userId" id="userId" size="20" maxlength="10" placeholder="아이디"> <br> 
					<input type="text" name="userPhoneNum" id="userPhoneNum" size="20" placeholder="전화번호" onblur="userPhoneNumCheck()">
				</div>
				<!-- bottom -->
				<div class="bottom">
					<a href="<%=request.getContextPath()%>/member/main.jsp"><button type="button" >취소</button></a>
					<button type="button" onclick="check()" id="subButton">다음</button>
				</div>
			</form>
	<%
}
%>				
		</div>
	</div>
</body>
</html>