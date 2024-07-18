<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="qna.QnaDAO"%>
<%@ page import="qna.QnaVO"%>
<%@ page import="java.util.*"%>
<%
String loginID = (String) session.getAttribute("loginID");
QnaDAO dao = QnaDAO.getInstance();
int count = 0;
count = dao.getArticleCount(loginID);
if(loginID==null){
	%>
	<script language="JavaScript">
	alert("로그인이 필요한 페이지입니다.");
	window.location.href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/member/login.jsp";
	</script>
	<%
}else{
%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/qna/qnaList-style.css" />
</head>
<body>
<div id="qnaList">
<h1 id="title">내 문의내역</h1>
		<%
		if(count==0){
			%>
			<div id="qnaNo">
			<i class="fa-regular fa-comment-dots"></i>
				<span>문의내역이 없습니다.</span>
				궁금하신 사항은 1:1 문의하기를 이용해주세요.
				<button type="button" onclick="location.href='<%=request.getContextPath()%>/member/main.jsp?middleFile=/qna/qnaForm.jsp'">1:1 문의하기</button>
			</div>
		<%
		}else{
			List<QnaVO> articleList = dao.getArticles(count,loginID);
			for (int i = 0; i < articleList.size(); i++) {
				String category="";
				switch(articleList.get(i).getCategory()){
				case "1000": category="티켓"; break;
				case "2000": category="회원"; break;
				case "3000": category="기타"; break;
				default:break;
				
				}
		%>
		<table>
		<thead>
			<tr>
				<td>카테고리</td>
				<td>제목</td>
				<td>내용</td>
				<td>작성일</td>
				<td>수정</td>
				<td>삭제</td>
			</tr>
		</thead>
		<tr>
			<td><%=category%></td>
			<td><%=articleList.get(i).getSubject()%></td>
			<td><%=articleList.get(i).getQna_content()%></td>
			<td><%=articleList.get(i).getReg_date()%></td>
			<td></td>
			<td onclick="location.href='<%=request.getContextPath()%>/member/main.jsp?middleFile=/qna/qnaUpdateForm.jsp?qna_id=<%=articleList.get(i).getQna_id()%>'">
			<i class="fa-solid fa-pen"></i></td>
			<td 
			onclick="location.href='<%=request.getContextPath()%>/qna/qnaDeletePro.jsp?qna_id=<%=articleList.get(i).getQna_id()%>&group_id=<%=articleList.get(i).getGroup_id()%>&qora=<%=articleList.get(i).getQora()%>'">
			<i class="fa-solid fa-minus"></i></td>
	 	</tr>
 		<%
		}//end of for
		%>
		</table>
		<%
		}//end of else
		%>
		</div>
</body>
<%@ include file="/member/bottom.jsp" %>
<%
}//end of if(loginID==null)
%>
