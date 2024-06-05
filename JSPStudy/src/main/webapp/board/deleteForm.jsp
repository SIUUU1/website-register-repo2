<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="board.BoardVO"%>
<%
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum"); 
BoardDAO dbpro = BoardDAO.getInstance();
BoardVO article = dbpro.getArticle(num);
%>
<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
<link rel="stylesheet"
	href="deleteForm-style.css?ver=<%=(int) (Math.random() * 1000)%>">
<script src="js-deleteForm.js?ver=<%=(int) (Math.random() * 1000)%>" defer></script>
</head>
<body>
<div class="delete-box">
		<div id="back">
			<!-- top -->
			<h1 id="title">글 삭제</h1>
			<form action="deleteProc.jsp?pageNum<%=pageNum%>" method="post" name="deleteForm">
				<!-- middle-top -->
				<div class="middle-top">
					<input type="hidden" name="num" id="num" size="20" value=<%=num%>>
					<p>"<%=article.getSubject()%>" 정말로 삭제하겠습니까?</p>
					<input type="password" name="userPw" id="userPw" size="20" maxlength="16" placeholder="비밀번호 입력">
				</div>
				<!-- bottom -->
				<div class="bottom">
					<button type="submit" onclick="checkIt()">글삭제</button>
					<button type="button" id="subButton" onclick="document.location.href='boardlist.jsp?pageNum=<%=pageNum%>'">취소</button>
				</div>
			</form>
		</div>
	</div>

</body>
</html>