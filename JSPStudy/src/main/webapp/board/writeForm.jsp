<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html lang="ko">
<head>
<title>BOARD</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/board/writeForm-style.css?ver=<%=(int) (Math.random() * 1000)%>">
<script src="<%=request.getContextPath()%>/board/js-board.js?ver=<%=(int) (Math.random() * 1000)%>" defer></script>
</head>
<%
String loginID = (String) session.getAttribute("loginID");
//게시판 답글을 작성할 때 사용한다.(원글 num = 0, ref = 1, step = 0, depth = 0,
//답글 : 원글바탕하에 num, ref, step, depth 결정)
int num = 0, ref = 1, step = 0, depth = 0;
try {
	if (request.getParameter("num") != null) {
		num = Integer.parseInt(request.getParameter("num"));
		ref = Integer.parseInt(request.getParameter("ref"));
		step = Integer.parseInt(request.getParameter("step"));
		depth = Integer.parseInt(request.getParameter("depth"));
	}
%>
<body>
	<h1 id="title">게시판</h1>
	<br>
	<form method="post" name="writeForm" action="<%=request.getContextPath()%>/board/writeProc.jsp">
		<input type="hidden" name="num" value="<%=num%>"> 
		<input type="hidden" name="ref" value="<%=ref%>"> 
		<input type="hidden" name="step" value="<%=step%>"> 
		<input type="hidden" name="depth" value="<%=depth%>">
		<input type="hidden" name="userId" value="<%=loginID%>">
		<table>
			<tr>
				<th><label for="writer">작성자</label></th>
				<td class="below">
				<input type="text" size="50" maxlength="12" name="writer" id="writer"/>
				</td>
			</tr>
			<tr>
				<th><label for="email">이메일</label></th>
				<td class="below">
				<input type="email" name="email" id="email"size="40" maxlength="40" onkeyup="emailCheck()"> 
				<span id="emailInfo" class="redtext"></span>
				</td>
			</tr>
			<tr>
				<th><label for="subject">제목</label></th>
				<td class="below">
					<%
					if (request.getParameter("num") != null) {
					%> <input type="text" size="50" maxlength="50" name="subject" value="[답변]" /> <%
				 } else {
				 %> <input type="text" size="50" maxlength="50" name="subject" /> <%
				 }
				 %>
					</td>
			</tr>
			
			<tr>
				<td class="below" colspan="2">
				<textarea name="content" rows="20" cols="50" id="content"></textarea>
				</td>
			</tr>
			<tr>
			<td colspan="2" id="password">
			<span id="userPwInfo" class="redtext"></span>
			<label for="userPw">패스워드 </label><input type="password" id="userPw" name="userPw" size="30" maxlength="20" onkeyup="pwCheck()"/>
			</td>
			</tr>
		</table>
		<div class="wriButton">
			<button type="button" id="subButton" onclick="writeCheck()">완료</button>
			<a href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/board/boardList.jsp"><button type="button">취소</button></a>
		</div>
	</form>
	<%
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
</body>
</html>