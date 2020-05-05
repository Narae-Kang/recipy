window.addEventListener("load", init, false);
function init() {
  var idTag = document.getElementById("id");
  var pwTag = document.getElementById("pw");

  var loginBtn = window.document.getElementById("loginBtn");
  console.log(loginBtn);
  loginBtn.addEventListener("click", function (e) {
    e.preventDefault();
    var result = checkLogin();
    if(result) {
    	document.getElementById("loginForm").submit();
    }
  }, false);
}
function checkLogin() {
  var idTag = document.getElementById("id");
  var idValue = idTag.value;
  var pwTag = document.getElementById("pw");
  var pwValue = pwTag.value;
  var flag = true;

  const ID = 'admin@google.com';
  const PW = 'qwer1234';

  if (idValue.trim().length == 0) {
    idMsg.innerHTML = "아이디를 입력하세요";
    idMsg.classList.add("errmsg");
    idTag.focus();   /*--------------------------------------------------포커스는 커서가 다시 id 위로 가는것*/
    flag = false;
    return flag;
  }
  if (pwValue.trim().length == 0) {
    idMsg.innerHTML = "";
    pwMsg.innerHTML = "비밀번호를 입력하세요";
    pwMsg.classList.add("errmsg");
    pwTag.focus();
    flag = false;
    return flag;
  }
  return flag; 
}  






// 로그인 유효성 체크
// 1) 아이디, 비밀번호 빈문자열 체크
// var idMsg = document.getElementById("id");
// var pwMsg = document.getElementById("pw");
//  console.log(idValue.trim(), pwValue.trim());

  // 2) 회원 존재유무 체크
//  if (idValue.trim() == ID && pwValue.trim() == PW) {
    // 메인페이지로 이동
//    
//    window.location.href = "mainl.html";
//  } else {
//    pwMsg.innerHTML = "아이디/비밀번호가 일치하지 않습니다.";
//    pwMsg.style.color = "red";
//    pwMsg.style.fontSize = "0.7rem";
//    pwTag.focus();
//    return;
//  }
