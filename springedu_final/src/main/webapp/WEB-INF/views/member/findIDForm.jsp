<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>아이디 찾기</title>
  <link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
  <link rel="stylesheet" href="<c:url value='/resources/css/findID.css' />">
  <script src="<c:url value="/resources/js/common.js"/>"></script>
<%--   <script src="<c:url value='/resources/js/findID.js' />"></script> --%>
    
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
    var findIDBtn = window.document.getElementById("findIDBtn");

    findIDBtn.addEventListener("click",function(e){    
      var result = checkFindID();
//      console.log("result="+result);
      if(result){
       //AJAX 사용
       //1) XMLHttpRequest객체 생성
       var xhttp = new XMLHttpRequest();
       
       //2) 서버응답처리
  	// 	XMLHttpRequest.readyState 값에대한 정의 Holds the status of the XMLHttpRequest.
  	// 	0: 초기화되지않은 상태(open()가 호출되지않은상태) request not initialized
  	// 	1: open()가 실행된 상태 server connection established
  	// 	2: 서버가 클라이언트의 요청을 받았음. send()가 실행된 상태 request received
  	// 	3: 서버가 클라이언트의 요청 처리중. 응답헤더는 수신했으나 바디가 수신중인상태 processing request
  	// 	4: 서버가 클라이언트의 요청을 완료했고 서버도 응답이 완료된 상태 request finished and response is ready
       xhttp.addEventListener("readystatechange",ajaxCall,false);
       function ajaxCall(){
  		   if (this.readyState == 4 && this.status == 200) {
  			  console.log(this.responseText);
  	
  			//json포맷 문자열  => 자바스크립트 obj
  			  var jsonObj = JSON.parse(this.responseText)
  			  //console.log(jsonObj.id);
  			  if(jsonObj.success){
  			  	console.log(jsonObj.id);
  					document.getElementById("id").value = jsonObj.id;
  					document.getElementById("birthMsg").innerHTML = "";
  			  }else{
  					document.getElementById("id").value = "";
  					document.getElementById("birthMsg").innerHTML = jsonObj.msg;
  			  }
  		   }// end if(this.readyState == 4 && this.status == 200)
       }// end of function ajaxCall()
       
  		 //3) 서비스 요청
       var sendData = {};
       sendData.tel   = document.getElementById("tel").value;
       sendData.birth = document.getElementById("birth").value;
       //자바스크립트 obj => json포맷 문자열 변환
       var result = JSON.stringify(sendData);
       console.log(result);
       
       //post방식
       xhttp.open("POST","http://localhost:9080/portfolio/member/id",true);
       xhttp.setRequestHeader("Content-Type","application/json;charset=utf-8"); 
       xhttp.send(result);
       //get방식
//       xhttp.open("GET","http://localhost:9080/portfolio/member/id/"+sendData.tel+"/"+sendData.birth,true);   
//       xhttp.send();
      }
    },false);
  }
  //전화번호, 생년월이 유효성 체크
  function checkFindID(){
    //사용자가 입력한 전화번호 읽어오기	
    var telTag = document.getElementById("tel");
    var telValue = telTag.value;
    //사용자가 입력한 생년월일 읽어오기
    var birthTag = document.getElementById("birth");
    var birthValue = birthTag.value;
    
    var flag = true; //유효성 성공유뮤 플래그
    
    //1) 전화번호 체크
    if(telValue.trim().length == 0){
      telMsg.innerHTML="전화번호를 입력하세요.";
      telMsg.classList.add("errmsg");     
      telTag.focus();
      flag = false;
      return flag;
    }
    //2) 생년월일체크
    if(birthValue.trim().length == 0){
      telMsg.innerHTML="";
      birthMsg.innerHTML="생년월일를 입력하세요.";
      birthMsg.classList.add("errmsg");  
      birthTag.focus();
      flag = false;
      return flag;
    }
    telMsg.innerHTML="";
    birthMsg.innerHTML="";
    return flag;
  }
  </script>
  
</head>

<body>
	
	<%@ include file="../include/header.jsp" %>

  <section id="formSection">
	  <div class="container">
	    <div class="find_wrapper">
	      <form id="frm" action="<c:url value='/member/find'/>" method="post">
	        <div>
	          <h2 class="find_title">아이디 찾기</h2>
	        </div>
	        <div class="find_content">
	          <div class="box content1">
	            <div class="findIDForm">
	            	<div class="findIDForm1"><label for="tel">전화번호</label></div>
	            	<div class="findIDForm2"><input class="inputs" type="text" name="tel" id="tel" value="" placeholder="전화번호"></div>
	            </div>
	            <div><span id="telMsg" class ="errmsg"></span></div>
	            
	            <div class="findIDForm">
	            	<div class="findIDForm1"><label for="birth">생년월일</label></div>
	            	<div class="findIDForm2"><input class="inputs" type="date" name="birth" id="birth" placeholder="생년월일"></div>
	            </div>
	            <div><span id="birthMsg" class ="errmsg"></span></div> 
	            
	            <div class="findIDForm">
	            	<div class="findIDForm1"><label for="id">찾은아이디</label></div>
	            	<div class="findIDForm2"><input type="id" name="id" id="id" readOnly="readonly" placeholder="찾은아이디"></div>
	            </div>
	          </div>
	        </div>  
          <div class="box content2">
            <input type="button" name="findIDBtn" id="findIDBtn" value="아이디 찾기"></a>
          </div>

	      </form>
	      <div class="find_info">
	        <a href="<c:url value='/member/findPWForm' />">비밀번호 찾기</a>
	      </div>
	
	    </div>
	  </div>
	  </section>

	<%@ include file="../include/footer.jsp" %>
		
</body>

</html>