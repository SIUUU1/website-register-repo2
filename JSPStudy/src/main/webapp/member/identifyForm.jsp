<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
String type = request.getParameter("type");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>identifyForm</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/tripair/identifyForm-style.css?ver=<%=(int) (Math.random() * 1000)%>">
</head>
<body>
<div class="identify-box">
		<div id="back">
			<!-- top -->
			<h1 id="title">본인 확인</h1>
			<form action="<%=request.getContextPath()%>/member/identifyProc.jsp?type=<%=type%>" method="post" name="identifyForm">
				<!-- middle-top -->
				<div class="middle-top">
					<input type="text" name="userName" id="userName" size="20"
						maxlength="10" placeholder="이름"> <br> 
						<input type="email" name="userEmail" id="userEmail" size="20" maxlength="40"
						placeholder="이메일">
				</div>
				<!-- bottom -->
				<div class="bottom">
					<button type="submit">다음</button>
					<a href="<%=request.getContextPath()%>/member/main.jsp"><button type="button" id="subButton">취소</button></a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>