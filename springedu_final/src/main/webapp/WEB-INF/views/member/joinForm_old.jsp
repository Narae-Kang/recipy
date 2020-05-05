<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>회 원 가 입</title>
<link
	href="https://fonts.googleapis.com/css?family=Gothic+A1&display=swap&subset=korean"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />
<link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>" />
<link rel="stylesheet" href="<c:url value="/resources/css/memberJoin.css"/>" />
<script src="<c:url value="/resources/js/memberJoin.js"/>"></script>

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


</head>

<body>

	<%@ include file="../include/header.jsp" %>
	<section id="formSection">
		<form:form id="joinFrm"
			action="${pageContext.request.contextPath }/member/join"
			modelAttribute="mvo" method="post">
			<div class="container">
				<div class="content">
					<div>
						<h2 class="join-title">회 원 가 입</h2>
					</div>
					<div class="caution">
						필수 입력 사항<span class="ast">*</span>
					</div>
	
					<div class="formSet">
						<div class="formBox">
							<span class="ast">*</span> 
							<span class="label"><form:label path="id">아이디</form:label></span> 
							<span class="input_form">
								<form:input type="text" id="id" name="id" path="id" placeholder="Email을 입력해주세요." />
							</span>
						</div>
						<div class="err_form">
							<form:errors path="id" cssClass="errmsg" id="id_errmsg"></form:errors>
						</div>
	
						<div class="formBox">
							<span class="ast">*</span> 
							<span class="label"><form:label path="pw">비밀번호</form:label></span> 
							<span class="input_form">
								<form:input type="password" id="pw" name="pw" path="pw" placeholder="8~10자리의 영어/숫자" />
							</span>
						</div>
						<div class="err_form">
							<form:errors path="pw" cssClass="errmsg" id="pw_errmsg"></form:errors>
						</div>
	
						<!-- 비밀번호 체크는 memberVO 없음 -->
						<div class="formBox">
							<span class="ast">*</span> <span class="label"><label for="pwChk">비밀번호 재확인</label></span> 
							<span class="input_form">
								<input type="password" name="pwChk" id="pwChk">
							</span>
						</div>
						<div class="err_form">
							<span class="errmsg" id="pwChk_errmsg"></span>
						</div>
	
	
						<div class="formBox">
							<span class="ast">*</span> <span class="label"><form:label
									path="tel">전화번호</form:label></span> <span class="input_form"><form:input
									type="tel" id="tel" name="tel" path="tel"
									placeholder="ex) 010-1234-5678" /></span>
						</div>
						<div class="err_form">
							<form:errors path="tel" cssClass="errmsg" id="tel_errmsg"></form:errors>
						</div>
	
						<!-- 닉네임 -->
						<div class="formBox">
							<span class="ast">*</span> <span class="label"><form:label
									path="nickname">닉네임</form:label></span> <span class="input_form"><form:input
									type="text" id="nickname" name="nickname" path="nickname"
									placeholder="3~10자리의 한글/영어" /></span>
						</div>
						<div class="err_form">
							<form:errors path="nickname" cssClass="errmsg"
								id="nickname_errmsg"></form:errors>
						</div>
	
						<!-- 생년월일 추가하기 -->
						<div class="formBox">
							<span class="ast">*</span> 
							<span class="label"><form:label path="birth">생년월일</form:label></span> 
							<span class="input_form">
								<form:input type="date" id="birth" name="birth" path="birth" />
							</span>
						</div>
						<div class="err_form">
							<span class="errmsg" id="birth_errmsg"></span>           
							<form:errors path="birth" cssClass="errmsg"></form:errors>
						</div>
					<!-- ===========================================================생년월일 -->
						<div class="formBox">
							<span class="ast">*</span> 
							<span class="label">
								<form:label path="region">지역</form:label>
							</span> 
							<span class="input_form input_choice"> 
								<form:select path="region" id="region">
									<form:option value="0"> 지역 선택  </form:option>
									<form:options path="region" items="${region }" itemValue="code" itemLabel="label" />
								</form:select>
							</span>
						</div>
						<div class="err_form">
							<form:errors path="region" cssClass="errmsg" id="region_errmsg"></form:errors>
						</div>
	
						<div class="formBox">
							<span class="ast">*</span> 
							<span class="label"><form:label path="gender">성별</form:label></span> 
							<span> 
								<form:radiobuttons path="gender" items="${gender }" itemValue="code" itemLabel="label" />
							</span>
						</div>
						<div class="err_form">
							<form:errors path="gender" cssClass="errmsg" id="gender_errmsg"></form:errors>
						</div>
	
					</div>
					<div class="err_form" style="color:#f00; font-weight:bold;font-size:0.8.rem">${svr_msg }</div>  
					<div id="button">
						<button type="submit" id="joinBtn">가 입 하 기</button>
					</div>
				</div>
			</div>
		</form:form>
	</section>
	
	<%@ include file="../include/footer.jsp" %>

</body>

</html>