<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>    
<%-- <%@ page import="com.kh.dto.MemberDTO" %> --%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원 목록</title>

<style>
* {text-align: center;}
	table { border-collapse:collapse;}
	table tr td:nth-child(1),
	table tr td:nth-child(4){
	}
	
#headWrapper {
	background-color: #D8D8D8;
}	
</style>

<!-- 
<script>
	window.addEventListener("load",init,false);
	function init(){
		var delBtnTags 		= document.getElementsByClassName("delBtn");
		var modifyBtnTags = document.getElementsByClassName("modifyBtn");
		var insertBtnTag 	= document.getElementById("insertBtn");

		insertBtnTag.addEventListener("click", function(){
			location.href = "<c:url value="/insert.jsp" />";

		}, false);
			
		
		//삭제 버튼
		for(let item of delBtnTags){
			item.addEventListener('click',function(){
				if(confirm('삭제하시겠습니까?')){
					var bookid = this.getAttribute("data-bookid");
					location.href="${pageContext.request.contextPath}/delete?bookid="+bookid;
					//console.log(this.getAttribute("data-bookid"));
				}
			},false);
			//console.log(item,idx);
		}
/* 		Array.from(delBtnTags).forEach(function(item,idx){
			item.addEventListener('click',function(){
				var bookid = this.getAttribute("data-bookid");
				location.href="${pageContext.request.contextPath}/delete?bookid="+bookid;
				//console.log(this.getAttribute("data-bookid"));
			},false);
			//console.log(item,idx);
		}); */

		//수정 버튼
		for(let item of modifyBtnTags){
			item.addEventListener('click',function(){
				var bookid = this.getAttribute("data-bookid");
				location.href="${pageContext.request.contextPath}/selectOne?bookid="+bookid;
				//console.log(this.getAttribute("data-bookid"));
			},false);
			//console.log(item,idx);
		}
/* 		Array.from(modifyBtnTags).forEach(function(item,idx){
			item.addEventListener('click',function(){
				var bookid = this.getAttribute("data-bookid");
				location.href="${pageContext.request.contextPath}/selectOne?bookid="+bookid;
				//console.log(this.getAttribute("data-bookid"));
			},false);
			//console.log(item,idx);
		}); */
	} 
</script>
-->
</head>

<body>
<table border="1">
	<caption><h3>회원 목록 리스트</h3></caption>
 	<colgroup>
		<col width="15%">
		<col width="10%">
		<col width="10%">
		<col width="15%">
		<col width="10%">
		<col width="10%">
		<col width="10%">
		<col width="10%">
<%-- 		<col width="5%">
		<col width="5%"> --%>
	</colgroup> 
	<thead>
<!-- 		<tr>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th><input id="insertBtn" type="button" value="회원등록" /></th>
		</tr> -->
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>전화번호</th>
				<th>별명</th>
	<!-- 			<th>성별</th>
				<th>지역</th> -->
				<th>생년월일</th>
				<th>생성일</th>
				<th>수정일</th>
				<th>쿠킹클래스</th>
			</tr>
	</thead>
	<tbody>
		<c:forEach var="rec" items="${memberList }">
			<tr>
				<td>${rec.id }</td>
				<td>${rec.pw }</td>
				<td>${rec.tel }</td>
				<td>${rec.nickname }</td>
<%-- 				<td>${rec.gender }</td>
				<td>${rec.region }</td> --%>
				<td>${rec.birth }</td>
				<td>${rec.cdate }</td>
				<td>${rec.udate }</td>
				<td></td>
<%-- 				<td><input class="delBtn" type="button" value="삭제" data-id=${rec.id }></td>
				<td><input class="modifyBtn" type="button" value="수정" data-id=${rec.id }></td> --%>
			</tr>
			</c:forEach>
		</tbody>
</table>
</body>
</html>















