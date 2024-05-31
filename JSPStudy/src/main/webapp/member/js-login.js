/**
 * 
 */
//모든 내용을 점검하여 이상이 없으면 서버로 전송한다.
 //이상이 있으면 경고창과 전송버튼의 이벤트 기능을 막는다.(전송: 서버로 전송하는 기능)
function allCheck(event) {
  const userId = document.querySelector("#userId");
  const userPw = document.querySelector("#userPw");
  if (userId.value === "") {
    alert(`아이디를 입력하세요.`);
    event.preventDefault();
  }else if(userPw.value === ""){
    alert(`비밀번호를 입력하세요.`);
    event.preventDefault();
  }else {
    alert(`로그인 성공`);
    return true;
  }
}

