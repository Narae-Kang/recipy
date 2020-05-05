<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

  <section class="newImg_container">
		<div class="slideshow">
      <div class="slideshow_slides">
        <a href=""><img src="<c:url value="/resources/img/mainmenu1.jpg"/>" alt="슬라이드1">
        <a href=""><img src="<c:url value="/resources/img/mainmenu2.jpg"/>" alt="슬라이드2">
        <a href=""><img src="<c:url value="/resources/img/mainmenu6.jpg"/>" alt="슬라이드3">
        <a href=""><img src="<c:url value="/resources/img/mainmenu7.jpg"/>" alt="슬라이드4">
        <a href=""><img src="<c:url value="/resources/img/mainmenu8.jpg"/>" alt="슬라이드5">
      </div>
      <div class="slideshow_nav">
      	<a href="" class="prev">prev</a>
      	<a href="" class="next">next</a>
    	</div>
    	<div class="indicator">
				<!-- 인디케이터 생성되는 위치 -->
    	</div>
    </div> <!-- slideshow 끝 -->
  </section>
  <!-- ---------------------- 2단 박스 ---------------------- -->
  <section class="note_container">
    <div class="note_wrapper1">
      <span class="note_box note_notice">
        <div class="note_title">
          N O T I C E
        </div>
        <div class="note_notice">
          <ul>
            <li><a href="#">[공지] 영업시간 변경…</a><span>19.03.15</span></li>
            <li><a href="#">크리스마스 예약 안내</a><span>19.12.10</span></li>
            <li><a href="#">SNS이벤트 당첨자발…</a><span>19.11.11</span></li>
            <li><a href="#">가을 신메뉴 3종을 먼…</a><span>19.09.25</span></li>
            <li><a href="#">추석 명절 영업 안내</a><span>19.09.01</span></li>
          </ul>
        </div>
      </span>
      <span class="note_box note_event">
        <div class="note_title">
          E V E N T
        </div>
        <img src="<c:url value="/resources/img/event2.jpg"/>" alt="메인 이벤트">
      </span>
      <span class="note_box note_service">
        <div class="note_title">
          C O N T A C T - U S
        </div>
        <img src="<c:url value="/resources/img/contact.jpg"/>" alt="스토어">
      </span>
    </div>
  </section>
  
    <!-- ---------------------- 3단 박스 ---------------------- -->
   <section class="note_container2">
    <div class="note_wrapper2">
      <div class="note_box2">
      <!-- ----------------홈페이지 쿠킹클래스------------------- -->
        <div class="homeCook">
          	<a href="<c:url value="contact.jsp"/>"><img src="<c:url value="/resources/img/cooking.jpg"/>"></a>         	
        </div>
      <!-- ----------------모바일 쿠킹클래스------------------- -->
        <div class="moCook">
          	<a href="<c:url value="contact.jsp"/>"><img src="<c:url value="/resources/img/cooking2.jpg"/>"></a>         	
        </div>
        
      </div>
    </div>
  </section> 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  