<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

  <section class="newImg_container">
		<div class="slideshow">
      <div class="slideshow_slides">
        <a href=""><img src="<c:url value="/resources/img/mainmenu1.jpg"/>" alt="슬라이드1"></a>
        <a href=""><img src="<c:url value="/resources/img/mainmenu2.jpg"/>" alt="슬라이드2"></a>
        <a href=""><img src="<c:url value="/resources/img/mainmenu6.jpg"/>" alt="슬라이드3"></a>
        <a href=""><img src="<c:url value="/resources/img/mainmenu7.jpg"/>" alt="슬라이드4"></a>
        <a href=""><img src="<c:url value="/resources/img/mainmenu8.jpg"/>" alt="슬라이드5"></a>
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
        <div class="note_title">N O T I C E</div>
        <div class="note_notice">
					<c:forEach var="rec" items="${noticeList }" end="5">
						<fmt:formatDate value="${rec.ncdate }" pattern="yy-MM-dd"	var="cdate" />
						<div class="noticeForm">
							<div class="noticeContent">
								<a href="${pageContext.request.contextPath }/menu/noticeView/${pc.rc.reqPage }/${rec.nnum }">${rec.ntitle }</a>
							</div> <!-- noticeContent 끝 -->
							<div class="noticeDate">${cdate }</div>
						</div>
					</c:forEach>
					<!-- ------------------------------------밑으로 내려서 안보이는 상태 -->
				<div id="pageContainer">
 					<div id="pageWrapper">
						<!-- 처음페이지/이전페이지 이동 -->
						<c:if test="${pc.prev }" >
							<a href="${contextRoot }/board/noticeList/1"><i class="fas fa-angle-double-left"></i></a>
							<a href="${contextRoot }/board/noticeList/${pc.startPage-1}"><i class="fas fa-angle-left"></i></a> 
						</c:if>
						<c:forEach var="pageNum" begin="${pc.startPage }" end="${pc.endPage }">
						<!-- 현재 페이지와 요청페이지가 다르면 -->
							<c:if test="${pc.rc.reqPage != pageNum }">
								<a href="${contextRoot }/board/noticeList/${pageNum }/${pc.fc.searchType }/${pc.fc.keyword }" class="off"><span class="num">${pageNum }</span></a>
							</c:if>
							<!-- 현재 페이지와 요청페이지가 같으면 -->
							<c:if test="${pc.rc.reqPage == pageNum }">
								<a href="${contextRoot }/board/noticeList/${pageNum }/${pc.fc.searchType }/${pc.fc.keyword }" class="on"><span class="num">${pageNum }</span></a>
							</c:if>
						</c:forEach>
						<c:if test="${pc.next }" >
							<a href="${contextRoot }/board/noticeList/${pc.endPage+1}"><i class="fas fa-angle-right"></i></a>
							<a href="${contextRoot }/board/noticeList/${pc.finalEndPage}"><i class="fas fa-angle-double-right"></i></a>
						</c:if>
					</div> 
				</div>	<!-- pageContainer 끝 -->
					<!-- -------------------- -->
        </div>
      </span>
      
      <span class="note_box note_event">
        <div class="note_title">E V E N T</div>
        <img src="<c:url value="/resources/img/event2.jpg"/>" alt="메인 이벤트">
      </span>
      
      <span class="note_box note_service">
        <div class="note_title">C O N T A C T - U S</div>
        <img src="<c:url value="/resources/img/contact.jpg"/>" alt="스토어">
      </span>
    </div> <!-- note_wrapper1 끝 -->
  </section>
  
    <!-- ---------------------- 3단 박스 ---------------------- -->
  <section class="note_container2">
    <div class="note_wrapper2">
      <div class="note_box2">
      <!-- ----------------홈페이지 쿠킹클래스------------------- -->
        <div class="homeCook">
          	<a href="${contextRoot }/contact"><img src="<c:url value="/resources/img/cooking.jpg"/>"></a>         	
        </div>
      <!-- ----------------모바일 쿠킹클래스------------------- -->
        <div class="moCook">
          	<a href="<c:url value="contact.jsp"/>"><img src="<c:url value="/resources/img/cooking2.jpg"/>"></a>         	
        </div>
        
      </div>
    </div> 
 	</section> 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  