<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>학사공지</title>
  <script src="https://kit.fontawesome.com/8d66cd774b.js" crossorigin="anonymous"></script>
</head>
<body>
  <script>
    // create h1, h3, select
    document.write(`
    <h1>학사공지</h1>
    <h3>KH정보교육원의 학사관련 공지입니다.</h3>
      <div>
      <select name="category" id="category">
        <option value="전체">전체</option>
        <option value="프로젝트">프로젝트</option>
        <option value="기타">기타</option>
        <option value="개강OT">개강OT</option>
        <option value="취업특강">취업특강</option>
      </select>
      </div>`
    );
    // body onload할 때 게시판에 스크롤을 위치시킨다.
    document.body.addEventListener("load",()=>{
      window.scrollBy(0,100);
    });
    // body style
    document.body.style.margin = `0`;
    document.body.style.padding = `0`;
    document.body.style.width = `100%`;
    document.body.style.height = `850px`;
    // h1 style
    let h1 = document.querySelector("h1");
    h1.style.textAlign = `center`;
    h1.style.margin = `90px 0 0 0`;
    h1.style.padding = `0`;
    // h3 style
    let h3 = document.querySelector("h3");
    h3.style.textAlign = `center`;
    h3.style.margin = `10px 0 30px 0`;
    h3.style.padding = `0`;
    h3.style.fontSize = `17px`;
    // select style
    let select = document.querySelector("select");
    select.style.width = `100px`;
    select.style.height = `30px`;
    select.style.fontSize = `15px`;
    select.style.textAlign = `center`;
    
    let selectDiv = document.querySelector("div");
    selectDiv.style.width = `80%`;
    selectDiv.style.margin = `0 auto`;
    selectDiv.style.textAlign = `right`;
    
    // create table1
    createTable(1);
    let table1 = document.querySelector("#table1");
    table1.style.display = `table`;
    // create table2
    createTable(2);
    // create table3
    createTable(3);
    // create table4
    createTable(4);
    // create table5
    createTable(5);
    // create table6
    createTable(6);
    // create table7
    createTable(7);
    // create table8
    createTable(8);
    // create table9
    createTable(9);
    // create table10
    createTable(10);
    // create page-button
    let newFooter = document.createElement("footer");
    newFooter.innerHTML = `<button type="button"><i class="fa-solid fa-chevron-left"></i></button>`;
    for(let i=0;i<10;i++){
      newFooter.innerHTML += `<button type="button">${i+1}</button>`;
    }
    newFooter.innerHTML += `<button type="button"><i class="fa-solid fa-chevron-right"></i></button>`;
    // footer style
    newFooter.style.margin = `0 auto`;
    newFooter.style.width = `80%`;
    newFooter.style.textAlign = `center`;
    newFooter.setAttribute("id","footer");
    document.body.appendChild(newFooter);
    // page-button style
    let buttonArr = document.querySelectorAll("button");
    for(let i=0;i<buttonArr.length;i++){
      buttonArr[i].style.margin = `0 8px`;
      buttonArr[i].style.backgroundColor = `white`;
      buttonArr[i].style.borderStyle = `none`;
      buttonArr[i].style.border = `1px solid rgb(218, 217, 217)`;
      buttonArr[i].style.width = `35px`;
      buttonArr[i].style.height = `35px`;
      buttonArr[i].setAttribute("id",`button${i}`);
    }
    
    
    
    // 바뀐 select 값으로 필터한 카테고리의 항목 보여주기 
    select.addEventListener("change",()=>{
      // 선택한 category 값 가져오기
      let index = select.selectedIndex;
      let categoryOption = select.options[index].value;
      // 현재 테이블Id 가져오기
      let tableArr = document.querySelectorAll("table");
      let curTableId = "";
      for (let i = 0; i < tableArr.length; i++) {
        if (tableArr[i].style.display === "table") {
          curTableId = tableArr[i].getAttribute("id");
          break;
        }
      }
      // category option에 따른 항목들 보여주기 
      let curTdArr = document.querySelectorAll(`#${curTableId} td`);
      if (categoryOption === "전체") {
        curTdArr.forEach(e => { e.parentElement.style.display = ""; });
      } else {
        for (let i = 5; i < curTdArr.length; i += 4) {
          if (curTdArr[i].innerHTML !== categoryOption) {
            curTdArr[i].parentElement.style.display = "none";
          } else {
            curTdArr[i].parentElement.style.display = "";
          }
        }
      }
    });
    
    
    //항목의 컨텐츠 생성하기
    //section 생성 추가
    let newSection = document.createElement("section");
    newSection.style.width = `80%`;
    newSection.style.margin = `20px auto`;
    newSection.setAttribute("id","mainSection");
    newSection.style.display = `none`;
    document.body.insertBefore(newSection,footer);
    //title 생성 추가
    let newTitle = document.createElement("div");
    let mainSection = document.querySelector("#mainSection");
    newTitle.innerHTML = `(디지털컨버전스)공공데이터 융합 자바개발자 양성과정A30_프로젝트 발표 및 수료식`;
    newTitle.style.margin = `0 auto`;
    newTitle.style.borderTop = `2px solid black`;
    newTitle.style.borderBottom = `1px solid black`;
    newTitle.style.textAlign = `center`;
    newTitle.style.fontSize = `15px`;
    newTitle.style.padding = `20px 0`;
    mainSection.appendChild(newTitle);
    //imageDiv 생성 추가
    let newImgDiv = document.createElement("div");
    newImgDiv.style.backgroundImage = `url(../main/source/computer1.jpg)`;
    newImgDiv.style.backgroundPosition = `center`;
    newImgDiv.style.margin = `15px auto`;
    newImgDiv.style.width = `600px`;
    newImgDiv.style.height = `250px`;
    mainSection.appendChild(newImgDiv);
    //내용 생성 추가
    let newP = document.createElement("p");
    newP.innerHTML = `과정명 : (디지털컨버전스)공공데이터 융합 자바개발자 양성과정A30_프로젝트 발표<br>
                      강사 : 김태근 선생님<br>
                      날짜 : 2024.04.29<br>
                      시간 : 9:00 ~ 13:00<br>
                      강의실 : KH정보교육원 강남지원 1관 R강의실<br><br>
                      KH정보교육원 프로젝트 발표 안내입니다.<br><br>
                      프로젝트 발표회는 학생들이 공부했던 내용을 기반으로 기획하고 개발한 프로젝트를 시현하고 질의 응답을 통해 정보를 나누는 자리입니다.<br><br>
                      프로젝트 발표회에는 KH정보교육원에서 공부하고 있는 학생이면 누구나 참관할 있으니 많은 관심 바랍니다.
                      `;
    newP.style.margin = `10 auto`;
    newP.style.textAlign = `center`;
    newP.style.fontSize = `14px`;
    mainSection.appendChild(newP);
    // click button1 
    let button1 = document.querySelector("#button1");
    button1.addEventListener("click",()=>{
      buttonClick(1);
    });
    // click button2
    let button2 = document.querySelector("#button2");
    button2.addEventListener("click",()=>{
      buttonClick(2);
    });
    // click button3
    let button3 = document.querySelector("#button3");
    button3.addEventListener("click",()=>{
      buttonClick(3);
    });
    // click button4
    let button4 = document.querySelector("#button4");
    button4.addEventListener("click",()=>{
      buttonClick(4);
    });
    // click button5
    let button5 = document.querySelector("#button5");
    button5.addEventListener("click",()=>{
      buttonClick(5);
    });
    // click button6
    let button6 = document.querySelector("#button6");
    button6.addEventListener("click",()=>{
      buttonClick(6);
    });
    // click button7
    let button7 = document.querySelector("#button7");
    button7.addEventListener("click",()=>{
      buttonClick(7);
    });
    // click button8
    let button8 = document.querySelector("#button8");
    button8.addEventListener("click",()=>{
      buttonClick(8);
    });
    // click button9
    let button9 = document.querySelector("#button9");
    button9.addEventListener("click",()=>{
      buttonClick(9);
    });
    // click button10
    let button10 = document.querySelector("#button10");
    button10.addEventListener("click",()=>{
      buttonClick(10);
    });
    //항목 클릭시 해당 컨텐츠 보여주기
    let tr11 = document.querySelector("#tr11");
    tr11.addEventListener("click",()=>{
      //이전 컨텐츠 보이지 않게 하기
      noPrintPreContent();
      let mainSection = document.querySelector("#mainSection");
      mainSection.style.display = `block`;
    });
    //createTable func
    function createTable(num){
      let newTable = document.createElement("table");
      newTable.innerHTML = `<thead><tr><td>번호</td><td>분류</td><td>제목</td><td>날짜</td></tr></thead>`;
      for(let i=0;i<3;i++){
        newTable.innerHTML += `<tr><td>${2346-i+num*10}</td><td>프로젝트</td><td>(디지털컨버전스)공공데이터 융합 자바개발자 양성과정A${31-num}_프로젝트 발표</td><td>2024.0${num}.${15-i}</td></tr>`;
      }
      for(let i=0;i<2;i++){
        newTable.innerHTML += `<tr><td>${2343-i+num*10}</td><td>취업특강</td><td>(디지털컨버전스)공공데이터 융합 자바개발자 양성과정A${31 - num}_취업특강</td><td>2024.0${num}.${15-i}</td></tr>`;
      }
      for(let i=0;i<2;i++){
        newTable.innerHTML += `<tr><td>${2341-i+num*10}</td><td>개강OT</td><td>(정보시스템구축)정보시스템 구축운영기반 정보보안 전문가 양성과정A${24 - num}(1)_1회차_개강OT</td><td>2024.0${num}.${15-i}</td></tr>`;
      }
      for(let i=0;i<3;i++){
        newTable.innerHTML += `<tr><td>${2338-i+num*10}</td><td>기타</td><td>(디지털컨버전스)공공데이터 융합 자바개발자 양성과정A${24 - num}_실무자 특강</td><td>2024.0${num}.${15-i}</td></tr>`;
      }
      //table 스타일
      newTable.style.width = `80%`;
      newTable.style.margin = `50px auto`;
      newTable.style.textAlign = `center`;
      newTable.style.borderCollapse = `collapse`;
      newTable.style.fontSize = `13px`;
      newTable.setAttribute("id",`table${num}`);
      newTable.style.display = `none`;
      //table 추가
      document.body.appendChild(newTable);
      //thead 스타일
      let thead = document.querySelector(`#table${num} thead`);
      thead.style.backgroundColor = `rgb(192, 219, 248)`;
      //tr,td 스타일
      let trArr = document.querySelectorAll(`#table${num} tr`);
      for(let i=0;i<trArr.length;i++){
        trArr[i].style.border = `1px solid rgb(218, 217, 217)`;
        trArr[i].style.padding = `10px`;
        trArr[i].style.width = `100%`;
        trArr[i].setAttribute("id",`tr${num}${i}`);
      }
      //테이블 행에 mouseover할 때 배경색 변경
      for(let i = 1; i < trArr.length; i++){
        trArr[i].addEventListener("mouseover", () => {
          trArr[i].style.backgroundColor = "rgb(241, 240, 247)";
        });
        trArr[i].addEventListener("mouseout", () => {
          trArr[i].style.backgroundColor = "white";
        });
      }
      let tdArr = document.querySelectorAll(`#table${num} td`);
      for(let i=0;i<tdArr.length;i++){
        tdArr[i].style.border = `1px solid rgb(218, 217, 217)`;
        tdArr[i].style.padding = `10px`;
      }
      tdArr[0].style.width = `10%`;
      tdArr[1].style.width = `20%`;
      tdArr[2].style.width = `50%`;
      tdArr[3].style.width = `20%`;
      
      
      
    }//end of createTable() func
    // show content clicking page-button func
    function buttonClick(num){
      let table1 = document.querySelector("#table1");
      let table2 = document.querySelector("#table2");
      let table3 = document.querySelector("#table3");
      let table4 = document.querySelector("#table4");
      let table5 = document.querySelector("#table5");
      let table6 = document.querySelector("#table6");
      let table7 = document.querySelector("#table7");
      let table8 = document.querySelector("#table8");
      let table9 = document.querySelector("#table9");
      let table10 = document.querySelector("#table10");
      //이전 컨텐츠를 보이지 않게 한다.
      noPrintPreContent();
      // 클릭한 버튼에 따라 해당 테이블을 보여준다.
      switch(num){
        case 1: table1.style.display = "table"; break;
        case 2: table2.style.display = "table"; break;
        case 3: table3.style.display = "table"; break;
        case 4: table4.style.display = "table"; break;
        case 5: table5.style.display = "table"; break;
        case 6: table6.style.display = "table"; break;
        case 7: table7.style.display = "table"; break;
        case 8: table8.style.display = "table"; break;
        case 9: table9.style.display = "table"; break;
        case 10: table10.style.display = "table"; break;
        default: break;
      }
    }//end of buttonClick() func
    //이전 컨텐츠 보이지 않게 하는 func
    function noPrintPreContent(){
      let preTables = document.querySelectorAll(`table`);
      let mainSection = document.querySelector("#mainSection");
      let flag = false;
      // 이전 컨텐츠는 보이지 않게 한다.
      // table이 보이는 상황
      for(let i=0;i<preTables.length;i++){
        if(preTables[i].style.display === "table"){
          preTables[i].style.display = "none";
          flag = true;
          break;
        }
      }
      // mainSection이 보이는 상황
      if(!flag){
        mainSection.style.display = "none";
      }
    }//end of noPrintPreContent() func
  </script>
</body>
</html>