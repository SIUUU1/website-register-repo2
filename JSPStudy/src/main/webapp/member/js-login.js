//모든 내용을 점검하여 이상이 없으면 서버로 전송한다.
//이상이 있으면 경고창과 전송버튼의 이벤트 기능을 막는다.(전송: 서버로 전송하는 기능)
function inputCheck() {
	if (document.loginForm.userId.value === "") {
		alert("아이디를 입력해주세요.");
		document.loginForm.userId.focus();
		return;
	}
	if (document.loginForm.userPw.value === "") {
		alert("패스워드를 입력해주세요.");
		document.loginForm.userPw.focus();
		return;
	}
	document.loginForm.submit();
}
//이름 입력할 때마다 점검
function userNameCheck() {
	const userName = document.querySelector("#userName");
	const regExpName = /^[가-힣]{2,6}$/;
	if (!userName.value.match(regExpName)) {
		return false;
	} else {
		return true;
	}
}
//전화번호 입력할 때마다 점검
function userPhoneNumCheck() {
	const userPhoneNum = document.querySelector("#userPhoneNum");
	const regExpPhoneNum = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
	if (!userPhoneNum.value.match(regExpPhoneNum)) {
		return false;
	} else {
		return true;
	}
}
//비밀번호 입력할 때마다 점검
//비밀번호 확인 입력할 때마다 점검
function userPwCheck(state) {
	const userPw = document.querySelector("#userPw");
	const userPwConfirm = document.querySelector("#userPwConfirm");
	const regExpPassword = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,16}$/;
	switch (state) {
		case "keyup":
			if (!userPw.value.match(regExpPassword)) {
				return false;
			} else {
				return true;
			}
		case "blur":
			if (userPw.value === userPwConfirm.value) {
				return true;
			} else {
				return false;
			}
		default: break;
	}
}
//identifyForm 내용을 점검하여 이상이 없으면 서버로 전송한다.
function allCheck() {
	if (document.identifyForm.userName.value === "") {
		alert("이름을 입력해주세요.");
		document.identifyForm.userName.focus();
		return;
	}
	if (document.identifyForm.userPhoneNum.value === "") {
		alert("전화번호를 입력해주세요.");
		document.identifyForm.userPhoneNum.focus();
		return;
	}
	if (userPhoneNumCheck() === false) {
		alert("010-0000-0000 형식으로 입력하세요.");
		document.identifyForm.userPhoneNum.value = "";
		document.identifyForm.userPhoneNum.focus();
	}
	if (userNameCheck() === false) {
		alert("한글로 최소 2자 이상 입력하세요.");
		document.identifyForm.userName.value = "";
		document.identifyForm.userName.focus();
		return;
	}
	document.identifyForm.submit();
}
//identifyForm 내용을 점검하여 이상이 없으면 서버로 전송한다.
function check() {
	if (document.identifyForm.userId.value === "") {
		alert("아이디를 입력해주세요.");
		document.identifyForm.userId.focus();
		return;
	}
	if (document.identifyForm.userPhoneNum.value === "") {
		alert("전화번호를 입력해주세요.");
		document.identifyForm.userPhoneNum.focus();
		return;
	}
	if (userPhoneNumCheck() === false) {
		alert("010-0000-0000 형식으로 입력하세요.");
		document.identifyForm.userPhoneNum.value = "";
		document.identifyForm.userPhoneNum.focus();
	}
	document.identifyForm.submit();
}
//패스워드 재설정 내용을 점검하여 이상이 없으면 서버로 전송한다.
function checkIt() {
	if (document.resetPwForm.userPw.value === "") {
		alert("비밀번호를 입력해주세요.");
		document.resetPwForm.userPw.focus();
		return;
	}
	if (document.resetPwForm.userPwConfirm.value === "") {
		alert("비밀번호를 재입력해주세요.");
		document.resetPwForm.userPwConfirm.focus();
		return;
	}
	if (userPwCheck("keyup") === false) {
		alert("영문자, 숫자, 특수문자를 포함하여 8-16자를 입력하세요.");
		document.resetPwForm.userPw.value = "";
		document.resetPwForm.userPwConfirm.value = "";
		return;
	}
	if (userPwCheck("blur") === false) {
		alert("비밀번호와 일치하지 않습니다.");
		return;
	}
	document.resetPwForm.submit();
}
