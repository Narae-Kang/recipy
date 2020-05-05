<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>BRAND</title>
	<!-- 글자 및 그림가져오기 -->
  <link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap&subset=korean" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding:400,700&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />  
<link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>">
<%-- <link rel="stylesheet" href="<c:url value="/resources/css/list.css"/>"> --%>
<script src="<c:url value="/resources/js/common.js"/>"></script>


<style>
	#containerAll {
		display: flex;
	  justify-content: center;
	  position: relative;
	}
	#container {
		width: 1024px; 
		padding-top: 50px;
		padding-bottom: 200px;
 }
	#sec1, #sec2 {
		width: 100%; height: auto;
		display: flex;
	  justify-content: center;
		padding-top: 50px;
	}
/* 	#containerAll {
		display: flex;
	  justify-content: center;
	  position: relative;
	}
	#container { 
		padding-top: 50px;
		padding-bottom: 200px;
 }
	#sec1, #sec2 {
		display: flex;
	  justify-content: center;
		padding-top: 50px;
	} */
</style>

</head>
<body>

	<%@ include file="../include/header.jsp"%>

	<section id="formSection">
		<div id="containerAll">
			<div id="container">
				<div id="sec1">
					<img src="<c:url value="/resources/img/brand1.jpg"/>" alt="">	
				</div>		
				<div id="sec2">
					<img src="<c:url value="/resources/img/brand2.jpg"/>" alt="">	
				</div>
			</div>			
		</div>
	</section>

 	<%@ include file="../include/footer.jsp"%>

</body>
</html>