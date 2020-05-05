<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/findPW.css"/>">
<script src="<c:url value="/resources/js/common.js"/>"></script>
<%-- <script src="<c:url value="/resources/js/findPW.js"/>"></script> --%>
  
  <!-- 글자 링크 -->
  <link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
  <!--한글+영어(굵고 동글동글한 체) : font-family: 'Jua', sans-serif; -->
  <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap&subset=korean" rel="stylesheet">
  <!-- 한글+영어(단정 꽉차있는체) : font-family: 'Do Hyeon', sans-serif; -->
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding:400,700&display=swap&subset=korean" rel="stylesheet">
  <!-- 한글+영어(단정) : font-family: 'Nanum Gothic Coding', monospace; -->
  
 <script>
  window.addEventListener("load",init,false);
  function init(){
    findBtn.addEventListener("click",findBtnClick,false);
  }

  function findBtnClick(e){
    console.log('클릭됨');  
    var status = false;
    //1) 유효성 체크(아이디,전화번호,생일)
    status = valChk();
    if(!status) return;
    
    //2) 사용자인증 AJAX call
    authCkh();
  }

  //1) 유효성 체크(아이디,전화번호,생일)
  function valChk(){
  	 // 사용자 입력값 읽어오기
    var idEle 		= document.getElementById('id');
    var telEle 		= document.getElementById('tel');
    var birthEle 		= document.getElementById('birth');

    var flag = true; /* 유효성 체크 유무 */
    //1) 이메일 주소 체크
      if(!isEmail(idEle.value)) {
        id_errmsg.innerHTML = "이메일 정보가 잘못되었습니다.";
        flag = flag && false;
      }else{
        id_errmsg.innerHTML = "";
      }

    //2) 전화번호
      if(!isTel(telEle.value)) {
        tel_errmsg.innerHTML = "전화번호가 잘못되었습니다.ex)010-1234-5678";
        flag = flag && false;
      }else{
        tel_errmsg.innerHTML = "";
      }    

    //3) 생년월일 체크
      if(birthEle.value == "" ) {
        birth_errmsg.innerHTML = "생일을 입력해주세요!";
        flag = flag && false;
      }else{
        birth_errmsg.innerHTML = "";
      }
      return flag;  
  }

  //2) 사용자인증 AJAX call
  function authCkh(){

    //AJAX 사용
    //1) XMLHttpRequest객체 생성	
    var xhttp = new XMLHttpRequest();
    
    //2) 서버응답처리
    xhttp.addEventListener("readystatechange",ajaxCall,false);
    function ajaxCall(){
  	  if (this.readyState == 4 && this.status == 200) {
  		  console.log(this.responseText);
  		  //json포맷 문자열  => 자바스크립트 obj
  		  var jsonObj = JSON.parse(this.responseText)
  		  if(jsonObj.success){
  		  	updateUI(true);
  		  	console.log('회원인증 성공!!'+jsonObj.success);
  		  }else{
  		  	console.log('회원인증 실패!!'+jsonObj.success);
  		  	updateUI(false);
  		  }
  	  }
    }
   	  
    //3) 서비스 요청
    var sendData = {};
    sendData.id  = document.getElementById("id").value;
    sendData.tel   = document.getElementById("tel").value;
    sendData.birth = document.getElementById("birth").value;
    //자바스크립트 obj => json포맷 문자열 변환
    var result = JSON.stringify(sendData);
    console.log(result);
    
    //post방식
    xhttp.open("POST","http://localhost:9080/portfolio/member/findPW",true);
    xhttp.setRequestHeader("Content-Type","application/json; charset=utf-8"); 
  /*  xhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");  <- 얘는 폼 태그 안에 */
    xhttp.send(result);
  /*  xhttp.send("result="+result);*/
  }

  //3) UI업데이트(비밀번호변경되게!!)
  function updateUI(flag){
  	console.log('ui호출됨!');
  	if(flag){
  		//1) 비밀번호 변경필드 활성화
  	  var hideTags = document.querySelectorAll(".hide");
  	  for(let hideTag of hideTags){
  	    if(hideTag.classList.contains("hide")){
  	      hideTag.classList.remove("hide");
  	      console.log(hideTag);
  	    }
  	  }
  	  
  	  //2) 아이디, 전화번호, 생년월일 읽기모드로
  	  id.setAttribute("readOnly","readOnly");
  	  tel.setAttribute("readOnly","readOnly");
  	  birth.setAttribute("readOnly","readOnly");
  	  
  	  //3) 비밀번호 찾기 이벤트 제거
  	  findBtn.removeEventListener("click",findBtnClick);
  	  
  	  //4) 비밀번호 변경 이벤트추가
  	  findBtn.addEventListener("click", changeBtnClick); 
  	  findBtn.textContent = "비밀번호변경";	
  	  
  	}else{
  		birth_errmsg.textContent="가입된 회원정보가 없습니다!";
  	}
  	
  //비밀번호 클릭시
  	function changeBtnClick() {
  	  console.log('클릭됨');  
  	  var status = false;
  	  //1) 유효성 체크(비밀번호)
  	  status = pwChk();
  	  if(!status) return;
  	  
  	  //2) 사용자인증 AJAX call
  	  chagePW();	
  	}

  	//4) 유효성체크(비밀번호)
  	function pwChk() {
  	  // 사용자 입력값 읽어오기
  	  var pwEle 		= document.getElementById('pw');
  	  var pwChkEle 		= document.getElementById('pwChk');
  	  var flag = true; /* 유효성 체크 유무 */
  	  
  	  //1) 비밀번호 체크
  	  if(!isPassword(pwEle.value)) {
  	    pw_errmsg.innerHTML = "비밀번호가 잘못되었습니다.(8~10)자리";
  	    flag = flag && false;    
  	  }else{
  	    pw_errmsg.innerHTML = "";
  	  }
  	  //2) 비밀번호 재확인
  	  //2-1)비밀번호 패턴 체크
  	  if(!isPassword(pwChkEle.value)) {
  	    pwChk_errmsg.innerHTML = "비밀번호가 잘못되었습니다.(8~10)자리";
  	    flag = flag && false;
  	  }else{
  	    pwChk_errmsg.innerHTML = "";
  	  }
  	  //2-2)비밀번호 일치 체크
  	  if(pwEle.value != pwChkEle.value ) {
  	    pwChk_errmsg.innerHTML = "비밀번호가 일치하지 않습니다.";
  	    flag = flag && false;
  	  }else {
  	    pwChk_errmsg.innerHTML = "";
  	  }	
  	  return flag;  
  	}

  	//5) 비밀번호변경 AJAX call
  	function chagePW() {
  	  //AJAX 사용
  	  //1) XMLHttpRequest객체 생성	
  	  var xhttp = new XMLHttpRequest();
  	  
  	  //2) 서버응답처리
  	  xhttp.addEventListener("readystatechange",ajaxCall,false);
  	  function ajaxCall(){
  		  if (this.readyState == 4 && this.status == 200) {
  			  console.log(this.responseText);
  			  //json포맷 문자열  => 자바스크립트 obj
  			  var jsonObj = JSON.parse(this.responseText)
  			  if(jsonObj.success){
  			  	console.log('비밀번호 변경 성공!!');
  			  	alert('비밀번호가 성공적으로 변경되었습니다!!'+"\r\n로그인 페이지로 이동합니다.!!");
  /*			  	document.location.href = "/portfolio/member/loginForm";*/
  			  	document.location.href = getContextPath()+"/loginForm";
  			  }else{
  			  	console.log('비밀번호 변경 실패!!');
  			  	pwChk_errmsg.innerHTML = "비밀번호변경 실패하였습니다.관리자에게 문의바랍니다.";
  			  }
  		  }
  	  }
  	 	  
  	  //3) 서비스 요청
  	  var sendData = {};
  	  sendData.id   = document.getElementById("id").value;
  	  sendData.pw   = document.getElementById("pw").value;

  	  //자바스크립트 obj => json포맷 문자열 변환
  	  var result = JSON.stringify(sendData);
  	  console.log(result);
  	  
  	  //post방식
  	  xhttp.open("POST","http://localhost:9080/portfolio/member/changePW",true);
  	  xhttp.setRequestHeader("Content-Type","application/json; charset=utf-8"); 
  	  xhttp.send(result);	
  	}	
  }

  //이메일 체크 정규식
  function isEmail(asValue) {
    var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    return regExp.test(asValue); // 형식에 맞는 경우 true 리턴	
  }

  // 핸드폰 번호 체크 정규식
  function isTel(asValue) {
    var regExp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
    return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
  }

  //비밀번호 체크 정규식
  function isPassword(asValue) {
    var regExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,10}$/; //  8 ~ 10자 영문, 숫자 조합
    return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
  }  
</script>

</head>
<body>
	<%@ include file="../include/header.jsp" %>
	
  <section id="formSection">
		<div id="findPWcontainer">
			<div class="contentWrapper">
				<div class="title">
					<h2>비밀번호 찾기</h2>
				</div>
				<table class="content">
					<colgroup>
						<col width="20%" />
						<col width="80%" />
					</colgroup>
					<tbody>
						<tr>
							<td class="col-1"><label for="id">아 이 디</label></td>
							<td class="col-2 input_form"><input type="text" name="id" id="id" placeholder="아이디"></td>
						</tr>
						<tr>
							<td colspan="2" id="id_errmsg" class="errmsg"></td>
						</tr>
						<tr>
							<td class="col-1"><label for="tel">전화번호</label></td>
							<td class="col-2 input_form"><input type="tel" name="tel" id="tel" placeholder="전화번호"></td>
						</tr>
						<tr>
							<td colspan="2" id="tel_errmsg" class="errmsg"></td>
						</tr>
						<tr>
							<td class="col-1"><label for="birth">생년월일</label></td>
							<td class="col-2 input_form"><input type="date" name="birth" id="birth"></td>
						</tr>
						<tr>
							<td colspan="2" id="birth_errmsg" class="errmsg"></td>
						</tr>
						<!-- -----------------------------------------추가되는 부분 스타트 --------------------------->
						<tr class="hide">
							<td class="col-1"><label for="pw">새로운 비밀번호</label></td>
							<td class="col-2 input_form"><input type="password" id="pw" name="pw"
								placeholder="새로운 비밀번호"></td>
						</tr>
		
						<tr class="hide">
							<td colspan="2" id="pw_errmsg" class="errmsg"></td>
						</tr>
		
						<tr class="hide">
							<td class="col-1"><label for="pwChk">비밀번호 재확인</label></td>
							<td class="col-2 input_form"><input type="password" id="pwChk" name="pwChk"
								placeholder="비밀번호 재확인"></td>
						</tr>
		
						<tr class="hide">
							<td colspan="2" id="pwChk_errmsg" class="errmsg"></td>
						</tr>
		
						<!-- -----------------------------------------추가되는 부분 엔드 --------------------------->
						<tr>
							<td colspan="2" class="buttonForm"><button name="findBtn" id="findBtn">비밀번호
									찾기</button></td colspan="2">
						</tr>
					</tbody>
				</table>
			</div>	
		</div>
	</section>	
	
	<%@ include file="../include/footer.jsp" %>
	
</body>

</html>