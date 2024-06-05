<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="board.BoardVO"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
int num = Integer.parseInt(request.getParameter("num"));
int pageNum = Integer.parseInt(request.getParameter("pageNum"));
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
try {
	BoardDAO dbPro = BoardDAO.getInstance();
	BoardVO article = dbPro.getArticle(num);
	int ref = article.getRef();
	int step = article.getStep();
	int depth = article.getDepth();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>content</title>
<link rel="stylesheet"
	href="content-style.css?ver=<%=(int) (Math.random() * 1000)%>">
<script src="js-content.js?ver=<%=(int) (Math.random() * 1000)%>" defer></script>
</head>
<body>
	<h1 id="title">우리반 게시판</h1>
	<section id="mainSection">
		<div id="subject">
			<div><%=article.getSubject()%></div>
			<div><%=article.getWriter()%>	|	<%=article.getRegdate()%></div>
		</div>
		<p><%=article.getContent()%></p>
	</section>
	<div class="contButton">
	<button type="button" id="replyB" onclick="document.location.href='writeForm.jsp?num=<%=article.getNum()%>&ref=<%=article.getRef()%>&step=<%=article.getStep()%>&depth=<%=article.getDepth()%>'">답변</button>
	<button type="button" id="modiB" onclick="document.location.href='updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">수정</button>
	<button type="button" id="delB" onclick="document.location.href='deleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">삭제</button>
	<button type="button" id="listB" onclick="document.location.href='boardlist.jsp?pageNum=<%=pageNum%>'">목록</button>
	</div>
	<%
	} catch (Exception e) {
	e.printStackTrace();
	}
 %>
</body>
</html>