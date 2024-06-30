<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="member.MemberDAO"%>
<%@ page import="cart.CartDAO" %>
<%@ page import="member.MemberVO"%>
<%@ page import="java.util.*" %>
<%
String loginID = (String) session.getAttribute("loginID");
//결제할 장바구니 항목 가져오기
String[] cart_id = (String[])session.getAttribute("cart_id");
CartDAO cdao = CartDAO.getInstance();
Vector<String[]> cartList=cdao.getCartTotalList(cart_id);

//회원 정보가져오기
MemberDAO mdao = MemberDAO.getInstance();
MemberVO member = mdao.getMember(loginID);
String userName = member.getUserName();
String userPhoneNum = member.getUserPhoneNum();
String postCode = member.getPostCode();
String defaultAddress = member.getDefaultAddress();
String detailedAddress = member.getDetailedAddress();
String extraAddress = member.getExtraAddress();
if(loginID == null){
	%>
	<script language="JavaScript">
	alert("로그인이 필요한 페이지입니다.");
	window.location.href="<%=request.getContextPath()%>/member/main.jsp?middleFile=/member/login.jsp";
	</script>
	<%
}else{
	%>
<html>
<head>
<title>payment register form</title>
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="<%=request.getContextPath()%>/payment/js-paymentRegForm.js?ver=<%=(int)(Math.random()*1000)%>" defer></script>
</head>
<body>
 <h1 id="title">결제창</h1>
 <!-- 선택한 장바구니 리스트 -->
 <h2>결제 항목</h2>
 <table>
		<thead>
			<tr>
				<td>공연명</td>
				<td>공연일</td>
				<td>예매좌석</td>
				<td>총 예매수</td>
				<td>총 티켓가격</td>
				<td></td>
				<td></td>
			</tr>
		</thead>
		<%
		for (int i = 0; i < cartList.size(); i++) {
		%>
		<tr>
			<td><%=cartList.get(i)[1]%></td>
			<td><%=cartList.get(i)[2]%></td>
			<td><%=cartList.get(i)[3]%></td>
			<td><%=cartList.get(i)[4]%></td>
			<td><%=cartList.get(i)[5]%></td>
	 </tr>
 <%
		}//end of for
		%>
</table>
 <button type="button" onclick="getUserInfo('<%=userName%>','<%=userPhoneNum%>','<%=postCode%>','<%=defaultAddress%>','<%=detailedAddress%>','<%=extraAddress%>')">본인정보가져오기</button>
  <form action="<%=request.getContextPath()%>/payment/paymentRegProc.jsp" method="post" name="paymentForm">
   <table>
      <tr>
        <td class="title"><label for="userName">이름</label></td>
        <td>
          <input class="request" type="text" name="userName" id="userName" size="25" maxlength="6" onkeyup="userNameCheck()">
          <span id="userNameInfo"></span><br>
        </td>
      </tr>
       <tr>
        <td class="title"><label for="userPhoneNum">휴대폰번호</label></td>
        <td>
          <input class="request" type="tel" name="userPhoneNum" id="userPhoneNum" size="25" maxlength="13" onkeyup="userPhoneNumCheck()">
          <span id="userPhoneNumInfo"></span><br>
        </td>
      </tr>
      <tr>
        <td class="title"><label for="">주소</label></td>
        <td id="address">
          <input class="request" type="text" name="postCode" id="postCode" placeholder="우편번호" readonly onclick="searchPostCode()" required>
          <button type="button" id="buttonAddress" onclick="searchPostCode()">우편번호검색</button><br>
          <input class="request" type="text" name="defaultAddress" id="defaultAddress" size="53" maxlength="50" placeholder="주소" readonly onclick="searchPostCode()">
          <span id="userAddressInfo"></span><br>
          <input type="text" name="detailedAddress" id="detailedAddress" size="25" maxlength="25" placeholder="상세주소">
          <input type="text" name="extraAddress" id="extraAddress" size="25" maxlength="25">
        </td>
      </tr>
      <tr>
      <td>총 포인트 : <%=member.getUserPoints()%>점</td>
      
       <td class="title">
       <label for="usingPoints">사용할 포인트</label></td>
       <td id="address">
       <input type="number" name="usingPoints" id="usingPoints">
      </td>
      </tr>
    </table>
      <div class="regButton">
      <button type="submit" id="subButton" onclick="inputCheck()">결제하기</button>
      <button type="button" onclick="location.href='<%=request.getContextPath()%>/member/main.jsp?middleFile=/cart/cartList.jsp'">취소</button>
    </div>
  </form>
</body>
</html>
<% 
}
%>