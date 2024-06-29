<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="tripair.PaymentDAO"%>
<%
String loginID = (String) session.getAttribute("loginID");
int count = (Integer)session.getAttribute("count");
String airports_id = request.getParameter("airports_id");
//비즈니스석 존재 확인
//-1:데이터베이스오류 0:비즈니스석 없음 양수:비즈니스석 있음
int check = Integer.parseInt(request.getParameter("check"));
PaymentDAO dao = PaymentDAO.getInstance();
if(loginID==null){
	%>
	<script language="JavaScript">
	alert("로그인이 필요한 페이지입니다.");
	window.location.href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/member/login.jsp";
	</script>
	<%
}else {
%>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/tripair/paymentForm-style.css?ver=<%=(int)(Math.random()*1000)%>">
<script src="<%=request.getContextPath()%>/tripair/js-tripair.js?ver=<%=(int)(Math.random()*1000)%>" defer></script>
</head>
<body>
<h1 id="title">항공권 예매</h1>
<form action="<%=request.getContextPath()%>/tripair/paymentRegProc.jsp" method="post" name="paymentForm">
	 <input type="hidden" name="airports_id" id="airports_id" value="<%=airports_id%>">
	 <table>
				<!-- middle-top -->
					<%
					if (check != 0) {
					%>
					<tr>
					<td class="title">좌석</td>
					 <td class="content">
					<select name="seatType" id="seatType" class="topSelectBox" onchange="changCount()">
       		 <option value=1 selected>일반석</option>
       		 <option value=2 selected>비즈니스석</option>
    			</select>
					비즈니스석<input type="number" name="prestige_count" id="prestige_count" class="count" value="<%=count%>" readonly> 석
					일반석<input type="number" name="economy_count" id="economy_count" class="count" value="<%=count%>" readonly> 석
					</td>
					<%
					} else {
					%>
					<tr>
					<td class="content" colspan="2">
					<input type="hidden" name="prestige_count" id="prestige_count" value="0"> 
					일반석<input type="number" name="economy_count"	id="economy_count" class="count" value="<%=count%>" readonly> 석<br>
					</td>
					<%
					}
					int num=1;
					for(int i=0;i<count;i++,num++){
						
						%>
						<tr><td class="content" cols="2"><span>탑승자 <%=num %> 정보</span><br></td></tr>
						<tr>
        		<td class="title"><label for="customer_name">이름</label></td>
        		<td class="content">
          	<input type="text" name="customer_name" id="customer_name" size="20" maxlength="10" placeholder="탑승자 이름">
        		</td>
      			</tr>
						<tr>
        		<td class="title"><label for="customer_phone">전화번호</label></td>
        		<td class="content">
          	<input type="tel" name="customer_phone" id="customer_phone" size="20" maxlength="13" placeholder="010-0000-0000">
        		</td>
      			</tr>
      			<tr>
        		<td class="title"><label for="customer_email">이메일</label></td>
        		<td class="content">
          	<input type="email" name="customer_email" id="customer_email" size="20"	maxlength="40" placeholder="이메일">
        		</td>
      			</tr>
      			
						<%
					}
					%>
					</table>
					<div class="payButton">
					<button type="submit" id="subButton" onclick="checkIt()">결제하기</button>
					<a href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/tripair/selectForm.jsp"><button
							type="button" id="subButton">취소</button></a>
					</div>
					</form>
</body>
</html>
<%
}//end of if(loginID==null)
%>