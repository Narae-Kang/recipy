package com.kh.portfolio.board.svc;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.portfolio.board.dao.BoardDAO;
import com.kh.portfolio.board.dao.NoticeDAO;
import com.kh.portfolio.board.vo.BoardCategoryVO;
import com.kh.portfolio.board.vo.BoardFileVO;
import com.kh.portfolio.board.vo.BoardVO;
import com.kh.portfolio.board.vo.NoticeVO;
import com.kh.portfolio.common.FindCriteria;
import com.kh.portfolio.common.PageCriteria;
import com.kh.portfolio.common.RecordCriteria;

@Service
public class NoticeSVCImpl implements NoticeSVC {
	
	public static final Logger logger 
		= LoggerFactory.getLogger(NoticeSVCImpl.class);
	
	@Inject
	NoticeDAO noticeDAO;

	//게시글작성
	@Transactional
	@Override
	public int noticeWrite(NoticeVO noticeVO) {
		//1) 게시글 작성
		int cnt = noticeDAO.noticeWrite(noticeVO);

		//2) bnum 가져오기 => mybatis: selectkey 사용
		
		//3) 첨부파일 있는경우
//		logger.info("첨부갯수:"+boardVO.getFiles().size());
//		if(boardVO.getFiles() != null && boardVO.getFiles().size() > 0) {
//			fileWrite(boardVO.getFiles(),boardVO.getBnum());
//		}
		return cnt;
	}

	//게시글수정
	@Transactional
	@Override
	public int noticeModify(NoticeVO noticeVO) {
		//1) 게시글 수정
		int cnt = noticeDAO.noticeModify(noticeVO);
		//2) 첨부파일 추가
//		if(boardVO.getFiles() != null && boardVO.getFiles().size() > 0) {
//			fileWrite(boardVO.getFiles(),boardVO.getBnum());
//		}
		return cnt;
	}
	//게시글삭제
	@Transactional
	@Override
	public int noticeDelete(String nnum) {
		int cnt = 0;
		cnt = noticeDAO.noticeDelete(nnum);
		return cnt;
	}
	
	//게시글보기
	@Transactional
	@Override
	public Map<String,Object> noticeView(String nnum) {
		//1) 게시글 가져오기
		NoticeVO noticeVO = noticeDAO.noticeView(nnum);
		//2) 첨부파일 가져오기
//		List<BoardFileVO> files = boardDAO.fileViews(bnum);
		//3) 조회수 +1증가
		noticeDAO.noticeUpdateHit(nnum);
		
		Map<String,Object> map = new HashMap<>();
		map.put("notice", noticeVO);
//		if(files != null && files.size() > 0) {
//			map.put("files", files);
//		}
		return map;
	}
	@Override
	public List<NoticeVO> noticeMain() {
		return noticeDAO.noticeList();
	}
	//게시글목록
	//1)전체
	@Override
	public List<NoticeVO> noticeList() {
		return noticeDAO.noticeList();
	}
	//2)검색어 없는 게시글페이징
	@Override
	public List<NoticeVO> noticeList(int startRec, int endRec) {
		// TODO Auto-generated method stub
		return null;
	}
	//3)검색어 있는 게시글검색(요청페이지,검색유형,검색어)
	@Override
	public List<NoticeVO> noticeList(String reqPage, String searchType, String keyword) {	
		 
		int l_reqPage = 0;
		
		//요청 페이지 정보가 없으면 1로 초기화
		if(reqPage == null || reqPage.trim().isEmpty()) {
			l_reqPage =  1;
		}else {
			l_reqPage = Integer.parseInt(reqPage);
		}
		
		RecordCriteria recordCriteria = new RecordCriteria(l_reqPage);
		
		return noticeDAO.noticeList(
				recordCriteria.getStartRec(), 
				recordCriteria.getEndRec(), 
				searchType, keyword);
	}
	
	//페이지 제어
	@Override
	public PageCriteria noticeGetPageCriteria(String reqPage, String searchType, String keyword) {
		
		PageCriteria 		pc = null;					//한페이지에 보여줄 페이징 계산하는 클래스
		FindCriteria 		fc = null;					//PageCriteira + 검색타입, 검색어		
		
		int totalRec = 0;										//전체레코드 수
		
		int l_reqPage = 0;
		
		//요청 페이지 정보가 없으면 1로 초기화
		if(reqPage == null || reqPage.trim().isEmpty()) {
			l_reqPage =  1;
		}else {
			l_reqPage = Integer.parseInt(reqPage);
		}
			
		totalRec = noticeDAO.noticeTotalRecordCount(searchType,keyword);
		
		fc = new FindCriteria(l_reqPage, searchType, keyword);
		pc = new PageCriteria(fc, totalRec);
		logger.info("totalRec:"+totalRec, searchType, keyword);
		logger.info("fc:"+fc.toString());
		logger.info("rc:"+((RecordCriteria)fc).toString());
		logger.info("pc:"+pc.toString());
		return pc;
	}
	//페이지 제어
	@Override
	public PageCriteria mainGetPageCriteria(String reqPage, String searchType, String keyword) {
		
		PageCriteria 		pc = null;					//한페이지에 보여줄 페이징 계산하는 클래스
		FindCriteria 		fc = null;					//PageCriteira + 검색타입, 검색어		
		
		int totalRec = 0;										//전체레코드 수
		
		int l_reqPage = 0;

		//요청 페이지 정보가 없으면 1로 초기화
		if(reqPage == null || reqPage.trim().isEmpty()) {
			l_reqPage =  1;
		}else {
			l_reqPage = Integer.parseInt(reqPage);
		}
			
		totalRec = noticeDAO.noticeTotalRecordCount(searchType,keyword);
		
		fc = new FindCriteria(l_reqPage, searchType, keyword);
		pc = new PageCriteria(fc, totalRec);
		logger.info("totalRec:"+totalRec, searchType, keyword);
		logger.info("fc:"+fc.toString());
		logger.info("rc:"+((RecordCriteria)fc).toString());
		logger.info("pc:"+pc.toString());
		return pc;
	}


}




