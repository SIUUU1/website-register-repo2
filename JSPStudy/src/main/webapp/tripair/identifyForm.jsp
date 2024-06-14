<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>identifyForm</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/tripair/identifyForm-style.css?ver=<%=(int) (Math.random() * 1000)%>">
</head>
<body>
<div class="identify-box">
		<div id="back">
			<!-- top -->
			<h1 id="title">예매 항공권 확인</h1>
			<form action="<%=request.getContextPath()%>/member/main.jsp?middleFile=/tripair/paymentList.jsp" method="post" name="identifyForm">
				<!-- middle-top -->
				<div class="middle-top">
					<input type="text" name="customer_name" id="customer_name" size="20"
						maxlength="10" placeholder="이름"> <br> 
						<input type="tel" name="customer_phone" id="customer_phone" size="20" maxlength="13"
						placeholder="전화번호">
				</div>
				<!-- bottom -->
				<div class="bottom">
					<button type="submit">항공권 확인</button>
					<a href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/tripair/selectForm.jsp"><button type="button" id="subButton">메인페이지</button></a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>