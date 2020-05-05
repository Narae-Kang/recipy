package com.kh.portfolio.board.svc;

import java.util.List;
import java.util.Map;

import com.kh.portfolio.board.vo.BoardCategoryVO;
import com.kh.portfolio.board.vo.BoardFileVO;
import com.kh.portfolio.board.vo.BoardVO;
import com.kh.portfolio.board.vo.NoticeVO;
import com.kh.portfolio.common.PageCriteria;

public interface NoticeSVC {
	
	//게시글작성
	int noticeWrite(NoticeVO notictVO);

	//게시글수정
	int noticeModify(NoticeVO notictVO);

	//게시글삭제
	int noticeDelete(String nnum);
	
	//게시글보기
	Map<String,Object> noticeView(String nnum);

	List<NoticeVO> noticeMain();
	//게시글목록
	//1)전체
	List<NoticeVO> noticeList();
	//2)검색어 없는 게시글페이징
	List<NoticeVO> noticeList( int startRec, int endRec);	
	//3)검색어 있는 게시글검색(요청페이지, 검색유형, 검색어)
	List<NoticeVO> noticeList( String reqPage, String searchType,String keyword);
	
	//페이지 제어
	PageCriteria noticeGetPageCriteria(String reqPage, String searchType,String keyword);

	PageCriteria mainGetPageCriteria(String reqPage, String searchType, String keyword);

}
















