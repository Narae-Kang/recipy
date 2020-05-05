<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jsp 지시자?? -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  태그 라이브러리?? -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>댓글</title>

<%-- <link rel="stylesheet" href="<c:url value="/resources/css/rereply.css"/>"> --%>
<script src="<c:url value="/resources/js/common.js"/>"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />
<!-- 아이콘 가져오기 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-1/css/all.min.css" />

  <!-- 글자 링크 -->
  <link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
  <!--한글+영어(굵고 동글동글한 체) : font-family: 'Jua', sans-serif; -->
  <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap&subset=korean" rel="stylesheet">
  <!-- 한글+영어(단정 꽉차있는체) : font-family: 'Do Hyeon', sans-serif; -->
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding:400,700&display=swap&subset=korean" rel="stylesheet">
  <!-- 한글+영어(단정) : font-family: 'Nanum Gothic Coding', monospace; -->
  <link href="https://fonts.googleapis.com/css?family=Gaegu&display=swap&subset=korean" rel="stylesheet">
	<!-- font-family: 'Gaegu', cursive; -->
	<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap&subset=korean" rel="stylesheet">
	<!-- font-family: 'Noto Serif KR', serif; -->
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400&display=swap" rel="stylesheet">
	<!-- font-family: 'Noto Sans KR', sans-serif; -->

<style>

a { text-decoration: none; }
.item a {
	color: gray;
	font-size: 13px;
}
#replyContainerAll {
	display: flex;
	justify-content: center;
	background-color: #EEEDED;
	margin-top: 10px;
	font-family: 'Noto Sans KR', sans-serif;
}	
#replyContainer {width: 700px; padding: 10px;}	
/*----------------------------------댓글작성*/
#reply{
  margin-top:20px; width:100%;
}
#reply .writeReply{ display:flex; padding-bottom: 10px;}       
#reply #rcontent { width:100%; }
#reply #replyBtn{ width: 80px; }


.replyContentBox, .vote {padding: 3px 0;}
.replyForm {
	border-bottom: 1px gray dotted;
	padding-bottom: 7px; margin-bottom: 7px;
} 
/*----------------------------------댓글보기*/
/*작성자 정보*/
.writerInfo .writerName{
	font-weight: bold;
}
.writerImg {
	width: 36px; height: 36px;
	float: left;
	margin-right: 4px; /*사진과 작성자 사이 공간*/
}
.writerImg img {
	width: 100%; height: 100%;
	border-radius: 18px;
}
.replyListBtn {
	float: right;
}
/*본문 + 호불호*/
.replyContentBox {
	width: 100%; height: auto; 
	padding-left: 40px;
	display: flex;
}
.replyPar { padding-right: 10px; color: gray; 	font-weight: 300;}
.replyPar, .replyContent {display:block;}
.vote {padding-left: 40px; border-bottom: 1px gray dotted‎;}
.vote i { padding-right: 5px;}
.vote .good {display: inline-block; padding-right: 10px;}
.vote .bad {display: inline-block; }

/*----------------------------------대댓글보기*/
.rereplyForm {
	padding-left: 40px;
	padding: 5px 0 0 35px;
}



/*----------------------------------전체페이지 부분*/
#pageContainer { 
	width:100%; 
	height: 50px; 
	padding-top: 30px; }
#pageWrapper {
  display: flex;
  justify-content: center;
}
.num { width: 20px; margin: 0 3px; }
.numText { margin: 0 5px; }





/* .reply .row:nth-child(1) textarea{ 
	width:100%;
}
.reply .row:nth-child(2) { 
	display:flex;
	justify-content:flex-end;
}	
.replyList .row div:nth-child(2){
	display:flex;
}
.replyList .row div:nth-child(2){
	display:flex;
} */
</style>

<script>
window.addEventListener("load",init2,false);
let l_bnum = 111;		//게시 원글번호
//let l_bnum = ${boardVO.bnum }
let l_page = 1;				//요청페이지
let l_id = "${sessionScope.member.id}";	//로그인 아이디
let l_nickname = "${sessionScope.member.nickname}";	//로그인 별칭
let l_url = "${pageContext.request.contextPath}/rboard"; //공통 URL

const GOOD = '1', BAD = '2'; //호감'1', 비호감'2'

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
	reBtn.addEventListener("click",function(){
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

	//댓글목록 이벤트 등록
	document.getElementById("replyList").addEventListener("click",function(e){
		//댓글목록에서 'I'태그의 자식 태그에서만 반응하기
		if(e.target.tagName != 'I') return false;
		//이벤트가 일어난 지점에서 data-rnum속성을 포함한 요소를 찾아서 data-rnum값을 추출한다.
		let data_rnum =	parents(e.target)
										.find( tag => {	if(tag.hasAttribute("data-rnum")){
																			return tag;
																	}})
										.getAttribute("data-rnum");
		
		if(e.target.classList.contains('replyDeleteBtn')){
			//console.log('삭제버튼 클릭됨'+data_rnum);
			doDelete(e.target, data_rnum);
		}else if(e.target.classList.contains('replyModifyBtn')){
			console.log('수정버튼 클릭됨'+data_rnum);
		}else if(e.target.classList.contains('goodBtn')){
			//console.log('호감버튼 클릭됨'+data_rnum);
			doGoodOrBad(e.target, data_rnum, GOOD);
		}else if(e.target.classList.contains('badBtn')){
			//console.log('비호감버튼 클릭됨'+data_rnum);
			doGoodOrBad(e.target, data_rnum, BAD);
		}else if(e.target.classList.contains('rereplyBtn')){
			console.log('댓글버튼 클릭됨'+data_rnum);
		}
	},false);
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
	
//	console.log(url);
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


				if(e.rindent == 0){
					str +=	'<div class="replyForm" data-rnum="'+e.rnum+'" >';
				}else{
					str +=	'<div class="replyForm rereplyForm" data-rnum="'+e.rnum+'" >';
				}
				str +=	'	<div class="row" data-rnum="">';
				str +=	'		<div class="writerInfo">';
				str +=	'			<div class="item writerImg">';
				str +=	'				<img src="" alt="IMG" />';
				str +=	'			</div>';
				str +=	'			<span class="item"><b>'+e.rnickname+'('+e.rid+')'+'</b></span> ';
				str +=	'			<span class="item"><small><i>'+e.rcdate+'</i></small></span> ';
				str +=	'			<span class="item"><i class="fas fa-reply rereplyBtn" title="댓글달기"></i></span> ';
/* 				str +=	'			<span class="item">취소</span>'; */
				str +=	'			<div class="replyListBtn">';
				str +=	'				<span><span><i class="fas fa-edit replyModifyBtn" title="수정하기"></i></span>';
				str +=	'				<span><i class="far fa-trash-alt replyDeleteBtn" title="삭제하기"></i></span>';
				str +=	'			</div>';
				str +=	'		</div>';
				str +=	'		<div class="item replyContentBox">';
				str +=	'			<div class="replyPar">부모작성자</div>';
				str +=	'			<div class="replyContent">'+e.rcontent+'</div>';
				str +=	'		</div>';
				str +=	'		<div class="vote">';
				str +=	'			<div class="good">';
				str +=	'				<i class="far fa-thumbs-up goodBtn title="선호"></i><span>('+e.good+')</span>';
				str +=	'			</div>';
				str +=	'			<div class="bad">';
				str +=	'				<i class="far fa-thumbs-down badBtn title="비선호"></i><span>('+e.bad+')</span>';
				str +=	'			</div>';
				str +=	'		</div>';
				str +=	'	</div>';
				str +=	'</div>';					


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
	<div id="replyContainerAll">
		<div id="replyContainer">
		
			<!-- 댓글 작성 -->
		  <div id="reply">
		    <div class="writeReply">
		      <textarea name="rcontent" id="rcontent" rows="3"></textarea>
		      <button id="reBtn">등록</button>
		    </div>
		  </div>
<!-- 			<table class="reply">
				<tr>
					<td class="col-1">
						<div class="replyText">
							<textarea name="rcontent" id="rcontent" rows="3"></textarea>
						</div>
					</td>
					<td class="col-2">
						<div class="replyBtn">
							<button id="replyBtn">등록</button>
						</div>
					</td>
				</tr>
			</table> -->

 			<!-- 댓글리스트 -->
 			<div id="replyList">	
 			
				<div class="replyForm">
					<div class="row" data-rnum="">
						<div class="writerInfo">
							<div class="item writerImg">
								<img src="<c:url value="/resources/img/bbb.jpg"/>" alt="댓글사진" />
							</div>
							<span class="item">댓글작성자</span> 
							<span class="item">댓글작성일시</span> 
							<span class="item"><a href="">댓글</a></span> 
							<span class="item"><a href="">취소</a></span>
							<div class="replyListBtn">
								<button>수정</button>
								<button>삭제</button>
							</div>
						</div>
						<div class="item replyContentBox">
							<div class="replyPar">부모작성자</div>
							<div class="replyContent">댓글내용</div>
						</div>
						<div class="vote">
							<div class="good">
								<a href="#" class="goodBtn" data-rnum=""><i class="far fa-thumbs-up" ></i></a><span>(1)</span>
							</div>
							<div class="bad">
								<a href="#" class="badBtn" data-rnum=""><i class="far fa-thumbs-down"></i></a><span>(2)</span>
							</div>
						</div>
					</div>
				</div> 
	
				<!-- 대댓글 -->
				<div class="replyForm rereplyForm">
					<div class="row" data-rnum="">
						<div class="writerInfo">
							<div class="item writerImg">
								<img src="<c:url value="/resources/img/bbb.jpg"/>" alt="댓글사진" />
							</div>
							<span class="item">댓글작성자</span> 
							<span class="item">댓글작성일시</span> 
							<span class="item"><a href="">댓글</a></span> 
							<span class="item"><a href="">취소</a></span>
							<div class="replyListBtn">
								<button>수정</button>
								<button>삭제</button>
							</div>
						</div>
						<div class="item replyContentBox">
							<div class="replyPar">부모작성자</div>
							<div class="replyContent">댓글내용</div>
						</div>
						<div class="vote">
							<div class="good">
								<a href="#" class="goodBtn" data-rnum=""><i class="far fa-thumbs-up"></i></a><span>(1)</span>
							</div>
							<div class="bad">
								<a href="#" class="badBtn" data-rnum=""><i class="far fa-thumbs-down"></i></a><span>(2)</span>
							</div>
						</div>
					</div>
				</div> 
				
			</div><!-- replyList 끝 -->

		  <!--페이징-->
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

			</div>	<!-- container 끝 -->
		</div>	<!-- containerAll 끝 -->

</body>
</html>


















