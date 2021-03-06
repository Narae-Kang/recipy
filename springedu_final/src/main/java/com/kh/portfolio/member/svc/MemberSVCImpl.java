package com.kh.portfolio.member.svc;

import java.sql.Date;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kh.portfolio.member.dao.MemberDAO;
import com.kh.portfolio.member.dao.MemberDAOImplXML;
import com.kh.portfolio.member.vo.MemberVO;

@Service
public class MemberSVCImpl implements MemberSVC {
	
//-----------------------------------------------공통으로 사용하는 것	
//서비스에서는 dao를 사용함??
	@Inject
@Qualifier("memberDAOImplXML")
MemberDAO memberDAO;

private static final Logger logger
= LoggerFactory.getLogger(MemberDAOImplXML.class);
//-----------------------------------------------공통으로 사용하는 것	
	
//-----------------------------------------------회원등록
	@Override
	public int joinMember(MemberVO memberVO) {
		logger.info("MemberSVCImpl.joinMember(MemberVO memberVO) 호출됨!!");
		return memberDAO.joinMember(memberVO);
	}

//-----------------------------------------------회원 수정
	@Override
	public int modifyMember(MemberVO memberVO) {
		logger.info("MemberSVCImpl.modifyMember(MemberVO memberVO) 호출됨!!");
		return memberDAO.modifyMember(memberVO);
	}

//-----------------------------------------------회원 전체 조회
	@Override
	public List<MemberVO> selectAllMember() {
		logger.info("MemberSVCImpl.selectAllMember() 호출됨!!");
		return memberDAO.selectAllMember();
	}

	//-----------------------------------------------회원 개별 조회
	@Override
	public MemberVO selectMember(String id) {
		logger.info("MemberSVCImpl.selectMember(String id) 호출됨!!");
		return memberDAO.selectMember(id);
	}

//-----------------------------------------------회원 탈퇴
	@Override
	public int outMember(String id, String pw) {
		logger.info("MemberSVCImpl.outMember(String id, String pw) 호출됨!!");
		return memberDAO.outMember(id, pw);
	}

//-----------------------------------------------로그인
	@Override
	public MemberVO loginMember(String id, String pw) {
		logger.info("MemberSVCImpl.loginMember(String id, String pw) 호출됨!!");
		return memberDAO.loginMember(id, pw);
	}

//-----------------------------------------------아이디 찾기
	@Override
	public String findID(String tel, Date birth) {
		logger.info("MemberSVCImpl.findID(String tel, Date birth) 호출됨!!");
		return memberDAO.findID(tel, birth);
	}

//-----------------------------------------------비밀번호 변경
	@Override
	public int changePW(String id, String pw) {
		logger.info("MemberSVCImpl.changePW(String id, String pw) 호출됨!!");	
		return memberDAO.changePW(id, pw);
	}
//-----------------------------------------------비밀번호 변경 대상찾기
	@Override
	public int findPW(MemberVO memberVO) {
		logger.info("MemberSVCImpl.findPW(MemberVO memberVO) 호출됨!!");	
		return memberDAO.findPW(memberVO);
	}

}
