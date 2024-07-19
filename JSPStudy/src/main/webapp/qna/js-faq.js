document.addEventListener('DOMContentLoaded', function() {
	// 0. 버튼
	let erase = document.getElementById('erase');
	// 1. 지우기
	erase.addEventListener('click', () => {
		let searchInput = document.getElementById('searchInput');
		searchInput.value = '';
	})
});

// < 검색 >
function searchFunc() {
	let searchInput = document.getElementById('searchInput').value.toLowerCase();
	let list = document.querySelectorAll('[class*="cat"]');
	list.forEach(e => {
		let title = e.id.toLowerCase();
		if (title.includes(searchInput)) {
			e.style.display = 'block';
		} else {
			e.style.display = 'none';
		}
	})
}

function enterFunc() {	// 엔터키
	if (window.event.keyCode == 13) {
		searchFunc();
	};
}

// 제목 클릭시 답변 출력
function showContent(no) {
	let content = document.getElementById(no);
	if (!content.style.display || content.style.display == 'none') {
		content.style.display = 'block';
	} else {
		content.style.display = 'none';
	}
	console.log(`no= ${no}`)
}

// 해당 카테고리에 따른 게시글 출력
function sortFaq(e) {
	let faq_category = e.name;
	const cat1000 = document.querySelectorAll(".cat1000")
	const cat2000 = document.querySelectorAll(".cat2000")
	const cat3000 = document.querySelectorAll(".cat3000")
	if (faq_category === "1000") {
		console.log("cat : 1000")
		cat1000.forEach((e) => {
			e.style.display = 'block';
		})
		cat2000.forEach((e) => {
			e.style.display = 'none';
		})
		cat3000.forEach((e) => {
			e.style.display = 'none';
		})
	} else if (faq_category === "2000") {
		console.log("cat : 2000")
		cat1000.forEach((e) => {
			e.style.display = 'none';
		})
		cat2000.forEach((e) => {
			e.style.display = 'block';
		})
		cat3000.forEach((e) => {
			e.style.display = 'none';
		})
	} else if (faq_category === "3000") {
		console.log("cat : 3000")
		cat1000.forEach((e) => {
			e.style.display = 'none';
		})
		cat2000.forEach((e) => {
			e.style.display = 'none';
		})
		cat3000.forEach((e) => {
			e.style.display = 'block';
		})
	}
}