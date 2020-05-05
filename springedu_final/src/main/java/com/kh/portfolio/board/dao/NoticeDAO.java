package com.kh.portfolio.board.dao;

import java.util.List;

import com.kh.portfolio.board.vo.BoardCategoryVO;
import com.kh.portfolio.board.vo.BoardFileVO;
import com.kh.portfolio.board.vo.BoardVO;
import com.kh.portfolio.board.vo.NoticeVO;

import lombok.Data;

public interface NoticeDAO {

	//게시글작성
	int noticeWrite(NoticeVO noticeVO);
	//게시글수정
	int noticeModify(NoticeVO noticeVO);

	//게시글삭제
	int noticeDelete(String nnum);
	
	//게시글보기
	NoticeVO noticeView(String nnum);
	//조회수 +1 증가
	int noticeUpdateHit(String nnum);
	
	List<NoticeVO> noticeMain();
	//게시글목록
	//1)전체
	List<NoticeVO> noticeList();
	//2)검색어 없는 게시글페이징
	List<NoticeVO> noticeList( int startRec, int endRec);	
	//3)검색어 있는 게시글검색(전체,제목,내용,작성자ID,별칭)
	List<NoticeVO> noticeList( int startRec, int endRec, String searchType,String keyword);
	//총 레코드수
	int noticeTotalRecordCount(String searchType,String keyword);	

//	//게시글답글작성
//	int noticeReply(NoticeVO noticeVO);
	
}
