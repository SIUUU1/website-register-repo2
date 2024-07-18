<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.MemberVO"%>
<%@page import="member.MemberDAO"%>    
<%
String loginID = (String) session.getAttribute("loginID");
MemberDAO dao = MemberDAO.getInstance();
MemberVO vo = dao.getMember(loginID);
%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/qna/qna-style.css">
</head>
<body>
<div id="qnaMain">
<h3 id="title"><%=vo.getUserName()%>님, 무엇을 도와드릴까요?</h3>
<div id=qnaSearch>
<form action="">
<i class="fa-solid fa-magnifying-glass"></i> &nbsp;&nbsp;
<input type="text" placeholder="궁금한 점을 물어보세요.">
</form>
</div>
<!-- 자주 묻는 질문 -->
<p>자주 묻는 질문</p>
<div id="qnaMainB">
<button type="button">티켓</button>
<button type="button">회원</button>
<button type="button">기타</button>
</div>
<div>
자주묻는리스트
</div>
<p>다른 도움이 필요하신가요?</p>
<div class="help" onclick="location.href='<%=request.getContextPath()%>/member/main.jsp?middleFile=/qna/qnaForm.jsp'">
<i class="fa-regular fa-comment-dots"></i>
<div><span>1:1 문의하기</span>자세한 상담이 가능해요.</div></div>
<div class="help" onclick="location.href='<%=request.getContextPath()%>/member/main.jsp?middleFile=/qna/qnaList.jsp'">
<i class="fa-regular fa-pen-to-square"></i>
<div><span>내 문의내역 보기</span>문의한 내용을 확인해보세요.</div></div>
</div>
</body>
<%@ include file="/member/bottom.jsp" %>
