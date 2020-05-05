<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

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
<link rel="stylesheet" href="<c:url value="/resources/css/list.css"/>">
<script src="<c:url value="/resources/js/common.js"/>"></script>

<script>
	window.addEventListener("load", init, false);
 	function init() {
		//글쓰기 버튼 클릭시
		writeBtn.addEventListener("click", function(e){
			e.preventDefault();

			let returnPage = e.target.getAttribute('data-returnPage');
			location.href = getContextPath()+"/board/writeForm/"+returnPage;
		}, false);



	//검색버튼 클릭시
		searchBtn.addEventListener("click", function(e){
			e.preventDefault();
			console.log("검색클릭~!")
			//
			if(keyword.value.trim().length == 0) {
				alert('검색어를 입력하세요');
				keyword.value="";
				keyword.focus();
				return false;
			}

			let stype = searchType.value;	//검색유형
			let kword = keyword.value;		//검색어

			location.href = getContextPath() + "/board/list/1/" + stype + "/" + kword;		
		}, false);
		
	}
</script>
</head>
<body>

	<%@ include file="../include/header.jsp"%>


	<section id="formSection">
 		<div id="containerAll"> 
			<div id="container">
				<h2>COMMUNITY</h2>
				<table>
					<tr>
						<td class="col-1">번호</td>
						<td class="col-2">분류</td>
						<td class="col-3">제목</td>
						<td class="col-4">작성자</td>
						<td class="col-5">작성일</td>
						<td class="col-6">조회수</td>
					</tr>
					<c:forEach var="rec" items="${list }">
						<fmt:formatDate value="${rec.bcdate }" pattern="yyyy-MM-dd HH:mm"
							var="cdate" />
						<tr>
							<td class="col-1">${rec.bnum }</td>
							<td class="col-2">${rec.boardCategoryVO.cname }</td>
							<td class="col-3" id="bodyContent">
								<c:forEach begin="1" end="${rec.bindent }">&nbsp;&nbsp;</c:forEach> 
								<%-- <c:if test="${rec.bindent > 0 }"><i class="fas fa-chevron-right"></i></c:if>  --%>
								<a href="${pageContext.request.contextPath }/board/view/${pc.rc.reqPage }/${rec.bnum }">${rec.btitle }</a>
							</td>
							<td class="col-4">${rec.bnickname }</td>
							<td class="col-5">${cdate }</td>
							<td class="col-6">${rec.bhit }</td>
						</tr>
					</c:forEach>
				</table>
				<div id="btnContainer">
					<div class="btnBox">
						<button id="writeBtn" data-returnPage="${pc.rc.reqPage }">글쓰기</button>
					</div>
				</div>
				
				<!-- 전체 페이지 수 -->
				<div id="pageContainer">
					<div id="pageWrapper">
						<!-- 처음페이지/이전페이지 이동 -->
						<c:if test="${pc.prev }" >
							<a href="${contextRoot }/board/list/1"><i class="fas fa-angle-double-left"></i></a>
							<a href="${contextRoot }/board/list/${pc.startPage-1}"><i class="fas fa-angle-left"></i></a> 
						</c:if>
						<c:forEach var="pageNum" begin="${pc.startPage }" end="${pc.endPage }">
						<!-- 현재 페이지와 요청페이지가 다르면 -->
							<c:if test="${pc.rc.reqPage != pageNum }">
								<a href="${contextRoot }/board/list/${pageNum }/${pc.fc.searchType }/${pc.fc.keyword }" class="off"><span class="num">${pageNum }</span></a>
							</c:if>
							<!-- 현재 페이지와 요청페이지가 같으면 -->
							<c:if test="${pc.rc.reqPage == pageNum }">
								<a href="${contextRoot }/board/list/${pageNum }/${pc.fc.searchType }/${pc.fc.keyword }" class="on"><span class="num">${pageNum }</span></a>
							</c:if>
						</c:forEach>
						<c:if test="${pc.next }" >
							<a href="${contextRoot }/board/list/${pc.endPage+1}"><i class="fas fa-angle-right"></i></a>
							<a href="${contextRoot }/board/list/${pc.finalEndPage}"><i class="fas fa-angle-double-right"></i></a>
						</c:if>
					</div>
					
					<!-- 검색하기 -->
					<div id="searchWrapper">
						<form>
							<select name="searchType" id="searchType">
								<option value="TC"
									<c:out value="${pc.fc.searchType == 'TC' ? 'selected':'' }"/>>제목+내용</option>
								<option value="T"
									<c:out value="${pc.fc.searchType == 'T' ? 'selected':'' }"/>>제목</option>
								<option value="C"
									<c:out value="${pc.fc.searchType == 'C' ? 'selected':'' }"/>>내용</option>
								<option value="N"
									<c:out value="${pc.fc.searchType == 'N' ? 'selected':'' }"/>>작성자</option>
								<option value="Y"
									<c:out value="${pc.fc.searchType == 'Y' ? 'selected':'' }"/>>아이디</option>
							</select>
							<input type="search" name="keyword" id="keyword" value="${pc.fc.keyword }" />
							<button id="searchBtn">검색</button>
						</form>
					</div>
				</div>	<!-- pageContainer 끝 -->
			</div>	<!-- container 끝 -->
		</div>		<!-- containerAll 끝  -->
	</section>

 	<%@ include file="../include/footer.jsp"%>

</body>
</html>