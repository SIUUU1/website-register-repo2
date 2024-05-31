<%@page import="member.MemberVO"%>
<%@page import="java.util.Vector"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
MemberDAO dao = MemberDAO.getInstance();
Vector<MemberVO> mevList = dao.getMemberList();
%>
<html>
<head>
<title>회원리스트</title>
</head>
<body>
	<form action="memberListProc.jsp" method="post">
		<table align="center" width="1000" border="1">
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>이메일</th>
				<th>가입경로</th>
				<th>전화번호</th>
				<th>휴대폰번호</th>
				<th>생년월일</th>
				<th>우편번호</th>
				<th>주소</th>
				<th>상세주소</th>
				<th>참고주소</th>
				<th>카카오서비스</th>
				<th>메일링서비스</th>
				<th>SNS수신여부</th>
				<th>정보공개</th>
			</tr>
			<%
			for (MemberVO vo : mevList) {
			%>
			<tr>
				<td><%=vo.getUserId()%></td>
				<td><%=vo.getUserPw()%></td>
				<td><%=vo.getUserName()%></td>
				<td><%=vo.getUserNickName()%></td>
				<td><%=vo.getUserEmail()%></td>
				<td><%=vo.getSubscriptionPath()%></td>
				<td><%=vo.getUserTel()%></td>
				<td><%=vo.getUserPhoneNum()%></td>
				<td><%=vo.getUserBirthday()%></td>
				<td><%=vo.getPostCode()%></td>
				<td><%=vo.getDefaultAddress()%></td>
				<td><%=vo.getDetailedAddress()%></td>
				<td><%=vo.getExtraAddress()%></td>
				<td><%=(vo.getKakaoService().equals("1")) ? "o" : "x"%></td>
				<td><%=(vo.getEmailService().equals("1")) ? "o" : "x"%></td>
				<td><%=(vo.getSnsService().equals("1")) ? "o" : "x"%></td>
				<td><%=(vo.getDisclosureInfo().equals("1")) ? "o" : "x"%></td>
				<td><input type="checkbox" name="delete"
					value="<%=vo.getUserId()%>"></td>
			</tr>
			<%
			}
			%>
		</table>
		<div style="text-align: center; margin-top: 20px;">
			<input type="submit" value="삭제">
		</div>
	</form>
</body>
</html>