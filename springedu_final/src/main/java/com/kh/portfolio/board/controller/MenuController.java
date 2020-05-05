package com.kh.portfolio.board.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.portfolio.board.svc.BoardSVC;
import com.kh.portfolio.board.svc.NoticeSVC;
import com.kh.portfolio.board.vo.BoardCategoryVO;
import com.kh.portfolio.board.vo.BoardFileVO;
import com.kh.portfolio.board.vo.BoardVO;
import com.kh.portfolio.board.vo.NoticeVO;
import com.kh.portfolio.member.svc.MemberSVC;
import com.kh.portfolio.member.vo.MemberVO;

@Controller		//현재 클래스를 컨트롤러빈으로 등록
@RequestMapping("/menu") //요청 url
public class MenuController {
	
	private static final Logger logger
	= LoggerFactory.getLogger(MenuController.class);
	
	@Inject
	NoticeSVC noticeSVC;
	
	@RequestMapping("/brand")
	public String brandPage() {
		return "menu/brand";
	}
	
//	@GetMapping("/notice")
//	public String noticePage() {
//		
//		return "board/noticeList";
//	}
	
	//목록보기
	@GetMapping({"/noticeList",
							 "/noticeList/{reqPage}",
							 "/noticeList/{reqPage}/{searchType}/{keyword}"
	})
	public String noticeListAll(
			@PathVariable(required=false) String reqPage,
			@PathVariable(required=false) String searchType,
			@PathVariable(required=false) String keyword,
			HttpSession session, 
			Model model) {
		
		MemberVO memberVO = (MemberVO)session.getAttribute("member");

		//게시글목록
		model.addAttribute("noticeList", noticeSVC.noticeList(reqPage,searchType,keyword));
		//페이지 제어
		model.addAttribute("pc", noticeSVC.noticeGetPageCriteria(reqPage, searchType, keyword));	
		return "board/noticeList";
	}
	
	
	//게시글 작성양식
	@GetMapping("/noticeWriteForm/{returnPage}")
	public String noticeWriteForm(
			@ModelAttribute @PathVariable String returnPage,
			Model model, 
			HttpServletRequest request) {
		model.addAttribute("noticeVO",new NoticeVO());
		
		return "/board/noticeWriteForm";
	}
	
	//게시글 작성
	@PostMapping("/noticeWrite/{returnPage}")
	public String noticeWrite(
			@PathVariable String returnPage,
			@Valid @ModelAttribute("noticeVO") NoticeVO noticeVO,
			BindingResult result,
			HttpServletRequest request) {
		logger.info("공지사항작성: " + noticeVO.toString());
		
		if(result.hasErrors()) {
			return "/board/noticeWriteForm";
		}
		
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		noticeVO.setNid(memberVO.getId());
		noticeVO.setNnickname(memberVO.getNickname());
		logger.info("공지사항작성2: " + noticeVO.toString());		
		noticeSVC.noticeWrite(noticeVO);
		return "redirect:/menu/noticeView/"+returnPage+"/"+noticeVO.getNnum();
//		return "redirect:/board/noticeView/"+returnPage+"/"+noticeVO.getNnum();
	}

	//게시글보기
	@GetMapping("/noticeView/{returnPage}/{nnum}")
	public String noticeView(
			@ModelAttribute @PathVariable String returnPage,
			@PathVariable String nnum,
			Model model) {
		
		Map<String,Object> map = noticeSVC.noticeView(nnum);
		NoticeVO noticeVO = (NoticeVO)map.get("notice");
		logger.info(noticeVO.toString());
		
		model.addAttribute("noticeVO", noticeVO);
		
		return "/board/noticeReadForm";
	}

	//게시글 삭제
	@GetMapping("/noticeDelete/{returnPage}/{nnum}")
	public String noticeDelete(
			@PathVariable String returnPage,
			@PathVariable String nnum, 
			Model model) {
		
		//1)게시글 및 첨부파일 삭제
		noticeSVC.noticeDelete(nnum);
		//2)게시글 목록 가져오기
		model.addAttribute("noticeList", noticeSVC.noticeList());
		
		return "redirect:/menu/noticeList/"+returnPage;
	}
	
	//게시글수정
	@PostMapping("/noticeModify/{returnPage}")
	public String noticeModify(
			@PathVariable String returnPage,
			@Valid @ModelAttribute("noticeVO") NoticeVO noticeVO,
			BindingResult result
			) {
		if(result.hasErrors()) {
			return "/board/noticeReadForm";
		}
		logger.info("게시글 수정 내용:" + noticeVO.toString());
		noticeSVC.noticeModify(noticeVO);
		return "redirect:/menu/noticeView/"+returnPage+"/"+noticeVO.getNnum();
	}

}
