<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextRoot" value="${pageContext.request.contextPath }" />
  <header class="header_container">
    <!-- ----------------------브라우저용 헤더---------------------- -->
    <nav class="header_wrapper">
      <div class="header_logo"><a href="<c:url value="/"/>"><img src="<c:url value="/resources/img/banner2.jpg"/>" alt=""></a></div>
      <ul class="menu_list">
        <li class="menu list1"><a href="#">BRAND</a>
          <ul class="submenu sublist1">
            <li><a href="${pageContext.request.contextPath }/menu/brand">BRAND</a></li>
          </ul>
        </li>
        <li class="menu list2"><a href="#">MENU</a>
          <ul class="submenu sublist2">
            <li><a href="#">STEAK</a></li>
            <li><a href="#">PASTA</a></li>
            <li class="smallFont"><a href="#">SALAD&OTHERS</a></li>
            <li><a href="#">DRINK</a></li>
            <li><a href="#">DESSERT</a></li>
          </ul>
        </li>
        <li class="menu list2"><a href="#">COMMUNITY</a>
          <ul class="submenu sublist3">
            <li><a href="${pageContext.request.contextPath }/menu/noticeList">NOTICE</a></li>
            <li><a href="${pageContext.request.contextPath }/board/list">COMMUNITY</a></li>
          </ul>
        </li>
        <li class="menu list4"><a href="#">EVENT</a>
        </li>
        <c:if test="${empty member }" >  
        <div class="menu_forms">		
          <li class="menu list6"><a href="<c:url value='/member/joinForm' />">회원가입</a></li>
          <li class="menu list5"><a href="<c:url value='/loginForm' />">로그인</a></li>
        </div>
        </c:if>
        <c:if test="${!empty member }" >
        <div class="menu_forms">
<%-- 					<li class="menu list6"><a href="<c:url value='/member/modifyForm/${sessionScope.member.id }' />">${sessionScope.member.nickname }님 </a></li>
	 --%>							
					<li class="menu list6">
						<c:choose>
							<c:when test="${sessionScope.member.admin > 0 }">
								<a href="<c:url value='/admin/memberList' />">${sessionScope.member.nickname }님 </a>
							</c:when>
							<c:otherwise>
								<a href="<c:url value='/member/modifyForm/${sessionScope.member.id }' />">${sessionScope.member.nickname }님 </a>
							</c:otherwise>
						</c:choose>
					</li>
          
          <li class="menu list5"><a href="<c:url value='/logout' />">로그아웃</a></li>
        </div>
        </c:if>
      </ul>
    </nav>
      <!-- -------------------모바일 햄버거 헤더---------------------- -->
    <nav id="mobile">
      <ul>
        <li><a href="#">BRAND</a>
          <ul class="submenu2 hamList1">
            <li><a href="${pageContext.request.contextPath }/menu/brand">BRAND</a></li>
          </ul>
        </li>
        <li><a href="#">MENU</a>
          <ul class="submenu2 hamList2">
            <li><a href="#">STEAK</a></li>
            <li><a href="#">PASTA</a></li>
            <li><a href="#">SALAD&OTHERS</a></li>
            <li><a href="#">DRINK</a></li>
            <li><a href="#">DESSERT</a></li>
          </ul>
        </li>
        <li><a href="#">COMMUNITY</a>
          <ul class="submenu2 hamList3">
            <li><a href="${pageContext.request.contextPath }/menu/noticeList">NOTICE</a></li>
            <li><a href="${pageContext.request.contextPath }/board/list">COMMUNITY</a></li>
          </ul>
        </li>
        <li><a href="#">EVENT</a> </li>
        <c:if test="${empty member }" >
        <div>
          <li><a href="<c:url value='/member/joinForm' />">회원가입</a></li>
          <li><a href="<c:url value='/loginForm' />">로그인</a></li>
        </div>
        </c:if>
        <c:if test="${!empty member }" >
        <div>
          <li>
<%--           	<a href="<c:url value='/member/modifyForm/${sessionScope.member.id }' />">${member.nickname }님 </a> --%>
						<c:choose>
							<c:when test="${sessionScope.member.admin > 0 }">
								<a href="<c:url value='/admin/memberList' />">${sessionScope.member.nickname }님 </a>
							</c:when>
							<c:otherwise>
								<a href="<c:url value='/member/modifyForm/${sessionScope.member.id }' />">${sessionScope.member.nickname }님 </a>
							</c:otherwise>
						</c:choose>
          </li>
          <li><a href="<c:url value='/logout' />">로그아웃</a></li>
        </div>
        </c:if>

      </ul>
    </nav>
    <a href="#" class="tab">
      <span style="color: white;">
        <i class="fas fa-th-list fa-3x"></i>
        <!-- <i class="fas fa-cat fa-4x"></i> -->
        <!-- <i class="fas fa-bars fa-3x"></i> -->
      </span>
    </a>
  </header>
  

