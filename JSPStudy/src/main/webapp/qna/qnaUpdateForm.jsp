<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="qna.QnaDAO"%>
<%@ page import="qna.QnaVO" %>
<%
String loginID = (String) session.getAttribute("loginID");
int qna_id =  Integer.parseInt(request.getParameter("qna_id"));
//수정할 qna 가져오기
QnaDAO dao = QnaDAO.getInstance();
QnaVO qna = dao.updateGetArticle(qna_id);
String selectedCategroy = qna.getCategory();
%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/qna/write.js" defer></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/qna/qnaForm-style.css" />
</head>
<body>
<div id="qnaForm">
<form action="<%=request.getContextPath()%>/qna/qnaUpdatePro.jsp">
<input type="hidden" id="qna_id" name="qna_id" value="<%=qna_id%>">
<h3 id="title">1:1 문의하기</h3>
<p><label for="category">문의 유형</label></p>
<select id="category" name="category">
	<option value="문의 유형을 선택해주세요">문의 유형을 선택해주세요.</option>
	<option value="1000" <%= "1000".equals(selectedCategroy) ? "selected" : "" %>>티켓</option>
	<option value="2000" <%= "2000".equals(selectedCategroy) ? "selected" : "" %>>회원</option>
	<option value="3000" <%= "3000".equals(selectedCategroy) ? "selected" : "" %>>기타</option>
 </select>
<p>문의 내용</p>
<input type="text" id="subject" name="subject" value="<%=qna.getSubject()%>">
<textarea id="qna_content" name="qna_content" rows="13" cols="75"><%=qna.getQna_content()%></textarea>
	<div id="editBdiv">
	<button type="button" id="cancle" onclick="javascript:window.location='<%=request.getContextPath()%>/member/main.jsp?middleFile=/qna/qnaMain.jsp'">취소</button>
	<button id="update">수정</button>
	</div>
</form>
</div>
</body>
<%@ include file="/member/bottom.jsp" %>