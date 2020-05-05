<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>로 그 인</title>
  <link rel="stylesheet" href="<c:url value="/resources/css/admin.css"/>">
  <script src="<c:url value="/resources/js/admin.js"/>"></script>

    <!-- 글자 링크 -->
  <link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
  <!--한글+영어(굵고 동글동글한 체) : font-family: 'Jua', sans-serif; -->
  <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap&subset=korean" rel="stylesheet">
  <!-- 한글+영어(단정 꽉차있는체) : font-family: 'Do Hyeon', sans-serif; -->
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding:400,700&display=swap&subset=korean" rel="stylesheet">
  <!-- 한글+영어(단정) : font-family: 'Nanum Gothic Coding', monospace; -->
  
  
  
</head>

 
<body>
  <header class="header_container">
    <!-- ----------------------브라우저용 헤더---------------------- -->
    <nav class="header_wrapper">
      <div class="header_logo"><a href="<c:url value="/"/>"><img src="<c:url value="/resources/img/banner2.jpg"/>" alt=""></a></div>
      <ul class="menu_list">
        <li class="menu list1"><a href="#">BRAND</a>
          <ul class="submenu sublist1">
            <li><a href="#">소개글</a></li>
          </ul>
        </li>
        <li class="menu list2"><a href="#">MENU</a>
          <ul class="submenu sublist2">
            <li><a href="#">STEAK</a></li>
            <li><a href="#">PASTA</a></li>
            <li class="smallFont"><a href="#">SALAD&OTHERS</a></li>
            <li><a href="#">DRINK</a></li>
            <li><a href="#">DESSERT</a></li>
          </ul>
        </li>
        <li class="menu list2"><a href="#">COMMUNITY</a>
          <ul class="submenu sublist3">
            <li><a href="#">공지사항</a></li>
          </ul>
        </li>
        <li class="menu list4"><a href="#">EVENT</a>
        </li>
        <c:if test="${empty member }" >  
        <div class="menu_forms">		
          <li class="menu list6"><a href="<c:url value='/member/joinForm' />">회원가입</a></li>
          <li class="menu list5"><a href="<c:url value='/loginForm' />">로그인</a></li>
          <li class="menu list7"><a href="#">예약하기</a></li>
        </div>
        </c:if>
        <c:if test="${!empty member }" >
        <div class="menu_forms">
					<li class="menu list6"><a href="<c:url value='/member/modifyForm/${sessionScope.member.id }' />">${sessionScope.member.nickname }님 </a></li>
          <li class="menu list5"><a href="<c:url value='/logout' />">로그아웃</a></li>
          <li class="menu list6"><a href="<c:url value='/member/outForm' />">탈퇴</a></li>
          <li class="menu list7"><a href="#">예약하기</a></li>
        </div>
        </c:if>
      </ul>
    </nav>
      <!-- -------------------모바일 햄버거 헤더---------------------- -->
    <nav id="mobile">
      <ul>
        <li><a href="#">BRAND</a>
          <ul class="submenu2 hamList1">
            <li><a href="#">소개글</a></li>
          </ul>
        </li>
        <li><a href="#">MENU</a>
          <ul class="submenu2 hamList2">
            <li><a href="#">STEAK</a></li>
            <li><a href="#">PASTA</a></li>
            <li class="smallFont"><a href="#">SALAD&OTHERS</a></li>
            <li><a href="#">DRINK</a></li>
            <li><a href="#">DESSERT</a></li>
          </ul>
        </li>
        <li><a href="#">COMMUNITY</a>
          <ul class="submenu2 hamList3">
            <li><a href="#">공지사항</a></li>
          </ul>
        </li>
        <li><a href="#">EVENT</a> </li>
        <c:if test="${empty member }" >
        <div>
          <li><a href="<c:url value='/member/joinForm' />">회원가입</a></li>
          <li><a href="<c:url value='/loginForm' />">로그인</a></li>
          <li><a href="#">예약하기</a></li>
        </div>
        </c:if>
        <c:if test="${!empty member }" >
        <div>
          <li><a href="<c:url value='/member/memberJoin.jsp' />">${member.nickname }님 </a></li>
          <li><a href="<c:url value='/logout' />">로그아웃</a></li>
          <li><a href="<c:url value='/member/outForm' />">탈퇴</a></li>
          <li><a href="#">예약하기</a></li>
        </div>
        </c:if>

      </ul>
    </nav>
    <a href="#" class="tab">
      <span style="color: white;">
        <i class="fas fa-th-list fa-3x"></i>
        <!-- <i class="fas fa-cat fa-4x"></i> -->
        <!-- <i class="fas fa-bars fa-3x"></i> -->
      </span>
    </a>
  </header>
  <section>
      <div class="logo"><a href="<c:url value="/"/>"><img src="<c:url value="/resources/img/banner_ver2.jpg"/>" alt=""></a></div>
  </section>
  <section>
  	 <div id="button"><button type="submit" id="joinBtn">회원 목록</button></div>
  </section>

   <footer class="footer_container">
    <div class="footer_wrapper">					
      <div class="footer_logo"><a href="<c:url value="/"/>"><img src="<c:url value="/resources/img/banner2.jpg"/>" alt="로고"></a></div>
      <div class="footer_menu">
        <ul class="footer_menu1">
          <li><a href="#">소개글</a></li>
          <li><a href="#">이용약관</a></li>
          <li><a href="#">개인정보처리방침</a></li>
          <li><a href="#">사이트맵</a></li>
        </ul>
        <div class="footer_menu2">
          <p class="recipy_"><span>상호 : 레시피 &vert; 주소 : 울산광역시 중구 삼산동 15번길 KH 빌딩</span></p>
          <p class="address_"><span>대표 : 강나래 &vert; 사업자등록번호 : 254-47-14495 &vert;</span></p>
          <p class="master_"></p>
        </div>
      </div>
  </footer>

 
</body>

</html>