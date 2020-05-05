package com.kh.portfolio.member.dao;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.inject.Inject;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.portfolio.member.dao.MemberDAO;
import com.kh.portfolio.member.vo.MemberVO;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class MemberDAOImplJDBCTest {
	private final static Logger logger
		= LoggerFactory.getLogger(MemberDAOImplJDBCTest.class);
	
	@Inject 
	@Qualifier("memberDAOImplJDBC")
	MemberDAO memberDAO;
	
	@Test
//	@Disabled
	@DisplayName("회원등록")
	void joinMember() {
			MemberVO memberVO = new MemberVO();
			for (int i=1; i<10; i++) {
			memberVO.setId("test"+i+"@test.com");
			memberVO.setPw("1q2w3e4r");
			memberVO.setTel("010-"+i+i+i+i+"-"+i+i+i+i);
			memberVO.setNickname("테스트"+i);
//			memberVO.setGender("여");
//			memberVO.setRegion("울산");
			memberVO.setBirth(new java.sql.Date(2000,0+i,0+i));
			int cnt = memberDAO.joinMember(memberVO);
			assertEquals(1, cnt);	
			}
//		memberVO.setId("test@test.com");
//		memberVO.setPw("1q2w3e4r");
//		memberVO.setTel("010-0000-0000");
//		memberVO.setNickname("테스트0");
//		memberVO.setGender("여");
//		memberVO.setRegion("울산");
//		memberVO.setBirth(new java.sql.Date(2000,02,01));
//		int cnt = memberDAO.joinMember(memberVO);
//		assertEquals(1, cnt);	
	}
	
	@Test
	@DisplayName("회원수정")
	@Disabled
	void modifyMember() {
		MemberVO memberVO = new MemberVO();
		memberVO.setId("test12@naver.com");
		memberVO.setTel("010-1111-1111");
		memberVO.setNickname("아이스핫초코");
//		memberVO.setGender("여");
//		memberVO.setRegion("부산");
		memberVO.setBirth(new java.sql.Date(1988,03,01));

		int cnt = memberDAO.modifyMember(memberVO);
		assertEquals(1, cnt);
	}
	
	@Test
	@DisplayName("회원개별조회")
	@Disabled
	void selectMember() {
		MemberVO memberVO = memberDAO.selectMember("admin@test.com");
		assertEquals("admin@test.com", memberVO.getId());
		logger.info(memberVO.toString());
	}
	
	@Test
	@DisplayName("회원탈퇴")
	@Disabled
	void outMember() {
		int cnt = memberDAO.outMember("test112@naver.com", "admin1234");
		assertEquals(1,cnt);
	}
	
	@Test
	@DisplayName("로그인")
	@Disabled
	void loginMember() {
		MemberVO memberVO = memberDAO.loginMember("admin@test.com", "1q2w3e4r");
		assertEquals("admin@test.com", memberVO.getId());
		logger.info(memberVO.toString());
	}
	
	@Test
	@DisplayName("비밀번호 변경")
	@Disabled
	void changePW() {
		int cnt = memberDAO.changePW("test12@naver.com", "1q2w3e4r");
		assertEquals(1, cnt);
	}
	
	@Test
	@DisplayName("비밀번호 변경 대상 찾기")
	@Disabled
	void findPW() {
		MemberVO memberVO = new MemberVO();
		memberVO.setId("admin@test.com");
		memberVO.setTel("010-4753-0874");
		memberVO.setBirth(java.sql.Date.valueOf("1988-05-19"));
		
		int cnt = memberDAO.findPW(memberVO);
		assertEquals(1, cnt);
	}
	
	
	
}


















