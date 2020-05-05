<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% 
	String id = (String)session.getAttribute("id");
	String nickname = (String)session.getAttribute("nickname");
%>       
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>RECIPY</title>
  <!-- 제이쿼리에 사용하는 링크 -->
  <script src="<c:url value="http://code.jquery.com/jquery-latest.js"/>"></script>
<%--   <link rel="stylesheet" href="<c:url value="/resources/css/normalize.css"/>"> --%>
  <script src="<c:url value="/resources/js/vendor/modernizr.custom.min.js"/>"></script>
  <script src="<c:url value="/resources/js/vendor/jquery-1.10.2.min.js"/>"></script>
  <script src="<c:url value="/resources/js/vendor/jquery-ui-1.10.3.custom.min.js"/>"></script>
  
  <!-- 외부 css 링크 -->
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/main.css"/>">
  <script src="<c:url value="/resources/js/main.js"/>"></script>
  
  <!-- 글자 링크 -->
  <link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
  <!--한글+영어(굵고 동글동글한 체) : font-family: 'Jua', sans-serif; -->
  <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap&subset=korean" rel="stylesheet">
  <!-- 한글+영어(단정 꽉차있는체) : font-family: 'Do Hyeon', sans-serif; -->
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding:400,700&display=swap&subset=korean" rel="stylesheet">
  <!-- 한글+영어(단정) : font-family: 'Nanum Gothic Coding', monospace; -->
  <link href="https://fonts.googleapis.com/css?family=Gaegu&display=swap&subset=korean" rel="stylesheet">
	<!-- font-family: 'Gaegu', cursive; -->


  <!-- 모양 가져오기 -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />  

  
</head>

<body>      
  <div class="allContainer">
		<%@ include file="include/header.jsp" %>
		
		<%@ include file="include/body.jsp" %>
		
		<%@ include file="include/footer.jsp" %>
	</div> 
</body>

</html>  
