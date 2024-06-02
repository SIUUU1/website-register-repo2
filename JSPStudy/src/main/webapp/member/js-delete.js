/**
 * 
 */
function begin() {
	document.deleteForm.userPw.focus();
}
function checkIt() {
	if (!document.deleteForm.userPw.value) {
		alert("비밀번호를 입력하지 않았습니다.");
		document.myForm.userPw.focus();
		return;
	} 
	document.deleteForm.submit();
}
