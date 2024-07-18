<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="qna.QnaDAO"%>
<%
int qna_id =  Integer.parseInt(request.getParameter("qna_id"));
int group_id =  Integer.parseInt(request.getParameter("group_id"));
int qora =  Integer.parseInt(request.getParameter("qora"));

QnaDAO dao = QnaDAO.getInstance();
int check=dao.deleteArticle(qna_id, group_id, qora);
//-1:데이터베이스 오류, 1:qna 삭제 성공, 0:qna 삭제 실패
if (check == 1) {
%>
<script language="JavaScript">
		alert("qna 삭제 성공");
		window.location.href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/qna/qnaMain.jsp";
</script>
<%
} else if (check == 0) {
%>
<script language="JavaScript">
		alert("qna 삭제 실패");
		history.go(-1);
</script>
<%
} else {
%>
<script language="JavaScript">
		alert("데이터베이스 오류입니다.");
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