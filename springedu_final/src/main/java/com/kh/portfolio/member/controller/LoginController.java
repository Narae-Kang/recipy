package com.kh.portfolio.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.portfolio.exception.BizException;
import com.kh.portfolio.member.svc.MemberSVC;
import com.kh.portfolio.member.vo.MemberVO;

@Controller
public class LoginController {

	private static final Logger logger 
		= LoggerFactory.getLogger(LoginController.class);
	
	@Inject
	MemberSVC memberSVC;	
	
	//로그인 양식
	//@RequestMapping(value = "/login", method = RequestMethod.GET) 4.4 이전에는 요렇게 !
	@RequestMapping("/loginForm")		
	public String login(
			@RequestParam(value="reqURI", required=false) String reqURI, 
			Model model) {
		logger.info("reqURI:"+reqURI);
		if(reqURI == null) {
			reqURI = "/";
		}
		model.addAttribute("reqURI", reqURI);		
		return "/member/loginForm";
	}
	
	//로그인 처리
	@PostMapping("/login")		
	public String loginOK(
			@ModelAttribute @RequestParam("id") String id, 
			@RequestParam("pw") String pw,
			@RequestParam("reqURI") String reqURI,
			HttpSession session, 
			Model model	) {
		logger.info("id=" + id);
		logger.info("pw=" + pw);
		
		MemberVO memberVO = memberSVC.selectMember(id);
		logger.info(memberVO.toString());
		//1) 회원이 없는 경우
		if(memberVO == null) {
			model.addAttribute("svr_msg", "가입된 회원정보가 없습니다.");
//			throw new BizException("가입된 회원정보가 없습니다.");  예외처리 테스트 해본 부분!!
		} else {
		//2) 회원이 있는 경우
			//2-1) 비밀번호가 일치하는 경우
			if( pw.equals(memberVO.getPw())) {
				session.setAttribute("member", memberVO);
//				return "redirect:"+reqURI;
				return "redirect:/";
				
			} else {
			//2-2)  비밀번호가 다른 경우
				model.addAttribute("svr_msg", "비밀번호가 일치하지 않습니다.");
			}
		}
		session.invalidate(); //++로그인에 실패했다면 세션에 남아있는 정보를 제거
		return "/member/loginForm";
	}
	
	//로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "redirect:/";
	}

}












