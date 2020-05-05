<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>쿠킹 클래스</title>
  <link href="https://fonts.googleapis.com/css?family=Gothic+A1&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />
  <link rel="stylesheet" href="<c:url value="/resources/css/contact.css"/>" />
  <script src="<c:url value="/resources/js/contact.js"/>"></script> 



</head>

<body>				<!-- <c:url value='/member/join'/> -->
  <form id="conFrm" action="" method="post">
    <header>
      <div class="banner"><a href="<c:url value="/"/>"><img src="<c:url value="/resources/img/cookingClassBanner2.jpg"/>" alt=""></a></div>
  	</header>
    <div class="container">
      <div class="content">

        <div class="classInfo">
          <div class="infoBox">
            <div class="infoTitle"><pre>신청 클래스</pre></div>
            <div class="information"><pre>화이트데이 클래스</pre></div>
          </div>
           <div class="infoBox">
            <span class="infoTitle"><pre>참가    인원</pre></span>
            <span class="information"><pre>2인 (1인 신청 가능)</pre></span>
          </div> 
           <div class="infoBox">
            <span class="infoTitle"><pre>참가    비용</pre></span>
            <span class="information"><pre>₩ 150,000</pre></span>
          </div> 
           <div class="infoBox">
            <span class="infoTitle"><pre>메             뉴</pre></span>
            <span class="information"><pre>스테이크 & 구운야채</pre></span>

          </div> 
        </div>  
          
        <div class="formSet">
          <div class="formBox">
            <span class="label"><label for="name"><pre>신  청  자</pre></label></span>
            <span class="input_form"><input type="text" name="name" id="name" placeholder="신청자 성명을 입력해주세요"></span>
          </div>
          <div class="err_form"><span class="errmsg" id="name_errmsg"></span></div>

          <div class="formBox">
            <span class="label"><label for="tel"><pre>전화번호</pre></label></span>
            <span class="input_form"><input type="tel" name="tel" id="tel" placeholder="ex) 010-1234-5678"></span>
          </div>
          <div class="err_form"><span class="errmsg" id="tel_errmsg"></span></div>

          <div class="formBox">
            <span class="label"><label for="people"><pre>인      원</pre></label></span>
            <span>
              <input type="radio" name="people" id="one" value="1인"><label for="one">1인</label>
              <input type="radio" name="people" id="two" value="2인"><label for="two">2인</label>
            </span>
          </div>
          <div class="err_form"><span class="errmsg" id="people_errmsg"></span></div>
          
          <div class="formBox">
          	<div><pre>참가비용이 입금되어야 예약이 최종확정됩니다.</pre></div>   
          </div>
           <div class="checkBox">
              <input type="radio" name="conCheck" id="conCheck" value="check"><label for="two">확인</label>
            </div>
          <div class="err_form"><span class="errmsg" id="conCheck_errmsg"></span></div>
        </div>
        <div id="button"><button type="submit" id="conBtn">예약 신청</button></div>
      </div>
    </div>
  </form>
</body>

</html>