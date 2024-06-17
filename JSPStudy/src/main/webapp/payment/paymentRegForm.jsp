<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="member.MemberDAO"%>
<%@ page import="member.MemberVO"%>
<%
String loginID = (String) session.getAttribute("loginID");
MemberDAO mdao = MemberDAO.getInstance();
MemberVO member = mdao.getMember(loginID);
String[] cart_id = request.getParameterValues("cart_id");
session.setAttribute("cart_id", cart_id);
%>
<!DOCTYPE html>
<html>
<head>
<title>payment register form</title>
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="<%=request.getContextPath()%>/payment/js-paymentRegForm.js?ver=<%=(int)(Math.random()*1000)%>" defer></script>
</head>
<body>
 <h1 id="title">결제</h1>
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
    </table>
      <div class="regButton">
      <button type="submit" id="subButton" onclick="inputCheck()">결제하기</button>
      <button type="button" onclick="location.href='<%=request.getContextPath()%>/member/main.jsp?middleFile=/cart/cartList.jsp'">취소</button>
    </div>
  </form>
</body>
</html>