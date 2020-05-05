<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>COMMUNITY</title>
	<!-- 글자 및 그림가져오기 -->
  <link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap&subset=korean" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding:400,700&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />  
<link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/writeForm.css"/>">
<script src="<c:url value="/resources/js/common.js"/>"></script>
<%-- <script src="<c:url value="/resources/js/write.js"/>"></script> --%>

<script>
window.addEventListener("load", init, false);
function init() {
	// 등록버튼 클릭시
	writeBtn.addEventListener("click", function(e) {
		e.preventDefault();
		// 유효성 체크

		// 게시글 작성 전송
		document.getElementById("boardVO").submit();

	}, false);
	// 취소 버튼 클릭시
	cancleBtn.addEventListener("click", function(e) {
		e.preventDefault();
/* 		document.getElementById("boardVO").reset(); */
  		location.href = getContextPath() + "/board/list";

	}, false);
	// 목록버튼 클릭시
/* 	listBtn.addEventListener("click", function(e) {
		e.preventDefault();
		location.href = getContextPath() + "/board/list";
	}, false); */
}
</script>

<!-- 글자 링크 -->
<link
	href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean"
	rel="stylesheet">
<!--한글+영어(굵고 동글동글한 체) : font-family: 'Jua', sans-serif; -->
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap&subset=korean"
	rel="stylesheet">
<!-- 한글+영어(단정 꽉차있는체) : font-family: 'Do Hyeon', sans-serif; -->
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding:400,700&display=swap&subset=korean"
	rel="stylesheet">
<!-- 한글+영어(단정) : font-family: 'Nanum Gothic Coding', monospace; -->

<!-- 햄버거 모양 가져오기 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />

</head>
<body>

	<%@ include file="../include/header.jsp" %>

	<section id="formSection">
		<div id="containerAll">
			<div id="container">
 				<h2>COMMUNITY</h2> 
	      <form:form action="${pageContext.request.contextPath }/board/write/${returnPage }" 
	      					 enctype="multipart/form-data"
	      					 method="post"
	      					 modelAttribute="boardVO">
					<div class="contentsBox">
						<form:label path="boardCategoryVO.cid" class="col-1"> 분류</form:label>
						<form:select path="boardCategoryVO.cid" class="col-2">
							<option value="0">====== SELECT ======</option>
							<form:options path="boardCategoryVO.cid"
														items="${boardCategoryVO}" 
														itemValue="cid" 
														itemLabel="cname"/>
						</form:select>
					</div>
					<div class="errBox">
						<form:errors path="boardCategoryVO.cid" />
					</div>
					
					<div class="contentsBox">
						<form:label path="btitle" class="col-1">제목</form:label>
						<form:input path="btitle" class="col-2" type="text"/>
					</div>
					<div class="errBox">
						<form:errors path="btitle" />
					</div>
	
					<div class="contentsBox">
						<label class="col-1" id="bid">작성자</label>
						<input type="text" class="col-2" readOnly="true" value="${member.nickname } (${member.id })" />
					</div>
	
					<div class="contentsBox">
						<form:label path="bcontent" class="col-1">내용</form:label>
						<form:textarea path="bcontent" class="col-2" cols="60" rows="20"></form:textarea>
					</div>
					<div class="errBox">
						<form:errors path="bcontent" />
					</div>
	
					<div class="contentsBox">
						<form:label path="files" class="col-1">첨부</form:label>
						<form:input path="files" class="col-2" type="file" multiple="multiple"/>
					</div>
					<div class="errBox">
						<form:errors path="files" />
					</div>
	
					<div id="btnContainer">
						<div id="btnWrapper">
	           <form:button class="btn" id="writeBtn">등록</form:button>
<%-- 	           <form:button class="btn" id="cancleBtn">취소</form:button> --%>
	           <form:button class="btn" id="cancleBtn" data-returnPage="${returnPage }">취소</form:button>
<%-- 	           <form:button class="btn" id="listBtn" data-returnPage="${returnPage }">목록</form:button>  --%>
	          </div> 
					</div>
				</form:form>
			</div>	<!-- container 끝 -->
		</div>	<!-- containerAll 끝 -->
	</section>

	<%@ include file="../include/footer.jsp" %>
	
</body>
</html>