<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>댓글</title>

<link rel="stylesheet"
	href="<c:url value="/resources/css/rereply.css"/>">
<script src="<c:url value="/resources/js/common.js"/>"></script>

<!-- 아이콘 가져오기 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />

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
<link
	href="https://fonts.googleapis.com/css?family=Gaegu&display=swap&subset=korean"
	rel="stylesheet">
<!-- font-family: 'Gaegu', cursive; -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap&subset=korean"
	rel="stylesheet">
<!-- font-family: 'Noto Serif KR', serif; -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400&display=swap"
	rel="stylesheet">
<!-- font-family: 'Noto Sans KR', sans-serif; -->

<script>
	window.addEventListener("load",init2,false);
	//let l_bnum = 2068;		//게시 원글번호
	let l_bnum = ${boardVO.bnum }
	let l_page = 1;				//요청페이지
	let l_id 				= "${sessionScope.member.id}";									//로그인 아이디
	let l_nickname 	= "${sessionScope.member.nickname}";						//로그인 별칭
	let l_url 			= "${pageContext.request.contextPath}/rboard"; 	//공통 URL

	const GOOD = '1', BAD = '2'; //호감'1', 비호감'2'

	// 대댓글 작성 html코드 시작--------------------------------
/* 	let rereply_str = "";
	rereply_str = '<div class="row">';
	rereply_str = '<textarea name="rcontent" id="rcontent" rows="3"></textarea>';
	rereply_str = '<button id="rereplyBtn">등록</button>';
	rereply_str = '</div>'; */
	// 대댓글 작성 html코드 끝----------------------------------
	
	function init2(){

		//댓글목록 가져오기
		replyList(l_page);  

			//페이지번호 클릭시 이벤트 처리
 		paging.addEventListener("click",function(e){
			e.preventDefault();
				if(e.target.tagName == 'A'){
	 				console.log("페이지 클릭됨!!");
	 				l_page = e.target.getAttribute("href");
				replyList(l_page);
			} 
		},false); 

		//댓글작성
		replyBtn2.addEventListener("click",function(){
			//console.log("댓글작성버튼 클릭됨!");
			let rcontentTag = document.getElementById("rcontent")
			let rcontent = rcontentTag.value;
			
			let xhttp = new XMLHttpRequest();
			xhttp.addEventListener("readystatechange",function(){
				if(this.readyState == 4 && this.status == 200){
					console.log(this.responseText);
					if(this.responseText == 'success'){
						replyList(l_page);
						rcontentTag.value = "";
						rcontentTag.focus();
					}else{
						console.log('댓글작성오류!!');
					}
				}
			});

		 //전송데이터 json포맷으로 만들기
     let sendData = {};
     sendData.bnum  = l_bnum;
     sendData.rid 	= l_id;
     sendData.rnickname = l_nickname;
     sendData.rcontent = rcontent;
     
     //자바스크립트 obj => json포맷 문자열 변환
     let result = JSON.stringify(sendData);
     //console.log(result);
	     				
     //post방식
     xhttp.open("POST",l_url,true);
     xhttp.setRequestHeader("Content-Type","application/json;charset=utf-8"); 
     xhttp.send(result);				
			
		},false);
		let replyListTag = document.getElementById("replyList");
		replyListTag.addEventListener("click",function(e){
			//댓글목록에서 'I'태그의 자식 태그에서만 반응하기
			if(e.target.tagName != 'I') return false;
			//이벤트가 일어난 지점에서 data-rnum속성을 포함한 요소를 찾아서 data-rnum값을 추출한다.
			let parentTags = parents(e.target);
			let rnumTag    = parentTags.find( tag => {	if(tag.hasAttribute("data-rnum")){
													return tag;
												}});
			let data_rnum =	rnumTag.getAttribute("data-rnum");
			
			   
			if(e.target.classList.contains('replyDeleteBtn')){
				//console.log('삭제버튼 클릭됨'+data_rnum);
				if(confirm('삭제하시겠습니까?')){
					doDelete(e.target, data_rnum);
				}
			}else if(e.target.classList.contains('replyModifyBtn')){
				console.log('수정버튼 클릭됨'+data_rnum);

				doReplyModifyTrigger(replyListTag,'rereplyCancelBtn');
				doReplyModifyTrigger(replyListTag,'replyModifyCancelBtn');
					
				//1) 아이콘 토글
					e.target.classList.toggle("replyModifyBtn");
				e.target.classList.toggle("fa-edit");

				e.target.classList.toggle("replyModifyCancelBtn");
				e.target.classList.toggle("fa-window-close");		 			
				//2) 대댓글수정양식을 대댓글 대상 아래 추가하기 
				console.log(rnumTag);
				console.log(rnumTag.nextElementSibling);
									
				let row_1 = elt("textarea",{name:"rrcontent", class:"rrcontent lm-7", rows:"3"});
				let row_2 = elt("button",{class:"rreplyModifyBtn"},"수정");							
				let rreplyModifyForm = elt("div",{class:"row rreplyModify"},row_1,row_2);
				 					
				row_2.addEventListener("click",function(){
					//대댓글 수정 처리하기
					doModify(data_rnum,row_1.value);
				},false);
				replyListTag.insertBefore(rreplyModifyForm,rnumTag.nextElementSibling);
				replyListTag.getElementsByClassName("rrcontent")[0].value
					= rnumTag.getElementsByClassName("rcontent")[0].textContent;					
			}else if(e.target.classList.contains('replyModifyCancelBtn')){
				console.log('수정버튼 취소 클릭됨'+data_rnum);

				//1)
				e.target.classList.toggle("replyModifyBtn");
				e.target.classList.toggle("fa-edit");

				e.target.classList.toggle("replyModifyCancelBtn");
				e.target.classList.toggle("fa-window-close");							
				//2) 대댓글입력양식을 제거하기 
				replyListTag.removeChild(rnumTag.nextElementSibling);
				
			}else if(e.target.classList.contains('goodBtn')){
				//console.log('호감버튼 클릭됨'+data_rnum);
				doGoodOrBad(e.target, data_rnum, GOOD);
			}else if(e.target.classList.contains('badBtn')){
				//console.log('비호감버튼 클릭됨'+data_rnum);
				doGoodOrBad(e.target, data_rnum, BAD);
			}else if(e.target.classList.contains('rereplyBtn')){
				console.log('댓글버튼 클릭됨'+data_rnum);
				doReplyModifyTrigger(replyListTag,'rereplyCancelBtn');
				doReplyModifyTrigger(replyListTag,'replyModifyCancelBtn');
				 
				//1) 아이콘 토글
					e.target.classList.toggle("rereplyBtn");
				e.target.classList.toggle("fa-reply");
				e.target.classList.toggle("rereplyCancelBtn");
				e.target.classList.toggle("fa-window-close");
						 			
				//2) 대댓글입력양식을 대댓글 대상 아래 추가하기 
				console.log(rnumTag);
				console.log(rnumTag.nextElementSibling);
				//rnumTag.nextElementSibling.innerHTML = rereply_str;					
				let row_1 = elt("textarea",{name:"rrcontent", class:"rrcontent lm-7", rows:"3"});
				let row_2 = elt("button",{class:"rreplyBtn"},"등록");							
				let rreplyForm = elt("div",{class:"row rreply"},row_1,row_2);
				 	
				row_2.addEventListener("click",function(){
					//대댓글 등록 처리하기
					doReply(data_rnum,row_1.value);
				},false);
				
				replyListTag.insertBefore(rreplyForm,rnumTag.nextElementSibling);
				replyListTag.getElementsByClassName("rrcontent")[0].placeholder
					= rnumTag.getElementsByClassName("rnickname")[0].textContent+"님께 답글쓰기";

			}else if(e.target.classList.contains('rereplyCancelBtn')){

				//1) 아이콘 토글
				console.log('댓글버튼 클릭됨'+data_rnum);
				e.target.classList.toggle("rereplyBtn");
				e.target.classList.toggle("fa-reply");

				e.target.classList.toggle("rereplyCancelBtn");
				e.target.classList.toggle("fa-window-close");					
				//2) 대댓글입력양식을 제거하기 
				replyListTag.removeChild(rnumTag.nextElementSibling);
			}
		},false);
	}
	
	//이벤트 트리거
	function doReplyModifyTrigger(i_pnode,i_findClass){
		Array.from(i_pnode.getElementsByClassName(i_findClass))
		 .forEach(item=>{item.click()});
	}
	
	//댓글 수정
	function doModify(i_rnum,i_rcontent){

		let xhttp = new XMLHttpRequest();
		xhttp.addEventListener("readystatechange",function(){
			if(this.readyState == 4 && this.status == 200){
					console.log(this.responseText);
				if(this.responseText == 'success'){
					replyList(l_page);
				}else{
					console.log('대댓글 수정 오류!!');
				}
			}
		});		
		let sendData = {};
		sendData.rnum = i_rnum; 						//수정할 댓글번호
		sendData.rcontent = i_rcontent;			//대댓글내용
		
		let result = JSON.stringify(sendData);
				
	  xhttp.open("PUT",l_url,true);
	  xhttp.setRequestHeader("Content-Type","application/json;charset=utf-8"); 
	  xhttp.send(result);			
	}
	//대댓글 등록
	function doReply(i_rnum,i_rcontent){

		let url = l_url+"/reply";
		let xhttp = new XMLHttpRequest();
		xhttp.addEventListener("readystatechange",function(){
			if(this.readyState == 4 && this.status == 200){
					console.log(this.responseText);
				if(this.responseText == 'success'){
					replyList(l_page);
				}else{
					console.log('대댓글 작성 오류!!');
				}
			}
		});		
		let sendData = {};
		sendData.bnum = l_bnum; 						//게시글 원글
		sendData.rid  = l_id;	 							//작성자
		sendData.rnickname = l_nickname;		//별칭
		sendData.rcontent = i_rcontent;			//대댓글내용
		sendData.prnum =	i_rnum;						//부모댓글 
		
		let result = JSON.stringify(sendData);
				
	  xhttp.open("POST",url,true);
	  xhttp.setRequestHeader("Content-Type","application/json;charset=utf-8"); 
	  xhttp.send(result);					
	}
	//댓글 삭제
	function doDelete(i_node, i_rnum){
		let url = l_url+"/"+i_rnum;
		let xhttp = new XMLHttpRequest();
		xhttp.addEventListener("readystatechange",function(){
			if(this.readyState == 4 && this.status == 200){
					console.log(this.responseText);
				if(this.responseText == 'success'){
					replyList(l_page);
				}else{
					console.log('삭제오류!!');
				}
			}
		});			

   xhttp.open("DELETE",url,true); 
   xhttp.send();				
	}
	//호감,비호감
	function doGoodOrBad(i_node, i_rnum, i_vote){
		let url = l_url+"/vote";
		let xhttp = new XMLHttpRequest();
		xhttp.addEventListener("readystatechange",function(){
			if(this.readyState == 4 && this.status == 200){
					console.log(this.responseText);
				if(this.responseText == 'success'){
					replyList(l_page);
				}else{
					console.log('호감,비호감 오류!!');
				}
			}
		});			
	 let sendData = {};
	 sendData.rnum = i_rnum; //댓글번호
	 sendData.bnum = l_bnum; //게시글 원글
	 sendData.rid  = l_id;	 //작성자
	 sendData.vote = i_vote; //호감,비호감	

	 let result = JSON.stringify(sendData);
	 		
   xhttp.open("PUT",url,true);
   xhttp.setRequestHeader("Content-Type","application/json;charset=utf-8"); 
   xhttp.send(result);				
	}

	/*-----------------------------------------------------------------------*
	 * 노드 생성 함수
	 * 주어진 이름(name)과 속성(attributes), 자식 노드를 포함하는 요소를 만들어서 반환하는 함수
	 *-----------------------------------------------------------------------*/
	function elt(name, attributes) {
		var node = document.createElement(name);
		if( attributes ) {
			for(var attr in attributes) {
				if(attributes.hasOwnProperty(attr)) {
					node.setAttribute(attr,attributes[attr]);
				}
			}
		}
		for(var i=2; i<arguments.length; i++) {
			var child = arguments[i];
			if( typeof child == "string" ) {
				child = document.createTextNode(child);
			}
			node.appendChild(child);
		}
		return node;
	}
			
	/* 특정 노드를 매개값으로 받아서 조상노드를 찾아서 배열에 저장하기 */
	function parents(node) {     
		let current = node,         
		list    = [];     
		while(	current.parentNode != null && 
						current.parentNode != document.documentElement) {
			//존재하는 부모노드를 배열에 추가       
			list.push(current.parentNode);
			//현재노드 갱신     
			current = current.parentNode;    
		}     
		return list;
	}
			
	//댓글목록 가져오기
	function replyList(reqPage){
		let url = l_url+"/"+l_page+"/"+l_bnum;
		
		console.log(url);
		//Ajax Call
		//1)
		let xhttp = new XMLHttpRequest();
		//2)
		xhttp.addEventListener("readystatechange",function(){
			if(this.readyState == 4 && this.status == 200){
				console.log(this.responseText);
				let jsObj = JSON.parse(this.responseText);
				let str = "";
				jsObj.list.forEach( e => {
/* 						console.log("rnum="+e.rnum);
					console.log("rid="+e.rid);
					console.log("rnickname="+e.rnickname); */

						str += '<div class="row pw-10 replyForm" data-rnum="'+e.rnum+'" >';
						if(e.rindent == 0){
							str += '  <div class="row pw-10">';
						}else{
							str += '  <div class="row pw-10 lm-7">';
						}																										
						str += '    <div class="col fw-7"><img src="<c:url value="/resources/img/rereIMG2.jpg" />" alt="사진" /></div>';
						str += '    <div class="col pw-10">';
						str += '      <div class="row header pw-10">';
						str += '        <div class="col fw-15"><b><small>'+e.rnickname+'('+e.rid+')'+'</small></b></div>';
						str += '        <div class="col fw-15 subInfo"><small><i>'+e.rcdate+'</i></small></div>';
						str += '        <div class="col"><span><i class="fas fa-reply rereplyBtn" title="댓글달기"></i></span></div>';
						str += '        <div class="col pw-10">';
						str += '          <div class="row">';
  						str += '            <div class="col"><span><i class="fas fa-edit replyModifyBtn" title="수정하기"></i></span></div>	';
						str += '            <div class="col"><span><i class="far fa-trash-alt replyDeleteBtn" title="삭제하기"></i></span></div>'; 
/* 						str += '            <div class="col subInfo"><span><small><i>수정</i></small></span></div>	';
						str += '            <div class="col subInfo"><span><small><i>삭제</i></small></span></div>';  */
						str += '          </div>';
						str += '        </div>';
						str += '      </div>';
						str += '      <div class="row body">';
						if(e.prnickname != null){
							str += '        <div class="col fw-5 subInfo"><small>'+e.prnickname+'</small></div>';
						}else{
							str += '        <div class="col fw-5" style="width:0px; position:absolute; left:15px;"><small></small></div>';
						}		
						str += '        <div class="col">'+e.rcontent+'</div>';
						str += '      </div>';
						str += '      <div class="row bottom">';		
						str += '        <div class="col fw-5"><span><i class="far fa-thumbs-up goodBtn" title="호감"></i></span>('+e.good+')</div>';   
						str += '        <div class="col fw-5"><span><i class="far fa-thumbs-down badBtn" title="비호감"></i></i></span>('+e.bad+')</div>';
						str += '      </div>';
						str += '    </div>';
						str += '  </div>';
						str += '</div>';					

						document.getElementById('replyList').innerHTML = str;

					});//jsObj.list.forEach 
					
					//페이지징
					//이전페이지 여부
					str = "";
					if(jsObj.pc.prev){
						str += '<a href="1">◀</a>';
					  str += '<a href="'+(jsObj.pc.startPage-1)+'">◁</a>';
					}
					//페이지 1~10
					for(let i=jsObj.pc.startPage, end=jsObj.pc.endPage; i<=end; i++){
						//현재 페이지와 요청페이지가 다르면
						if(jsObj.pc.rc.reqPage != i ){
							str += '<a href="'+i+'">'+i+'</a>';
						}else{
							str += '<a href="'+i+'" class="active">'+i+'</a>';
						}
					}

					//다음페이지 여부
					if(jsObj.pc.next){
				    str += '<a href="'+(jsObj.pc.endPage+1)+'">▷</a>';
				    str += '<a href="'+(jsObj.pc.finalEndPage)+'">▶</a>';
					}		
					document.getElementById('paging').innerHTML = str;		
				}
		  },false);
			//3)
			xhttp.open("GET",url,true);
			xhttp.send();
		}
	</script>
</head>
<body>
	<div id="replyArea">
	  <!-- 댓글 달기 -->
	  <div id="reply">
	    <div class="row">
	      <textarea name="rcontent" id="rcontent" rows="3"></textarea>
	      <button id="replyBtn2">등록</button>
	    </div>
	  </div>
	  
	  <!-- 댓글 목록-->
	  <div id="replyList"></div>
	  
	  <!--페이징-->
	  <div id="paging"></div>
  </div>
<!-- 	<div id="replyArea">
		댓글 달기
		<div id="reply">
			<div class="row">
				<textarea name="rcontent" id="rcontent" rows="3"></textarea>
				<button id="replyBtn2">등록</button>
			</div>
		</div>

		댓글 목록
		<div id="replyList">
			원글의 댓글 양식
			<div class="row pw-10">
				<div class="row pw-10">
					<div class="col fw-7">
						<img src="" alt="사진" />
					</div>
					<div class="col pw-10">
						<div class="row header pw-10">
							<div class="col fw-10">댓글작성자</div>
							<div class="col fw-10">
								<small><i>댓글작성일시</i></small>
							</div>
							<div class="col fw-5">
								<span><a href="#" class="rereplyBtn" data-rnum="">댓글버튼</a></span>
							</div>
							<div class="col pw-10">
								<div class="row">
									<div class="col fw-5">
										<span><a href="#" class="replyModifyBtn" data-rnum="">수정버튼</a></span>
									</div>
									<div class="col fw-5">
										<span><a href="#" class="replyDeleteBtn" data-rnum="">삭제버튼</a></span>
									</div>
								</div>
							</div>
						</div>
						<div class="row body">
							<div class="col fw-5">부모댓글작성자</div>
							<div class="col">댓글내용</div>
						</div>
						<div class="row bottom">
							<div class="col fw-10">
								<span><a href="#" class="goodBtn" data-rnum="">선호</a></span>(3)
							</div>
							<div class="col fw-10">
								<span><a href="#" class="badBtn" data-rnum="">비선호</a></span>(1)
							</div>
						</div>
					</div>
				</div>
			</div>
			대댓글 양식
			<div class="row pw-10" data-rnum="">
				<div class="row pw-10 lm-7">
					<div class="col fw-7">
						<img src="" alt="사진" />
					</div>
					<div class="col pw-10">
						<div class="row header pw-10">
							<div class="col fw-10">댓글작성자</div>
							<div class="col fw-10">
								<small><i>댓글작성일시</i></small>
							</div>
							<div class="col fw-5">
								<span><a href="#" class="rereplyBtn" data-rnum="">댓글버튼</a></span>
							</div>
							<div class="col pw-10">
								<div class="row">
									<div class="col fw-5">
										<span><a href="#" class="replyModifyBtn" data-rnum="">수정버튼</a></span>
									</div>
									<div class="col fw-5">
										<span><a href="#" class="replyDeleteBtn" data-rnum="">삭제버튼</a></span>
									</div>
								</div>
							</div>
						</div>
						<div class="row body">
							<div class="col fw-5">부모댓글작성자</div>
							<div class="col">댓글내용</div>
						</div>
						<div class="row bottom">
							<div class="col fw-10">
								<span><a href="#" class="goodBtn" data-rnum="">선호</a></span>(3)
							</div>
							<div class="col fw-10">
								<span><a href="#" class="badBtn" data-rnum="">비선호</a></span>(1)
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		페이징
		<div id="paging">
	    <a href="#">첫페이지</a>
	    <a href="#">이전페이지</a>
	    <a href="#">1</a>
	    <a href="#">2</a>
	    <a href="#">3</a>
	    <a href="#">4</a>
	    <a href="#">5</a>
	    <a href="#">6</a>
	    <a href="#">7</a>
	    <a href="#">8</a>
	    <a href="#">9</a>
	    <a href="#">10</a>
	    <a href="#">다음페이지</a>
	    <a href="#">끝페이지</a>
  	</div>
	</div> -->
</body>
</html>