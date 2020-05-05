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
  <title>탈 퇴</title>
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/main.css"/>">
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/out.css'/>">
  <script src="<c:url value='/resources/js/out.js'/>"></script>
  
    <!-- 글자 링크 -->
  <link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
  <!--한글+영어(굵고 동글동글한 체) : font-family: 'Jua', sans-serif; -->
  <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap&subset=korean" rel="stylesheet">
  <!-- 한글+영어(단정 꽉차있는체) : font-family: 'Do Hyeon', sans-serif; -->
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding:400,700&display=swap&subset=korean" rel="stylesheet">
  <!-- 한글+영어(단정) : font-family: 'Nanum Gothic Coding', monospace; -->
  
  
</head>

<body>

	<%@ include file="../include/header.jsp" %>
 
	<section id="formSection">
	  <div class="container">
	    <div class="login_wrapper">
	      <form id="frm" action="<c:url value='/member/out' />" method="post">
	        <div>
	          <h3 class="login_title">회 원 탈 퇴</h3>
	          <hr>
	        </div>
	        <div class="login_content">
	          <div>
	            <div><input type="text" name="id" id="id" placeholder="아이디를 입력하세요" value="${sessionScope.member.id }" readOnly></div>
	            <div><span id="idMsg"></span></div>
	            <div><input type="password" name="pw" id="pw" placeholder="비밀번호를 입력하세요"></div>
	            <div><span id="pwMsg" class="errmsg"><c:if test="${!empty svr_msg}">${svr_msg }</c:if></span></div> 
	          </div>
	          <div><input type="submit" name="" id="outBtn" value="탈 퇴"></div>			
	        </div>
	      </form>
	<%--       <div class="find_info">
	        <a href="#">아이디 찾기</a>
	        <span>|</span>
	        <a href="#">비밀번호 찾기</a>
	      </div>--%>
	
	      <div class="memberjoin">
	<%--         <span>아직 회원이 아니신가요?</span><a href="<c:url value="/../member/memberJoin.jsp"/>">회원가입</a> --%>
	      </div> 
	
	    </div>
	  </div>
	</section> 
	
	<%@ include file="../include/footer.jsp" %>

</body>

</html>