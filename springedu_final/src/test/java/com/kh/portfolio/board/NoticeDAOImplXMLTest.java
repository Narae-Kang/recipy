package com.kh.portfolio.board;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.portfolio.board.dao.BoardDAO;
import com.kh.portfolio.board.dao.NoticeDAO;
import com.kh.portfolio.board.vo.BoardVO;
import com.kh.portfolio.board.vo.NoticeVO;
import com.kh.portfolio.common.RecordCriteria;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class NoticeDAOImplXMLTest {
	private final static Logger logger
	= LoggerFactory.getLogger(NoticeDAOImplXMLTest.class);
	
	@Inject
	NoticeDAO noticeDAO;
	
	@Test
//	@Disabled
	void noticeWrite() {
		NoticeVO noticeVO = new NoticeVO();
		
//		noticeVO.setNtitle("영업 시간이 변경되었습니다.");
//		noticeVO.setNid("test@test.com");
//		noticeVO.setNnickname("관리자");
//		noticeVO.setNcontent("오픈시간이 10시에서 11시로 변경되었습니다.");
		
//		noticeVO.setNtitle("크리스마스 예약 안내");
//		noticeVO.setNid("test@test.com");
//		noticeVO.setNnickname("관리자");
//		noticeVO.setNcontent("크리스마스 이브와 당일 예약 받습니다.");
		
//		noticeVO.setNtitle("SNS 이벤트 당첨자 발표!");
//		noticeVO.setNid("test@test.com");
//		noticeVO.setNnickname("관리자");
//		noticeVO.setNcontent("당첨자는 강동원님 입니다. 당첨을 축하드립니다!");
		
//		noticeVO.setNtitle("발렌타인 이벤트 취소 안내");
//		noticeVO.setNid("test@test.com");
//		noticeVO.setNnickname("관리자");
//		noticeVO.setNcontent("코로나 바이러스로 금주 예정 되어 있던 발렌타인 이벤트는 취소합니다.");
		
//		noticeVO.setNtitle("코로나 바이러스 조심하세요.");
//		noticeVO.setNid("test@test.com");
//		noticeVO.setNnickname("관리자");
//		noticeVO.setNcontent("마스크 착용과 손씻기를 생활화 합시다.");
		
//		noticeVO.setNtitle("바이러스로 인하여 매장이 임시 휴무에 들어갑니다.");
//		noticeVO.setNid("test@test.com");
//		noticeVO.setNnickname("관리자");
//		noticeVO.setNcontent("오픈 일자는 추후 공개합니다..");
		
//		noticeVO.setNtitle("매장 오픈 일시 안내(예정)");
//		noticeVO.setNid("test@test.com");
//		noticeVO.setNnickname("관리자");
//		noticeVO.setNcontent("3월 9일 오픈 예정입니다.");
		
		noticeVO.setNtitle("도쿄 올림픽 취소 기원제11111");
		noticeVO.setNid("test@test.com");
		noticeVO.setNnickname("관리자");
		noticeVO.setNcontent("망해라 일본");
			
		int cnt = noticeDAO.noticeWrite(noticeVO);
		assertEquals(1, cnt);
	}
	
	
	
	//공지 목록
	@Test
	@Disabled
	void noticeList() {
		List<NoticeVO> list = noticeDAO.noticeList();
		assertNotNull(list);
		logger.info(list.toString());
	}

	
}













