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
public class MemberDAOImplXMLTest {
	private final static Logger logger
		= LoggerFactory.getLogger(MemberDAOImplXMLTest.class);
	
	@Inject 
	@Qualifier("memberDAOImplXML")
	MemberDAO memberDAO;
	
	@Test
	@DisplayName("회원등록")
	@Disabled 
	void joinMember() {
		MemberVO memberVO = new MemberVO();
		
		memberVO.setId("test10@test.com");
		memberVO.setPw("1q2w3e4r");
		memberVO.setTel("010-1010-1010");
		memberVO.setNickname("세일러문");
//		memberVO.setGender("여");
//		memberVO.setRegion("서울");
		memberVO.setBirth(new java.sql.Date(2000,10,10));
		int cnt = memberDAO.joinMember(memberVO);
		assertEquals(1, cnt);
		
	}
	
	@Test
	@DisplayName("회원수정")
	@Disabled
	void modifyMember() {
		MemberVO memberVO = new MemberVO();
		memberVO.setId("test6@test.com");
		memberVO.setTel("010-1111-1111");
		memberVO.setNickname("아이린");
//		memberVO.setGender("여");
//		memberVO.setRegion("서울");
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
		int cnt = memberDAO.outMember("test6@test.com", "1q2w3e4r");
		assertEquals(1,cnt);
	}
	
	@Test
	@DisplayName("로그인")
	@Disabled
	void loginMember() {
		MemberVO memberVO = memberDAO.loginMember("test12@naver.com", "1q2w3e4r");
		assertEquals("test12@naver.com", memberVO.getId());
		logger.info(memberVO.toString());
	}
	
	@Test
	@DisplayName("아이디찾기")
	@Disabled
	void findID() {
		String id = memberDAO.findID("010-4753-0874", new java.sql.Date(2000,01,01));
		assertEquals("admin2@test.com", id);
	}
	
	@Test
	@DisplayName("비밀번호 변경")
	@Disabled
	void changePW() {
		int cnt = memberDAO.changePW("test5@test.com", "1q2w3e4r");
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


















