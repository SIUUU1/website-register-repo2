<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "board.BoardDAO" %>
<%@ page import = "java.sql.Timestamp" %>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="article" class="board.BoardVO" scope="page"/>
<jsp:setProperty property="*" name="article"/>
<%
String contextPath = request.getContextPath();
article.setRegdate(new Timestamp(System.currentTimeMillis()));
article.setIp(request.getRemoteAddr());
BoardDAO dao = BoardDAO.getInstance();
dao.insertArticle(article);
%>
<meta http-equiv="Refresh" content="0;url=<%=contextPath%>/member/main.jsp?middleFile=/board/boardList.jsp">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
</body>
</html>