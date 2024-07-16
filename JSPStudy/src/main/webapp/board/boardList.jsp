<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="board.BoardVO"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
String contextPath = request.getContextPath();
//리스트에 보여줄 페이지 라인수(페이지당 10개를 보여주기)
int pageSize = 10;
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
//페이지를 지정한 것이 없으면 기본으로 1페이지를 셋팅한다.
String pageNum = request.getParameter("pageNum");
if (pageNum == null) {
	pageNum = "1";
}
//현재페이지와 현재페이지 시작라인, 끝라인을 계산한다.
int currentPage = Integer.parseInt(pageNum);
int startRow = (currentPage - 1) * pageSize + 1;
int endRow = currentPage * pageSize;

int count = 0;
int number = 0;
Vector<BoardVO> vecArticles = null;
BoardDAO dao = BoardDAO.getInstance();
count = dao.getArticleCount(); //전체 글수
if (count > 0) {
	vecArticles = dao.getArticles(startRow, endRow);
}
//번호순으로 보여주고 싶을 때 계산한다.
number = count - (currentPage - 1) * pageSize;
%>
<!DOCTYPE html>
<html>
<head>
<title>Board</title>
<link rel="stylesheet"
	href="<%=contextPath%>/board/boardlist-style.css?ver=<%=(int) (Math.random() * 1000)%>" />
<script src="<%=contextPath%>/board/js-board.js?ver=<%=(int) (Math.random() * 1000)%>"
	defer></script>
<script src="https://kit.fontawesome.com/8d66cd774b.js"	crossorigin="anonymous"></script>
</head>
<body>
	<h1 id="title">게시판</h1>
	<div class="select-box">
		<a href="<%=contextPath%>/member/main.jsp?middleFile=/board/writeForm.jsp"><button type="button" id="writeB">글쓰기</button></a>
	</div>
	<!-- table -->
	<table>
		<thead>
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회</td>
			</tr>
		</thead>
		<%
		if(count == 0){
			%>
				<tr>
					<td align="center" colspan="5">게시판에 저장된 글이 없습니다.</td>
				</tr>
			<%
		}else{
			for (int i = 0; i < vecArticles.size(); i++) {
				BoardVO article = vecArticles.elementAt(i);
		%>
		<tr>
			<td><%=number--%></td>
			<td>
				<%
				int wid = 0;
				if (article.getDepth() > 0) {
					wid = 5 * (article.getDepth());
				%> <img src="images/level.gif" width="<%=wid%>" height="16"> <img
				src="<%=contextPath%>/board/images/re.gif"> <%
 } else {
 %> <img src="<%=contextPath%>/board/images/level.gif" width="<%=wid%>" height="16"> <%
 }
 %> <a
				href="<%=contextPath%>/member/main.jsp?middleFile=/board/content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>"><%=article.getSubject()%></a>
				<%
				if (article.getReadcount() >= 20) {
				%> <img src="<%=contextPath%>/board/images/hot.gif" border="0" height="16"> <%
 }
 %>
			</td>
			<td><a href="mailto:<%=article.getEmail()%>"> <%=article.getWriter()%></a></td>
			<td><%=sdf.format(article.getRegdate())%></td>
			<td><%=article.getReadcount()%></td>
		</tr>
		<%
		}//end of for
		}//end of else
		%>
	</table>
	<footer class="newfooter">
		<%
		if (count > 0) {
			//하단 페이지 버튼 : [1][2][3][4][5]
			int pageBlock = 5;
			//전체 페이지 수 계산 (75->8페이지)
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int startPage = (int) ((currentPage - 1) / pageBlock) * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			//50(endPage) > 48(pageCount) 이럴때는 endPage = pageCount
			if (endPage > pageCount)
				endPage = pageCount;
			//페이지 출력 [이전] [번호][번호][번호][번호][번호] [다음]
			if (startPage > pageBlock) {
		%>
		<a href="<%=contextPath%>/member/main.jsp?middleFile=/board/boardList.jsp?pageNum=<%=startPage - pageBlock%>"><button
				type="button">
				<i class="fa-solid fa-chevron-left"></i>
			</button></a>
		<%
		}
		//페이지 출력 [번호][번호][번호][번호][번호]
		for (int i = startPage; i <= endPage; i++) {
		%>
		<a href="<%=contextPath%>/member/main.jsp?middleFile=/board/boardList.jsp?pageNum=<%=i%>"><button type="button"><%=i%></button>
		</a>
		<%
		}
		if (endPage < pageCount) {
		%>
		<a href="<%=contextPath%>/member/main.jsp?middleFile=/board/boardList.jsp?pageNum=<%=startPage + pageBlock%>"><button
				type="button">
				<i class="fa-solid fa-chevron-right"></i>
			</button></a>
		<%
		}
		}
		%>
	</footer>
</body>
</html>