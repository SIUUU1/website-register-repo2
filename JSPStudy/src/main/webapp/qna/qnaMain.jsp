<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="member.*"%>
<%@page import="faq.*"%>
<%@page import="java.util.*"%>
<%
String loginID = (String) session.getAttribute("loginID");
MemberDAO mdao = MemberDAO.getInstance();
MemberVO vo = mdao.getMember(loginID);

FaqDAO fdao = FaqDAO.getInstance();
ArrayList<FaqVO> faqList = fdao.getFaqList();
if(loginID == null){
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
<link rel="stylesheet" href="<%=request.getContextPath()%>/qna/qna-style.css">
<script src="<%=request.getContextPath()%>/qna/js-faq.js" defer></script>
</head>
<body>
	<div id="qnaMain">
		<h3 id="title"><%=vo.getUserName()%>님, 무엇을 도와드릴까요?
		</h3>
		<div id=qnaSearch>
			<div >
				<i class="fa-solid fa-magnifying-glass"></i> &nbsp;&nbsp; 
				<input id="searchInput" type="text" placeholder="궁금한 점을 물어보세요." onkeyup="enterFunc()">
			</div>
		</div>
		<!-- 자주 묻는 질문 -->
		<p>자주 묻는 질문</p>
		<div id="qnaMainB">
			<button type="button" name="1000" onclick="sortFaq(this)">티켓</button>
			<button type="button" name="2000" onclick="sortFaq(this)">회원</button>
			<button type="button" name="3000" onclick="sortFaq(this)">기타</button>
		</div>
		<div id="faqList">
		<%
		for(int i=0;i<faqList.size();i++){
			FaqVO faq = faqList.get(i);
			String cat = "";
			switch(faq.getFaq_category()){
			case 1000: cat="cat1000"; break;
			case 2000: cat="cat2000"; break;
			case 3000: cat="cat3000"; break;
			default:break;
			}
			%>
			<div class="faq cat <%=cat%>" onclick="showContent('<%=faq.getFaq_no()%>')" id=" <%=faq.getFaq_title()%>">
			<i class="fa-brands fa-quora"></i> <%=faq.getFaq_title()%>
			<div class="faqCon" id="<%=faq.getFaq_no()%>"><%=faq.getFaq_content()%></div>
			</div>
			<%
		}
		%>
		</div>
		<p>다른 도움이 필요하신가요?</p>
		<div class="help"
			onclick="location.href='<%=request.getContextPath()%>/member/main.jsp?middleFile=/qna/qnaForm.jsp'">
			<i class="fa-regular fa-comment-dots"></i>
			<div>
				<span>1:1 문의하기</span>자세한 상담이 가능해요.
			</div>
		</div>
		<div class="help"
			onclick="location.href='<%=request.getContextPath()%>/member/main.jsp?middleFile=/qna/qnaList.jsp'">
			<i class="fa-regular fa-pen-to-square"></i>
			<div>
				<span>내 문의내역 보기</span>문의한 내용을 확인해보세요.
			</div>
		</div>
	</div>
</body>
<%@ include file="/member/bottom.jsp"%>
<% 
}
%>