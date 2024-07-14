<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="board.BoardVO"%>
<%
String contextPath = request.getContextPath();
%>
<html lang="ko">
<head>
<title>FAQ</title>
<link rel="stylesheet"
	href="<%=contextPath%>/board/writeForm-style.css?ver=<%=(int) (Math.random() * 1000)%>">
<script src="<%=contextPath%>/board/js-board.js?ver=<%=(int) (Math.random() * 1000)%>"
	defer></script>
</head>
<%
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
try {
	BoardDAO dbpro = BoardDAO.getInstance();
	BoardVO article = dbpro.getArticle(num);
%>
<body>
	<h1 id="title">FAQ</h1>
	<br>
	<form method="post" name="updateForm"
		action="<%=contextPath%>/board/updateProc.jsp?pageNum=<%=pageNum%>">
		<input type="hidden" name="num" value="<%=num%>">
		<table>
			<tr>
				<th><label for="writer">이름</label></th>
				<td class="below"><input type="text" name="writer" id="writer"
					size="40" maxlength="40" readonly value="<%=article.getWriter()%>"></td>
			</tr>
			<tr>
				<th><label for="email">이메일</label></th>
				<td class="below"><input type="email" name="email" id="email"
					size="40" maxlength="40" onkeyup="emailCheck()"
						value="<%=article.getEmail()%>"> <span id="emailInfo"
					class="redtext"></span><br></td>
			</tr>
			<tr>
				<th><label for="subject">제목</label></th>
				<td class="below"><input type="text" size="50" maxlength="50"
					name="subject" value="<%=article.getSubject()%>"/></td>
			</tr>
			<tr>
				<th><label for="category">카테고리</label></th>
				<td class="below"><select name="category" id="category">
						<option value="회원">회원</option>
						<option value="티켓예매/발권">티켓예매/발권</option>
						<option value="배송/반송">배송/반송</option>
						<option value="취소/환불">취소/환불</option>
						<option value="기타">기타</option>
				</select></td>
			</tr>
			<tr>
				<td class="below" colspan="2"><textarea name="content"
						rows="20" cols="50" id="content"><%=article.getContent()%></textarea>
				</td>
			</tr>
			<tr>
				<td class="below" colspan="2" id="password">
				<label for="userPw">패스워드</label>
				<input type="password" name="userPw" id="userPw" size="20" maxlength="20">
				</td>
			</tr>
		</table>
		<div class="wriButton">
			<button type="button" id="subButton" onclick="updateCheck()">수정</button>
			<button type="button" onclick="document.location.href='<%=contextPath%>/member/main.jsp?middleFile=../board/boardList.jsp?pageNum=<%=pageNum%>'">취소</button>
		</div>
	</form>
	<%
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
</body>
</html>