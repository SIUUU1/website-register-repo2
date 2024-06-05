<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>우리반 게시판</title>
<link rel="stylesheet"
	href="writeForm-style.css?ver=<%=(int) (Math.random() * 1000)%>">
<script src="js-writeForm.js?ver=<%=(int) (Math.random() * 1000)%>"
	defer></script>
</head>
<%
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
	<h1 id="title">우리반 게시판</h1>
	<br>
	<form method="post" name="writeForm" action="writeProc.jsp">
		<input type="hidden" name="num" value="<%=num%>"> <input
			type="hidden" name="ref" value="<%=ref%>"> <input
			type="hidden" name="step" value="<%=step%>"> <input
			type="hidden" name="depth" value="<%=depth%>">
		<table>
			<tr>
				<th><label for="writer">이름</label></th>
				<td class="below"><input type="text" name="writer" id="writer"
					size="40" maxlength="40"></td>
			</tr>
			<tr>
				<th><label for="email">이메일</label></th>
				<td class="below"><input type="email" name="email" id="email"
					size="40" maxlength="40" onkeyup="emailCheck()"> <span
					id="emailInfo" class="redtext"></span><br></td>
			</tr>
			<tr>
				<th><label for="subject">제목</label></th>
				<td class="below">
					<%
					if (request.getParameter("num") != null) {
					%> <input type="text" size="50" maxlength="50" name="subject"
					value="[답변]" /> <%
				 } else {
				 %> <input type="text" size="50" maxlength="50" name="subject" /> <%
				 }
				 %>
					</td>
			</tr>
			<tr>
				<th><label for="category">카테고리</label></th>
				<td class="below"><select name="category" id="category" onchange="this.form.submit()">
						<option value="프로젝트">프로젝트</option>
						<option value="취업특강">취업특강</option>
						<option value="개강OT">개강OT</option>
						<option value="기타">기타</option>
				</select></td>
			</tr>
			<tr>
				<td class="below" colspan="2"><textarea name="content"
						rows="20" cols="50" id="content" placeholder="내용을 입력하세요"></textarea>
				</td>
			</tr>
			<tr>
				<td class="below" colspan="2" id="password">패스워드 <input
					type="password" name="userPw" id="userPw" size="20" maxlength="20">
				</td>
			</tr>
		</table>
		<div class="wriButton">
			<button type="button" id="subButton" onclick="writeCheck()">완료</button>
			<a href="boardlist.jsp"><button type="button">취소</button></a>
		</div>
	</form>
	<%
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
</body>
</html>