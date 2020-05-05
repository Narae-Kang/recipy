window.addEventListener("load", init, false);
function init() {
	// 등록버튼 클릭시
	writeBtn.addEventListener("click", function(e) {
		e.preventDefault();
		// 유효성 체크

		// 게시글 작성 전송
		document.getElementById("boardVO").submit();

	}, false);
	// 취소 버튼 클릭시
	cancleBtn.addEventListener("click", function(e) {
		e.preventDefault();
		document.getElementById("boardVO").reset();
	}, false);
	// 목록버튼 클릭시
	listBtn.addEventListener("click", function(e) {
		e.preventDefault();
		location.href = getContextPath() + "/board/list";
	}, false);
}