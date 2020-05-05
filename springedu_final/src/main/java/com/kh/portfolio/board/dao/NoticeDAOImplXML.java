package com.kh.portfolio.board.dao;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kh.portfolio.board.vo.BoardCategoryVO;
import com.kh.portfolio.board.vo.BoardFileVO;
import com.kh.portfolio.board.vo.BoardVO;
import com.kh.portfolio.board.vo.NoticeVO;

@Repository
public class NoticeDAOImplXML implements NoticeDAO {
	
	private static final Logger logger 
	= LoggerFactory.getLogger(NoticeDAOImplXML.class);
	
	@Inject
	SqlSessionTemplate sqlSession;

	//게시글작성
	@Override
	public int noticeWrite(NoticeVO noticeVO) {
		return sqlSession.insert("mappers.NoticeDAO-mapper.noticeWrite", noticeVO);
	}

	//게시글수정
	@Override
	public int noticeModify(NoticeVO noticeVO) {
		return sqlSession.update("mappers.NoticeDAO-mapper.noticeModify", noticeVO);
	}

	//게시글삭제
	@Override
	public int noticeDelete(String nnum) {

		return sqlSession.delete("mappers.NoticeDAO-mapper.noticeDelete", Long.valueOf(nnum));
	}
	
	//게시글보기
	@Override
	public NoticeVO noticeView(String nnum) {
		return sqlSession.selectOne("mappers.NoticeDAO-mapper.noticeView", Long.valueOf(nnum));
	}
	
	@Override
	public int noticeUpdateHit(String nnum) {
		return sqlSession.update("mappers.NoticeDAO-mapper.noticeUpdateHit", Long.valueOf(nnum));
	}	
	
	@Override
	public List<NoticeVO> noticeMain() {
		return sqlSession.selectList("mappers.NoticeDAO-mapper.noticeMain");
	}
	//게시글목록
	//1)전체
	@Override
	public List<NoticeVO> noticeList() {
		return sqlSession.selectList("mappers.NoticeDAO-mapper.noticeList");
	}
	//2)검색어 없는 게시글페이징
	@Override
	public List<NoticeVO> noticeList( int startRec, int endRec) {
		Map<String,Object> map = new HashMap<>();
		map.put("startRec", startRec);
		map.put("endRec", endRec);
		return sqlSession.selectList("mappers.NoticeDAO-mapper.noticeList2", map);
	}
	//3)검색어 있는 게시글검색(전체,제목,내용,작성자ID,별칭)
	@Override
	public List<NoticeVO> noticeList(int startRec, int endRec, String searchType, String keyword) {
		Map<String,Object> map = new HashMap<>();
		map.put("startRec", startRec);
		map.put("endRec", endRec);
		map.put("searchType",searchType);
		if(keyword != null) {
			map.put("noticeList",Arrays.asList(keyword.split("\\s+")));
		}
		return sqlSession.selectList("mappers.NoticeDAO-mapper.noticeList3", map);
	}
	
	//총 레코드수
	@Override
	public int noticeTotalRecordCount(String searchType, String keyword) {
		logger.info("keyword :" + keyword);
		Map<String,Object> map = new HashMap<>();
		map.put("searchType",searchType);
		
		if(keyword != null) {
			map.put("noticeList",Arrays.asList(keyword.split("\\s+")));
		}
		logger.info("keyword2 :" + map.get("noticeList"));
		return sqlSession.selectOne("mappers.NoticeDAO-mapper.noticeTotalRecordCount",map);
	}



}



