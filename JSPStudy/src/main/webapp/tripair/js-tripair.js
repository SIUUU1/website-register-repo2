function check(){
	if(document.selectForm.count){
		
	}
}

function changCount(){
	const seatType = document.getElementById('seatType');
	if(seatType.options[seatType.selectedIndex].value==='1'){
		document.paymentForm.prestige_count.value === "0";
	}else {
		document.paymentForm.economy_count.value === "0";
	}
}