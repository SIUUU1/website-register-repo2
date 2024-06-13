<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="tripair.PaymentDAO"%>
<%
String airports_id = request.getParameter("airports_id");
//비즈니스석 존재 확인
PaymentDAO dao = PaymentDAO.getInstance();
//-1:데이터베이스오류 0:비즈니스석 없음 양수:비즈니스석 있음
int check = dao.checkPrestige(Integer.parseInt(airports_id));
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<div class="delete-box">
		<div id="back">
			<!-- top -->
			<h1 id="title">항공권 예매</h1>
			<form action="paymentProc.jsp" method="post" name="paymentForm">
				<!-- middle-top -->
				<div class="middle-top">
				<%
				if(check != 0){
					%>
					<input type="number" name="prestige_count" id="prestige_count" placeholder="예매할 비즈니스석 인원수" min="1" max="20"><br> 
					<input type="number" name="economy_count" id="economy_count" placeholder="예매할 일반석 인원수" min="1" max="20"><br> 
					<%
				}else {
					%>
					<input type="number" name="economy_count" id="economy_count" placeholder="예매할 일반석 인원수" min="1" max="20"><br> 
					<%
				}
				%>
					<input type="text" name="customer_name" id="customer_name" size="20" maxlength="10" placeholder="이름"><br> 
					<input type="tel" name="customer_phone" id="customer_phone" size="20" maxlength="13" placeholder="010-0000-0000"><br> 
					<input type="email" name="customer_email" id="customer_email" size="20" maxlength="40" placeholder="이메일">
				</div>
				<!-- bottom -->
				<div class="bottom">
					<button type="submit" onclick="checkIt()">결제하기</button>
					<a href="selectForm.jsp"><button type="button" id="subButton">취소</button></a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>