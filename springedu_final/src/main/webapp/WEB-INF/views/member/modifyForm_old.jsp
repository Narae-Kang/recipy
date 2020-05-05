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
  <title>회원 정보 수정</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />
  <link rel="stylesheet" href="<c:url value='/resources/css/memberModify.css'/>" />
   <script src="<c:url value='/resources/js/memberModify.js'/>"></script> 
  <link href="https://fonts.googleapis.com/css?family=Gothic+A1&display=swap&subset=korean" rel="stylesheet">
  
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
            <li><a href="${pageContext.request.contextPath }/bbs">문의사항</a></li>
          </ul>
        </li>
        <li class="menu list4"><a href="#">EVENT</a>
        </li>
        <c:if test="${empty member }" >  
        <div class="menu_forms">		
          <li class="menu list6"><a href="<c:url value='/member/joinForm' />">회원가입</a></li>
          <li class="menu list5"><a href="<c:url value='/loginForm' />">로그인</a></li>
        </div>
        </c:if>
        <c:if test="${!empty member }" >
        <div class="menu_forms">
					<li class="menu list6"><a href="<c:url value='/member/modifyForm/${sessionScope.member.id }' />">${sessionScope.member.nickname }님 </a></li>
          <li class="menu list5"><a href="<c:url value='/logout' />">로그아웃</a></li>
          <li class="menu list6"><a href="<c:url value='/member/outForm' />">탈퇴</a></li>
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
        </div>
        </c:if>
        <c:if test="${!empty member }" >
        <div>
          <li><a href="<c:url value='/member/memberJoin.jsp' />">${member.nickname }님 </a></li>
          <li><a href="<c:url value='/logout' />">로그아웃</a></li>
          <li><a href="<c:url value='/member/outForm' />">탈퇴</a></li>
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
  
  <form id="joinFrm" action="<c:url value='/member/modify'/>" method="get">
    <div class="container">
      <div class="content">
        <div><h2 class="join-title">회원 정보 수정</h2></div>

        <div class="formSet">
          <div class="formBox">
            <span class="label"><label for="id">아이디</label></span>
            <span class="input_form"><input type="text" name="id" id="id" value="${memberVO.id }" readonly="" placeholder="Email을 입력해주세요."></span>
          </div>
          <div class="err_form"><span class="errmsg" id="id_errmsg"></span></div>


          <div class="formBox">
            <span class="label"><label for="pw">비밀번호</label></span>
            <span class="input_form"><input type="password" name="pw" id="pw" placeholder="8~10자리의 영어/숫자"></span>
          </div>
          <div class="err_form"><span class="errmsg" id="pw_errmsg"></span></div>
          

          <div class="formBox">
            <span class="label"><label for="tel">전화번호</label></span>
            <span class="input_form"><input type="tel" name="tel" id="tel" value="${memberVO.tel }" placeholder="ex) 010-1234-5678"></span>
          </div>
          <div class="err_form"><span class="errmsg" id="tel_errmsg"></span></div>

					<!-- 닉네임 -->
          <div class="formBox">
            <span class="label"><label for="nickname">닉네임</label></span>
            <span class="input_form"><input type="text" name="nickname" id="nickname" value="${memberVO.nickname }" placeholder="2~6자리의 한글/영어"></span>
          </div>
          <div class="err_form"><span class="errmsg" id="nickname_errmsg"></span></div>

					<!-- 생년월일 추가하기 -->
          <div class="formBox">
            <span class="label"><label for="birth">생년월일</label></span>
            <span class="input_form"><input type="date" name="birth" id="birth" value="${memberVO.birth }" placeholder="yyyy-MM-dd"></span>
          </div>
          <div class="err_form"><span class="errmsg" id="birth_errmsg"></span></div>


          <div class="formBox">
            <span class="label"><label for="region">지역</label></span>
            <span class="input_form input_choice">
              <select name="region" id="region">
                <option value=""> 지역 선택  </option>
                <option value="서울" ${memberVO.region == "서울" ? 'selected="selected"' : '' }>서울</option>
                <option value="인천" ${memberVO.region == "인천" ? 'selected="selected"' : '' }>인천</option>
                <option value="대구" ${memberVO.region == "대구" ? 'selected="selected"' : '' }>대구</option>
                <option value="부산" ${memberVO.region == "부산" ? 'selected="selected"' : '' }>부산</option>
                <option value="울산" ${memberVO.region == "울산" ? 'selected="selected"' : '' }>울산</option>
                <option value="광주" ${memberVO.region == "광주" ? 'selected="selected"' : '' }>광주</option>
                <option value="대전" ${memberVO.region == "대전" ? 'selected="selected"' : '' }>대전</option>
                <option value="경기" ${memberVO.region == "경기" ? 'selected="selected"' : '' }>경기</option>
                <option value="경상" ${memberVO.region == "경상" ? 'selected="selected"' : '' }>경상</option>
                <option value="충청" ${memberVO.region == "충청" ? 'selected="selected"' : '' }>충청</option>
                <option value="강원" ${memberVO.region == "강원" ? 'selected="selected"' : '' }>강원</option>
                <option value="전라" ${memberVO.region == "전라" ? 'selected="selected"' : '' }>전라</option>
                <option value="제주" ${memberVO.region == "제주" ? 'selected="selected"' : '' }>제주</option>
              </select>
            </span>
          </div>
          <div class="err_form"><span class="errmsg" id="region_errmsg"></span></div>

          <div class="formBox">
            <span class="label"><label for="men">성별</label></span>
            <span>
              <input type="radio" name="gender" id="men" value="남" ${memberVO.gender == "남" ? 'checked="checked"' : '' }><label for="men">남</label>
              <input type="radio" name="gender" id="women" value="여" ${memberVO.gender == "여" ? 'checked="checked"' : '' }><label for="women">여</label>
            </span>
          </div>
          <div class="err_form"><span class="errmsg" id="gender_errmsg"></span></div>

        </div>
        <div id="button"><button type="submit" id="modifyBtn">수 정 하 기</button></div>
      </div>
    </div>
  </form>
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










