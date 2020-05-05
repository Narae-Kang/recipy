package com.kh.portfolio.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.portfolio.member.svc.MemberSVC;
import com.kh.portfolio.member.vo.MemberVO;

@RestController
@RequestMapping("/rest")
public class RestTest {
	
	private static final Logger logger
		= LoggerFactory.getLogger(RestTest.class);
	
	@Inject
	MemberSVC memberSVC;
	
	
//	postman에 get방식으로 httplocalhost9080portfoliorestmemberAll2 
	@GetMapping(value = "/member", produces="application/json")
	public MemberVO getMember() {
		MemberVO memberVO = null;
		memberVO = memberSVC.selectMember("test9@test.com");
		return memberVO;
	}
	@GetMapping(value = "/member2", produces="application/xml")
	public MemberVO getMember2() {
		MemberVO memberVO = null;
		memberVO = memberSVC.selectMember("test9@test.com");
		return memberVO;
	}
	@GetMapping(value = "/memberAll", produces="application/json")
	public List<MemberVO> getMemberAll(){
		
		return memberSVC.selectAllMember();
	}
	@GetMapping(value = "/memberAll2", produces="application/xml")
	public List<MemberVO> getMemberAll2(){
		return memberSVC.selectAllMember();
	}
	
	@GetMapping(value="/hi", produces="application/json")
	public String hi() {
		return "hi";
	}
	@GetMapping(value="/hi2", produces="application/xml")
	public String hi2() {
		return "hi";
	}
	
	@GetMapping(value="/map", produces="application/json")
	public Map<String,MemberVO> map() {
		Map<String,MemberVO> map = new HashMap<>();
		MemberVO memberVO = new MemberVO();
		
		memberVO.setId("test9@test.com");
		memberVO.setNickname("관리자");
		map.put("one", memberVO);
		
		memberVO = new MemberVO();
		memberVO.setId("test5@test.com");
		memberVO.setNickname("태연");
		map.put("two", memberVO);
		
		return map;
	}
	
	@GetMapping(value="/map2", produces="application/xml")
	public Map<String,MemberVO> map2() {
		Map<String,MemberVO> map = new HashMap<>();
		MemberVO memberVO = new MemberVO();
		
		memberVO.setId("test9@test.com");
		memberVO.setNickname("아이린");
		map.put("one", memberVO);
		
		memberVO = new MemberVO();
		memberVO.setId("test5@test.com");
		memberVO.setNickname("태연");
		map.put("two", memberVO);
		
		return map;
	}
	
	
}


















