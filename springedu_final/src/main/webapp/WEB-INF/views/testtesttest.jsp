<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>회 원 가 입</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />
  <link rel="stylesheet" href="<c:url value='/resources/css/memberJoin.css' />">
  <script src="<c:url value='/resources/js/memberJoin.js' />"></script>
  
  <script>
  window.addEventListener("load",init,false);
  function init(){
    joinBtn.addEventListener("click",function(e){
      e.preventDefault();
      console.log('clicked!!');
//      document.getElementById("joinFrm").submit()
      
      if(checkValid()){
        // 유효성 통과하면 메인화면으로 이동
        //location.href="main.html";
        document.getElementById("joinFrm").submit();	
      }
    },false);
  }

  function checkValid(){
    // 사용자 입력값 읽어오기
    var idEle 		= document.getElementById('id');
    var pwEle 		= document.getElementById('pw');
    var pwChkEle 		= document.getElementById('pwChk');
    var telEle 		= document.getElementById('tel');
    var nicknameEle 	= document.getElementById('nickname');
    var regionEle 	= document.getElementById('region');
    var genderEle 	= document.getElementsByName('gender');
    var birthEle 		= document.getElementById('birth');

    var flag = true; /* 회원가입 유효성 체크 유무 */

    // console.log(idEle.value,
    //             pwEle.value,
    //             pwChkEle.value,
    //             telEle.value,
    //             regionEle.options[regionEle.selectedIndex].text,
    //             // genderEle.value
    //             );
    //1) 이메일 주소 체크
      if(!isEmail(idEle.value)) {
        id_errmsg.innerHTML = "이메일 정보가 잘못되었습니다.";
        flag = flag && false;
      }else{
        id_errmsg.innerHTML = "";
      }
    //2) 비밀번호 체크
      if(!isPassword(pwEle.value)) {
        pw_errmsg.innerHTML = "비밀번호가 잘못되었습니다.(8~10)자리";
        flag = flag && false;    
      }else{
        pw_errmsg.innerHTML = "";
      }
    //3) 비밀번호 재확인
      //3-1)비밀번호 패턴 체크
      if(!isPassword(pwChkEle.value)) {
        pwChk_errmsg.innerHTML = "비밀번호가 잘못되었습니다.(8~10)자리";
        flag = flag && false;
      }else{
        pwChk_errmsg.innerHTML = "";
      }
      //3-2)비밀번호 일치 체크
      if(pwEle.value != pwChkEle.value ) {
        pwChk_errmsg.innerHTML = "비밀번호가 일치하지 않습니다.";
        flag = flag && false;
      }else {
        pwChk_errmsg.innerHTML = "";
      }
    //4) 전화번호
      if(!isTel(telEle.value)) {
        tel_errmsg.innerHTML = "전화번호가 잘못되었습니다.ex)010-1234-5678";
        flag = flag && false;
      }else{
        tel_errmsg.innerHTML = "";
      }    
    //5) 별칭
      if(nicknameEle.value == "" ) {
      	nickname_errmsg.innerHTML = "별칭을 입력해주세요!";
          flag = flag && false;
        }else{
      	nickname_errmsg.innerHTML = "";
        }   
    //6) 지역
      if(regionEle.selectedIndex == 0){
        region_errmsg.innerHTML = "지역을 선택해주세요!";
        flag = flag && false;
      }else{
        region_errmsg.innerHTML = "";
      }
    //7) 성별
      var status = false;
      for(var gender of genderEle) {
        if(gender.checked) {
          status = true;
          break;
        }
      }
      if(!status) {
        gender_errmsg.innerHTML = "성별을 선택해주세요!";
        flag = flag && false;
      }else{
        gender_errmsg.innerHTML = "";
      }
      //8) 생년월일 체크
      if(birthEle.value == "" ) {
        birth_errmsg.innerHTML = "생일을 입력해주세요!";
        flag = flag && false;
      }else{
        birth_errmsg.innerHTML = "";
      }
      return flag;
  }
  // 이메일 체크 정규식
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
  <form:form id="joinFrm" action="${pageContext.request.contextPath }/member/join" 
             modelAttribute="mvo" method="post">
    <div class="container">
      <div class="content">
        <div><h2 class="join-title">회 원 가 입</h2></div>
        
        <div><form:label path="id">아이디</form:label></div>
        <div><form:input type="text" path="id" readOnly="true" /><i class="far fa-envelope fa-lg"></i></div>
        <div>
        	<span class="errmsg" id="id_errmsg"></span>
        	<form:errors path="id" cssClass="errmsg"></form:errors>
        </div>
        <div><form:label path="pw">비밀번호</form:label></div>
        <div><form:input type="password" path="pw" /><i class="fas fa-lock fa-lg"></i></div>
        <div>
        	<span class="errmsg" id="pw_errmsg"></span>                
        	<form:errors path="pw" cssClass="errmsg"></form:errors>
        </div>
        <div><label for="pwChk">비밀번호 재확인</label></div>
        <div><input type="password" id="pwChk"><i class="fas fa-lock fa-lg"></i></div>
        <div><span class="errmsg" id="pwChk_errmsg"></span></div>              
        <div><form:label path="tel">전화번호</form:label></div>
        <div><form:input type="tel" path="tel" /><i class="fas fa-mobile-alt fa-lg"></i></div>
        <div>
        	<span class="errmsg" id="tel_errmsg"></span>
					<form:errors path="tel" cssClass="errmsg"></form:errors>
				</div>                   
        <div><form:label path="nickname">별칭</form:label></div>
        <div><form:input type="text" path="nickname" /><i class="fas fa-mobile-alt fa-lg"></i></div>
        <div>
        	<span class="errmsg" id="nickname_errmsg"></span>
					<form:errors path="nickname" cssClass="errmsg"></form:errors>
				</div>                 
        <div><form:label path="region">지역</form:label></div>
        <div>
          <form:select path="region">
            <option value="0">== 선 택 ==</option>
            <form:options path="region" items="${region }" itemValue="code" itemLabel="label" />
          </form:select>
        </div>
				<div>
					<span class="errmsg" id="region_errmsg"></span>                  
					<form:errors path="region" cssClass="errmsg"></form:errors>
				</div>
        <div><form:label path="gender">성별</form:label></div>
        <div>
          <form:radiobuttons path="gender" items="${gender }" itemValue="code" itemLabel="label"/>
        </div>
				<div>
					<span class="errmsg" id="gender_errmsg"></span>                     
					<form:errors path="gender" cssClass="errmsg"></form:errors>
				</div>
				<!-- ===========================================================생년월일 -->
        <div><form:label path="birth">생년월일</form:label></div>
        <div><form:input type="date" path="birth" /><i class="fas fa-mobile-alt fa-lg"></i></div>
				<div>
					<span class="errmsg" id="birth_errmsg"></span>           
					<form:errors path="birth" cssClass="errmsg"></form:errors>
				</div>
				<!-- ===========================================================생년월일 -->
				
				<div style="color:#f00; font-weight:bold;font-size:0.8.rem">${svr_msg }</div>                    
        <div><button type="submit" id="joinBtn">가 입 하 기</button></div>
      </div>
    </div>
  </form:form>
</body>
</html>