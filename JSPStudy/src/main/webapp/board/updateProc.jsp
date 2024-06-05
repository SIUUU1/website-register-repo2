<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="board.BoardVO"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="article" class="board.BoardVO" scope="page" />
<jsp:setProperty property="*" name="article" />
<%
//자바빈즈에서 받지 못한 데이터 값을 getParameter로 받는다.
String pageNum = request.getParameter("pageNum");
BoardDAO dbpro = BoardDAO.getInstance();
int check = dbpro.updateArticle(article);
//1 수정성공, 0 패스워드 불일치, -1 데이터베이스 오류
if (check == 1) {
%>
<meta http-equiv="Refresh" content="0;url=list.jsp?pageNum=<%=pageNum%>">
<%
} else if (check == 0) {
%>
<script language="JavaScript">
	alert("비밀번호가 맞지 않습니다.");
	history.go(-1);
</script>
<%
} else {
%>
<script language="JavaScript">
	alert("비밀번호가 맞지 않습니다.");
	history.go(-1);
</script>
<%
}
%>