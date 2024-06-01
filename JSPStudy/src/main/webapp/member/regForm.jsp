<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html lang="ko">
<head>
  <title>회원가입</title>
  <link rel="stylesheet" href="regForm-style.css?ver=4">
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="./js-regForm.js" defer></script>
</head>
<body onload="init()">
  <h1 id="title">회원가입</h1>
  <form action="regProc.jsp" method="post" name="regForm">
    <h4>사이트 이용정보 입력</h4>
    <table>
      <tr>
        <td class="title"><label for="userId">아이디</label></td>
        <td class="content">
          <input class="request" type="text" name="userId" id="userId" size="25" maxlength="20" onkeyup="userIdCheck()" onkeypress="">
          <button type="button" id="buttonId" onclick="idCheck(this.form.userId.value)">ID중복검색</button>
          <span id="userIdInfo"></span><br>
        </td>
      </tr>
      <tr>
        <td class="title"><label for="userPw">비밀번호</label></td>
        <td class="content">
          <input class="request" type="password" name="userPw" id="userPw" size="25" maxlength="20" onkeyup="userPwCheck('keyup')">
          <span id="userPwInfo"></span><br>
        </td>
      </tr>
      <tr>
        <td class="title"><label for="userPwConfirm">비밀번호 확인</label></td>
        <td class="content">
          <input type="password" name="userPwConfirm" id="userPwConfirm" size="25" maxlength="20" onblur="userPwCheck('blur')">
          <span id="userPwConfirmInfo"></span><br>
        </td>
      </tr>
    </table>
    <h4>개인정보 입력</h4>
    <table>
      <tr>
        <td class="title"><label for="userName">이름</label></td>
        <td>
          <input class="request" type="text" name="userName" id="userName" size="25" maxlength="6" onkeyup="userNameCheck()">
          <span id="userNameInfo"></span><br>
        </td>
      </tr>
      <tr>
        <td class="title"><label for="userNickName">닉네임</label></td>
        <td>
          <input class="request" type="text" name="userNickName" id="userNickName" size="25" maxlength="20" onkeyup="userNickNameCheck()">
          <span id="userNickNameInfo"></span><br>
        </td>
      </tr>
      <tr>
        <td class="title"><label for="userEmail">E-mail</label></td>
        <td>
          <input class="request" type="email" name="userEmail" id="userEmail" size="25" maxlength="40" onkeyup="userEmailCheck()">
          <span id="userEmailInfo"></span><br>
        </td>
      </tr>
      <tr>
        <td class="title"><label for="searchInternet">가입경로</label></td>
        <td class="path">
          <input type="radio" name="subscriptionPath" id="subscriptionPath1" value="인터넷검색">
          <label for="subscriptionPath1">인터넷검색</label>
          <input type="radio" name="subscriptionPath" id="subscriptionPath2" value="배너광고">
          <label for="subscriptionPath2">배너광고</label>
          <input type="radio" name="subscriptionPath" id="subscriptionPath3" value="관련기사">
          <label for="subscriptionPath3">관련기사</label>
          <input type="radio" name="subscriptionPath" id="subscriptionPath4" value="KH홈페이지">
          <label for="subscriptionPath4">KH홈페이지</label>
          <input type="radio" name="subscriptionPath" id="subscriptionPath5" value="주변지인소개">
          <label for="subscriptionPath5">주변지인소개</label>
          <input type="radio" name="subscriptionPath" id="subscriptionPath6" value="기타">
          <label for="subscriptionPath6">기타</label>
        </td>
      </tr>
      <tr>
        <td class="title"><label for="userTel">전화번호</label></td>
        <td>
          <input class="request" type="tel" name="userTel" id="userTel" size="25" maxlength="12" onkeyup="userTelCheck()">
          <span id="userTelInfo"></span><br>
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
        <td class="title"><label for="userBirthday">생년월일</label></td>
        <td><input type="date" name="userBirthday" id="userBirthday"></td>
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
    <h4>기타 개인설정</h4>
    <table>
      <tr>
        <td class="title">카카오톡 메세지</td>
        <td class="allow">
          <input type="checkbox" name="kakaoService" id="kakaoService" value="1" checked>
          <label for="kakaoService">카카오톡 메세지를 받겠습니다.</label>
          <span class="redtext">>수신체크를 하시면 세일 소식을 가장 먼저 받아보실 수 있습니다.</span>
        </td>
      </tr>
      <tr>
        <td class="title">메일링서비스</td>
        <td class="allow">
          <input type="checkbox" name="emailService" id="emailService" value="1" checked>
          <label for="emailService">정보 메일을 받겠습니다.</label>
        </td>
      </tr>
      <tr>
        <td class="title">SNS 수신여부</td>
        <td class="allow">
          <input type="checkbox" name="snsService" id="snsService" value="1" checked>
          <label for="snsService">휴대폰 문자메세지를 받겠습니다.</label>
        </td>
      </tr>
      <tr>
        <td class="title">정보공개</td>
        <td>
          <div class="allow">
          <input type="checkbox" name="disclosureInfo" id="disclosureInfo" value="1" checked>
            <label for="disclosureInfo">타인이 나의 정보를 볼 수 있도록 합니다.</label>
          </div>
        </td>
      </tr>
      <tr>
        <td class="title">자동등록방지</td>
        <td>
          <span id="autoRegiCode">XHYwW2nq</span>
          <button type="button"  id="autoRegiCodeButton" onclick="codeCreate()">코드생성</button>
          <label for="autoRegiPrevention"></label>
          <input class="request" type="text" name="autoRegiPrevention" id="autoRegiPrevention" size="10"
            maxlength="8">
          <button type="button" id="codeConfirmButton" onclick="codeConfirm()">비교</button>
          <span id="autoRegiPreventionInfo"></span>
        </td>
      </tr>
    </table>
    <div class="regButton">
      <button type="button" id="subButton" onclick="inputCheck()">회원가입</button>
      <button type="reset">취소</button>
    </div>
  </form>
</body>
</html>