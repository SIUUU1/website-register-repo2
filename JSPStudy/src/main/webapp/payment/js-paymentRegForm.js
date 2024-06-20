//우편번호검색 버튼 클릭시 OpenAPI를 이용해 우편번호가져오기
function searchPostCode() {
	new daum.Postcode({
		oncomplete: function(data) {
			//팝업에서 검색결과 항목을 클릭했을 때 실행할 코드 작성한 부분
			//각 주소의 노출 규칙에 따라 주소를 조합한다.
			//내려오는 변수 값이 없는 경우 공백(``)값을 가지므로, 이를 참고하여 분기한다.
			let addr = ``;  //기본주소변수
			let extraAddr = ``; //참고항목변수

			//사용자가 선택한 주소타입에 따라 해당 주소값을 가져온다.
			if (data.userSelectedType === `R`) {
				//사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else {
				//사용자가 지번주소를 선택했을 경우
				addr = data.jibunAddress;
			}
			//사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if (data.userSelectedType === `R`) {
				//법정동명이 있을 경우 추가한다.(법정리는 제외)
				//법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== `` && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				//건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== `` && data.apartment === `Y`) {
					extraAddr += (extraAddr !== `` ? `,` + data.buildingName : data.buildingName);
				}
				//표시할 참고항목이 있는 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraAddr !== ``) {
					extraAddr = `(` + extraAddr + `)`;
				}
				//조합된 참고항목을 해당 필드에 넣는다.
				document.getElementById("extraAddress").value = extraAddr;
			} else {
				document.getElementById("extraAddress").value = ``;
			}
			//우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById("postCode").value = data.zonecode;
			document.getElementById("defaultAddress").value = addr;
			//커서를 상세주소필드로 이동한다.
			document.getElementById("detailedAddress").focus();
		}
	}).open();
}

//결제시 모든 내용 점검하여 이상없는지 확인한다.
function inputCheck() {
	if (document.paymentForm.userName.value === "") {
		alert("이름을 입력해주세요.");
		document.paymentForm.userName.focus();
		return;
	}
	if (document.regForm.userPhoneNum.value === "") {
		alert("휴대폰번호를 입력해주세요.");
		document.paymentForm.userPhoneNum.focus();
		return;
	}
	if (document.regForm.postCode.value === "") {
		alert("우편번호를 입력해주세요.");
		document.paymentForm.postCode.focus();
		return;
	}
	if (document.regForm.detailedAddress.value === "") {
		alert("상세주소를 입력해주세요.");
		document.paymentForm.detailedAddress.focus();
		return;
	}
	document.paymentForm.submit();
}

function getUserInfo(userName,userPhoneNum,postCode,defaultAddress,detailedAddress,extraAddress){
	document.paymentForm.userName.value=userName;
	document.paymentForm.userPhoneNum.value=userPhoneNum;
	document.paymentForm.postCode.value=postCode;
	document.paymentForm.defaultAddress.value=defaultAddress;
	document.paymentForm.detailedAddress.value=detailedAddress;
	document.paymentForm.extraAddress.value=extraAddress;
}