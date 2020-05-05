window.addEventListener("load",init,false);
function init(){
	conBtn.addEventListener("click",function(e){
    e.preventDefault();
    
  if (checkValid()) {
/*	document.getElementById("conFrm").submit(); */
	alert('예약신청이 접수되었습니다!');
  	}  
  },false);

}

function checkValid(){
  // alert('호출됨');
  // 사용자 입력값 읽어오기
  var nameEle = document.getElementById('name');
  var telEle = document.getElementById('tel');
  var peopleEle = document.getElementsByName('people');
  var conCheckEle = document.getElementsByName('conCheck');

  var flag = true; /* 회원가입 유효성 체크 유무 */

  //1) 이름
  if(!isName(nameEle.value)) {
  	name_errmsg.innerHTML = "신청자명이 올바르지 않습니다.";
    flag = flag && false;
  }else{
  	name_errmsg.innerHTML = "";
  }
  //2) 전화번호
    if(!isTel(telEle.value)) {
      tel_errmsg.innerHTML = "전화번호 형식이 올바르지 않습니다.";
      flag = flag && false;
    }else{
      tel_errmsg.innerHTML = "";
    }    
    
    //3) 인원
    var status = false;
    for(var people of peopleEle) {
      if(people.checked) {
        status = true;
        break;
      }
    }
    if(!status) {
    	people_errmsg.innerHTML = "필수 선택사항 입니다.";
      flag = flag && false;
    }else{
    	people_errmsg.innerHTML = "";
    }
    //4) 사전예약 경고 메시지 확인
    var status = false;
    for(var conCheck of conCheckEle) {
      if(conCheck.checked) {
        status = true;
        break;
      }
    }
    if(!status) {
    	conCheck_errmsg.innerHTML = "필수 선택사항 입니다.";
      flag = flag && false;
    }else{
    	conCheck_errmsg.innerHTML = "";
    }

    return flag;

}

// 이름 체크 정규식
function	isName(asValue) {
	var regExp = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
	return regExp.test(asValue);
}
//핸드폰 번호 체크 정규식
function isTel(asValue) {
  var regExp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
  return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
}

