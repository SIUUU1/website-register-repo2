<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="board.BoardVO"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
String contextPath = request.getContextPath();
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
<html lang="en">
<head>
<title>content</title>
<link rel="stylesheet"
	href="<%=contextPath%>/board/content-style.css?ver=<%=(int) (Math.random() * 1000)%>">
<script src="<%=contextPath%>/board/js-board.js?ver=<%=(int) (Math.random() * 1000)%>" defer></script>
</head>
<body>
	<h1 id="title">게시판</h1>
	<section id="mainSection">
		<div id="subject">
			<div><%=article.getSubject()%></div>
			<div><%=article.getWriter()%>&nbsp;	|&nbsp;	<%=sdf.format(article.getRegdate())%></div>
		</div>
		<p id="boardContent"><%=article.getContent()%></p>
	<div class="contentB">
	<button type="button" id="replyB" 
	onclick="document.location.href='<%=contextPath%>/member/main.jsp?middleFile=/board/adminWriteForm.jsp?num=<%=article.getNum()%>&ref=<%=article.getRef()%>&step=<%=article.getStep()%>&depth=<%=article.getDepth()%>'">답변</button>
	<div>
	<button type="button" id="modiB" 
	onclick="document.location.href='<%=contextPath%>/member/main.jsp?middleFile=/board/adminUpdateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">수정</button>
	<button type="button" id="delB" 
	onclick="document.location.href='<%=contextPath%>/member/main.jsp?middleFile=/board/adminDeletePro.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">삭제</button>
	<button type="button" id="listB" 
	onclick="document.location.href='<%=contextPath%>/member/main.jsp?middleFile=/board/boardTotalList.jsp?pageNum=<%=pageNum%>'">목록</button>
	</div>
	</div>
	</section>
	<%
	} catch (Exception e) {
	e.printStackTrace();
	}
 %>
</body>
</html>