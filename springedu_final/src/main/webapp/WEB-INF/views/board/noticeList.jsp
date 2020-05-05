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
<title>NOTICE</title>
	<!-- 글자 및 그림가져오기 -->
  <link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap&subset=korean" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding:400,700&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />  
<link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/noticeList.css"/>">
<script src="<c:url value="/resources/js/common.js"/>"></script>

<script>
	window.addEventListener("load", init, false);
	function init() {
		//글쓰기 버튼 클릭시
		writeBtn.addEventListener("click", function(e){
			e.preventDefault();
			let returnPage = e.target.getAttribute('data-returnPage');
			location.href = getContextPath()+"/menu/noticeWriteForm/"+returnPage;
		}, false);		
	}
</script>


</head>
<body>

	<%@ include file="../include/header.jsp"%>


	<section id="formSection">
 		<div id="containerAll"> 
			<div id="container">
				<h2>NOTICE</h2>
				<table>
					<tr>
						<td class="col-1">번호</td>
						<td class="col-3">제목</td>
						<td class="col-4">작성자</td>
						<td class="col-5">작성일</td>
						<td class="col-6">조회수</td>
					</tr>
					<c:forEach var="rec" items="${noticeList }">
						<fmt:formatDate value="${rec.ncdate }" pattern="yyyy-MM-dd HH:mm"
							var="cdate" />
						<tr>
							<td class="col-1">${rec.nnum }</td>
							<td class="col-3" id="bodyContent">
								<a href="${pageContext.request.contextPath }/menu/noticeView/${pc.rc.reqPage }/${rec.nnum }">
									${rec.ntitle }
								</a>
							</td>
							<td class="col-4">${rec.nnickname }</td>
							<td class="col-5">${cdate }</td>
							<td class="col-6">${rec.nhit }</td>
						</tr>
					</c:forEach>
				</table>
				<div id="btnContainer">
					<!-- 관리자 계정만 글쓰기 버튼 노출 -->
					<c:if test="${sessionScope.member.admin > 0 }">
						<div class="btnBox">
							<button id="writeBtn" data-returnPage="${pc.rc.reqPage }">글쓰기</button>
						</div>
					</c:if>
				</div>
				
				<!-- ---------------------------------------페이징 컨트롤----------------------------------------------- -->
				<div id="pageContainer">
 					<div id="pageWrapper">
						<!-- 처음페이지/이전페이지 이동 -->
						<c:if test="${pc.prev }" >
							<a href="${contextRoot }/menu/noticeList/1"><i class="fas fa-angle-double-left"></i></a>
							<a href="${contextRoot }/menu/noticeList/${pc.startPage-1}"><i class="fas fa-angle-left"></i></a> 
						</c:if>
						<c:forEach var="pageNum" begin="${pc.startPage }" end="${pc.endPage }">
						<!-- 현재 페이지와 요청페이지가 다르면 -->
							<c:if test="${pc.rc.reqPage != pageNum }">
								<a href="${contextRoot }/menu/noticeList/${pageNum }/${pc.fc.searchType }/${pc.fc.keyword }" class="off"><span class="num">${pageNum }</span></a>
							</c:if>
							<!-- 현재 페이지와 요청페이지가 같으면 -->
							<c:if test="${pc.rc.reqPage == pageNum }">
								<a href="${contextRoot }/menu/noticeList/${pageNum }/${pc.fc.searchType }/${pc.fc.keyword }" class="on"><span class="num">${pageNum }</span></a>
							</c:if>
						</c:forEach>
						<c:if test="${pc.next }" >
							<a href="${contextRoot }/menu/noticeList/${pc.endPage+1}"><i class="fas fa-angle-right"></i></a>
							<a href="${contextRoot }/menu/noticeList/${pc.finalEndPage}"><i class="fas fa-angle-double-right"></i></a>
						</c:if>
					</div> 
				</div>	<!-- pageContainer 끝 -->
				
			</div>	<!-- container 끝 -->
		</div>		<!-- containerAll 끝  -->
	</section>

 	<%@ include file="../include/footer.jsp"%>

</body>
</html>