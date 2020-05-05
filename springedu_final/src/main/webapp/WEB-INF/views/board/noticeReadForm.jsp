<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html lang="ko">
<%-- <c:set var="contextRoot" value="${pageContext.request.contextPath }" /> --%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>NOTICE</title>
<!-- 글자 및 그림가져오기 -->
<link
	href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap&subset=korean"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding:400,700&display=swap&subset=korean"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />
<link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/noticeReadForm.css"/>">
<script src="<c:url value="/resources/js/common.js"/>"></script>
<%-- <script src="<c:url value="/resources/js/readForm.js"/>"></script> --%>

<script> //자바스크립트
window.addEventListener("load",init, false);
function init(){
	changeMode(false);

	let modifyBtn = document.getElementById('modifyBtn');
	let deleteBtn = document.getElementById('deleteBtn');
	
  //수정
  if(modifyBtn != null) {
		modifyBtn.addEventListener("click",function(e){
			e.preventDefault();
			console.log("수정");
			changeMode(true);
		},false);
  }
  //삭제
  if(deleteBtn != null) {
		deleteBtn.addEventListener("click",function(e){
			e.preventDefault();
	//		console.log("삭제"+e.target.getAttribute('data-del_bnum'));
	
				if (confirm("삭제하시겠습니까?")){
					let returnPage = e.target.getAttribute('data-returnPage');
					let nnum = e.target.getAttribute('data-bnum');
				location.href = getContextPath()+"/menu/noticeDelete/"+returnPage+"/"+nnum;
			} 
		},false);
  }

  //취소(수정모드->읽기모드)
	cancelBtn.addEventListener("click",function(e){
		e.preventDefault();
		console.log("취소");
		changeMode(false);
	},false);
  //저장	
	saveBtn.addEventListener("click",function(e){
		e.preventDefault();
		console.log("저장");
		//유효성체크

		//
		document.getElementById('noticeVO').submit();
		
	},false);      

  //목록
	listBtn.addEventListener("click",function(e){
		e.preventDefault();
		console.log("목록");
		let returnPage = e.target.getAttribute('data-returnPage');
		location.href=getContextPath()+"/menu/noticeList/"+returnPage;
	},false);   
}

//읽기 모드 , 수정모드
function changeMode(flag){						
		let rmodes = document.getElementsByClassName("rmode");
		let umodes = document.getElementsByClassName("umode");
	//수정모드	
	if(flag){
		//제목변경 => 게시글 보기
		document.getElementById("title").textContent = 'MODIFY';
		//분류,필드 제목,내용 필드
/* 		document.getElementById("boardCategoryVO.cid").removeAttribute("disabled");		 */	
		document.getElementById("ntitle").removeAttribute("readOnly");			
		document.getElementById("ncontent").removeAttribute("readOnly");			
		//수정모드버튼 활성화
		Array.from(rmodes).forEach(e=>{e.style.display="none";});
		Array.from(umodes).forEach(e=>{e.style.display="block";});
	//읽기모드	
	}else{
		//제목변경 => 게시글 보기
		document.getElementById("title").textContent = 'NOTICE';
		//분류,필드 제목,내용 필드
/* 		document.getElementById("boardCategoryVO.cid").setAttribute("disabled",true);			 */			
		document.getElementById("ntitle").setAttribute("readOnly",true);
		document.getElementById("ncontent").setAttribute("readOnly",true);	
		//읽기모드버튼 활성화				
		Array.from(rmodes).forEach(e=>{e.style.display="block";});
		Array.from(umodes).forEach(e=>{e.style.display="none";});
	}
}
</script>


</head>
<body>

	<%@ include file="../include/header.jsp"%>

	<section id="formSection">
		<div id="containerAll">
			<div id="frm">	<!-- container 대용!! -->
				<h1 id="title">NOTICE</h1>
				<form:form
					action="${pageContext.request.contextPath }/menu/noticeModify/${returnPage }"
					enctype="multipart/form-data" method="post"
					modelAttribute="noticeVO">
					<form:hidden path="nnum" />
					
					<div class="contentsBox writeInfo">
						<form:label path="ntitle" class="col-1">제목</form:label>
						<form:input class="col-2" type="text" path="ntitle"
							readOnly="true" />
					</div>
					<div class="errBox">
						<form:errors path="ntitle" />
					</div>

					<div class="contentsBox writeInfo">
						<label class="col-1" id="nid">작성자</label> 
						<input type="text" class="col-2" readOnly="true" value="${noticeVO.nnickname } (${noticeVO.nid })" />
					</div>

					<div class="contentsBox">
						<form:label path="ncontent" class="col-1">내용</form:label>
						<form:textarea path="ncontent" class="col-2" cols="60" rows="20"
							readOnly="true"></form:textarea>
					</div>
					<div class="errBox">
						<form:errors path="ncontent" />
					</div>

					<div id="btnContainer">
						<div id="btnWrapper">
							<!-- 작성자만 수정, 삭제 가능 시작 -->
							<c:if test="${sessionScope.member.id == boardVO.bid || sessionScope.member.admin > 0 }">
								<form:button class="btn rmode" id="modifyBtn">수정</form:button>
								<form:button class="btn rmode" id="deleteBtn"
									data-returnPage="${returnPage }" data-bnum="${noticeVO.nnum }">삭제</form:button>
							</c:if>
							<!-- 작성자만 수정, 삭제 가능 끝 -->
							<form:button class="btn umode" id="cancelBtn">취소</form:button>
							<form:button class="btn umode" id="saveBtn">저장</form:button>
							<form:button class="btn" id="listBtn"	data-returnPage="${returnPage }">목록</form:button>
						</div>
					</div>

				</form:form>
			</div>
		</div>
	</section>

	<%@ include file="../include/footer.jsp"%>

</body>
</html>