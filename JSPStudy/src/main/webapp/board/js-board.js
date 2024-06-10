function emailCheck() {
	const email = document.querySelector("#email");
	const emailInfo = document.querySelector("#emailInfo");
	const regExpEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
	if (!email.value.match(regExpEmail)) {
		emailInfo.innerHTML = `올바른 이메일형식이 아닙니다.`;
		return false;
	} else {
		emailInfo.innerHTML = ``;
		return true;
	}
}

function pwCheck() {
	const userPw = document.querySelector("#userPw");
	const userPwInfo = document.querySelector("#userPwInfo");
	const regExpPw = /^[a-z0-9]{6,20}$/g;
	if (!userPw.value.match(regExpPw)) {
		userPwInfo.innerHTML = `영문자, 숫자만 포함하여 최소 6자이상 입력하세요.`;
		return false;
	} else {
		userPwInfo.innerHTML = ``;
		return true;
	}
}

function writeCheck() {
	if (document.writeForm.writer.value === "") {
		alert("작성자를 입력해주세요.");
		document.writeForm.writer.focus();
		return;
	} if (document.writeForm.email.value === "") {
		alert("이메일을 입력해주세요.");
		document.writeForm.email.focus();
		return;
	} if (document.writeForm.subject.value === "") {
		alert("제목을 입력해주세요.");
		document.writeForm.subject.focus();
		return;
	}
	if (document.writeForm.content.value === "") {
		alert("내용을 입력해주세요.");
		document.writeForm.content.focus();
		return;
	}
	if (document.writeForm.userPw.value === "") {
		alert("패스워드를 입력해주세요.");
		document.writeForm.userPw.focus();
		return;
	}
	if (emailCheck() === false) {
		alert("이메일을 올바르게 입력하세요.");
		document.writeForm.email.focus();
		return;
	}
	if (pwCheck() === false) {
		alert("패스워드를 올바르게 입력하세요.");
		document.writeForm.userPw.focus();
		return;
	}
	document.writeForm.submit();
}

function deleteCheck() {
	if (document.deleteForm.userPw.value === "") {
		alert("패스워드를 입력해주세요.");
		document.deleteForm.userPw.focus();
		return;
	}
	document.deleteForm.submit();
}