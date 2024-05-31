/**
 * 
 */
//메인 메뉴에 마우스 올려놓을 때 메뉴 펼치기
//메인 메뉴에 마우스 다른 곳에 둘 때 메뉴 접기
function displayMenu(state) {
  const mainMenuContent = document.querySelector("#mainMenuContent");
  switch(state){
    case "mouseover": 
      mainMenuContent.style.display = `flex`;
      break;
      case "mouseout": 
      mainMenuContent.style.display = `none`;
        break;
    default: break;
  }
}