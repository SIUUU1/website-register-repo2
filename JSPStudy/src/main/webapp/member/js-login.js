/**
 * 
 */
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

