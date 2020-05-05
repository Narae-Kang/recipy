package com.kh.portfolio.admin.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.portfolio.board.svc.NoticeSVC;
import com.kh.portfolio.board.vo.BoardFileVO;
import com.kh.portfolio.board.vo.BoardVO;
import com.kh.portfolio.board.vo.NoticeVO;
import com.kh.portfolio.member.svc.MemberSVC;
import com.kh.portfolio.member.vo.MemberVO;

@Controller		//현재 클래스를 controller bean으로 등록시킨다
@RequestMapping("/admin")	//요청 url
public class AdminController {
  
	private static final Logger logger
		= LoggerFactory.getLogger(AdminController.class);
	
	@Inject		//의존 주입받음
	MemberSVC memberSVC;
	
	@Inject
	NoticeSVC noticeSVC;
	
	
	//관리자페이지
	@GetMapping("")
	public String adminPage() {
		
		return "member/admin";
	}
	
	
	//회원 전체조회 양식
	@GetMapping("/memberList")	//요청 url
	public String memberList(Model model) {
		
		List<MemberVO> list = memberSVC.selectAllMember();		
		model.addAttribute("memberList", list);
		return "admin/memberList";		//뷰 찾는 위치
	}
	
	
	
	//------------------------------------------------------------------------------------------


	
	
}










