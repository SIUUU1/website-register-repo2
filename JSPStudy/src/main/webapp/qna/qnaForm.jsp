<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String loginID = (String) session.getAttribute("loginID");
%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/qna/write.js" defer></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/qna/qnaForm-style.css" />
</head>
<body>
<div id="qnaForm">
	<form action="<%=request.getContextPath()%>/qna/qnaPro.jsp" method="post">
	<input type="hidden" id="qna_writer" name="qna_writer" value="<%=loginID%>">
    <input type="hidden" id="qora" name="qora" value="1">
	<h3 id="title">1:1 문의하기</h3>
	<p><label for="category">문의 유형</label></p>
	<select id="category" name="category">
		<option value="문의 유형을 선택해주세요">문의 유형을 선택해주세요.</option>
		<option value="1000">티켓</option>
		<option value="2000">회원</option>
		<option value="3000">기타</option>
	</select>
	<p>문의 내용</p>
	<input type="text" id="subject" name="subject" placeholder="제목을 입력해주세요.">
	<textarea id="qna_content" name="qna_content" rows="13" cols="75" placeholder="문의 내용을 자세히 입력해주세요."></textarea>
	<div id="writeBDiv">
		<button id="regist" onclick="check()">문의하기</button>
	</div>
	</form>
</div>	
</body>
<%@ include file="/member/bottom.jsp" %>