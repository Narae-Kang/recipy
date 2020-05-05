package com.kh.portfolio;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.portfolio.board.svc.NoticeSVC;
import com.kh.portfolio.board.vo.NoticeVO;
import com.kh.portfolio.member.vo.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	NoticeSVC noticeSVC;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, 
			@PathVariable(required=false) String reqPage,
			@PathVariable(required=false) String searchType,
			@PathVariable(required=false) String keyword,
			HttpSession session) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
//		return "home"; //  ==> /WEB-INF/views/home.jsp
		
		
//----------------------------------------------------------------공지로 추가한 부분		
			MemberVO memberVO = (MemberVO)session.getAttribute("member");
//			NoticeVO noticeVO = (NoticeVO)session.getAttribute("member");
//		//게시글목록
//			List<NoticeVO> mainList = noticeSVC.noticeMain();
//			logger.info(mainList.toString());

//			model.addAttribute("noticeList", noticeSVC.noticeMain());
			
			//게시글목록
			model.addAttribute("noticeList", noticeSVC.noticeList(reqPage,searchType,keyword));
			//페이지 제어
			model.addAttribute("pc", noticeSVC.noticeGetPageCriteria(reqPage, searchType, keyword));	
	
//----------------------------------------------------------------공지로 추가한 부분		
			
		return "index";
	}
	
	@GetMapping("/bs/test")
	public String test() {
		return "bstest";
	}
	
	@GetMapping("/rboard/rereplyForm")
	public String rereplyForm() {
		return "/board/rereply";
	}
	@GetMapping("/rboard/rereplyForm2")
	public String rereplyForm2() {
		return "/board/rereplyH";
	}
	
	
	
	//----------------------------------------------------예약
	@GetMapping("/contact")
	public String contact() {
		return "/contact";
	}
	//----------------------------------------------------예약
 	
}
