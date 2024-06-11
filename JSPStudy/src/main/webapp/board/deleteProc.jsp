<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="java.sql.Timestamp"%>
<%
String contextPath = request.getContextPath();
request.setCharacterEncoding("utf-8");
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
String userPw = request.getParameter("userPw");
BoardDAO dbpro = BoardDAO.getInstance();
int check = dbpro.deleteArticle(num, userPw);
//1 삭제완료, 0 비밀번호 틀림, -1 데이터베이스 오류
if(check==1){
	%>
	<meta http-equiv="Refresh" content="0;url=<%=contextPath%>/member/main.jsp?middleFile=/board/boardList.jsp?pageNum=<%=pageNum%>">
	<% 
}else if(check==0){
	%>
	<script language="JavaScript">
	alert("비밀번호가 맞지 않습니다.");
	history.go(-1);
	</script>
	<% 
}else {
	%>
	<script language="JavaScript">
	alert("글 삭제 실패했습니다.");
	history.go(-1);
	</script>
	<% 
}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>