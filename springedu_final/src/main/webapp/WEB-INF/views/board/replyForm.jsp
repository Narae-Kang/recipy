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
<title>문의사항</title>
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
		window.addEventListener("load",init, false);
		function init(){
			//등록버튼 클릭시
			writeBtn.addEventListener("click",function(e){
				e.preventDefault();
				//유효성체크

				//게시글 작성전송
				document.getElementById("boardVO").submit();
				
			},false);
			//취소버튼 클릭시
/* 			cancelBtn.addEventListener("click",function(e){
				e.preventDefault();
				document.getElementById("boardVO").reset();
			},false); */
			//목록버튼 클릭시
			listBtn.addEventListener("click",function(e){
				e.preventDefault();
 				let returnPage = e.target.getAttribute('data-returnPage');
				location.href=getContextPath()+"/board/list/"+returnPage;
			},false);			
		}
  </script>


</head>
<body>

	<%@ include file="../include/header.jsp" %>

	<section id="formSection">
		<div id="containerAll">
			<div id="container">
<%-- 			${boardVO.bnum } <br> --%>
				<h2>COMMUNITY</h2>
	      <form:form action="${pageContext.request.contextPath }/board/reply/${returnPage }" 
	      					 enctype="multipart/form-data"
	      					 method="post"
	      					 modelAttribute="boardVO">
	      	<form:hidden path="boardCategoryVO.cid" value="${boardVO.boardCategoryVO.cid }" />				 
	      	<form:hidden path="bgroup" value="${boardVO.bgroup }" />				 
	      	<form:hidden path="bindent" value="${boardVO.bindent }" />				 
	      	<form:hidden path="bstep" value="${boardVO.bstep }" />				 
					<div class="contentsBox">
						<form:label path="boardCategoryVO.cid" class="col-1"> 분류</form:label>
						<form:select path="boardCategoryVO.cid" class="col-2" disabled="true">
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
						<form:input path="files" type="file" multiple="multiple"/>
					</div>
					<div class="errBox">
						<form:errors path="files" />
					</div>
	
				</form:form>
				
					<div id="btnContainer">
						<div id="btnWrapper">
			        <button type="submit" class="btn" id="writeBtn">등록</button>
			        <a href="<c:url value='/board/view/${returnPage }/${boardVO.bnum }'/>"><button>취소</button></a>
<!-- 			        <button class="btn" id="cancelBtn">취소</button> -->
			        <button class="btn" id="listBtn" data-returnPage="${returnPage }">목록</button>
	          </div> 
					</div>
			</div>	
		</div>
	</section>

	<%@ include file="../include/footer.jsp" %>
	
</body>
</html>