package com.kh.portfolio.controller;

import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/test")
public class TestController {
//					서버		  포트
//http://localhost:9080/portfolio/test/abc
//http://localhost:9080/portfolio/test/test
//http://localhost:9080/portfolio/test/abc
	
	@RequestMapping(
			value={"","/1","/2","/3"}, 
			method = {RequestMethod.POST, RequestMethod.GET})
	public String t1() {
	return "test";
	}	
//	@GetMapping(value={"","/1","/2","/3"})
//	@PostMapping(value={"","/1","/2","/3"})		<=이렇게 하니까 getMapping만 먹히고 post 는 안먹힘
//	public String t1() {
//	return "test";
//	}		
	@GetMapping(value={"","/1","/2","/3"})
	public String t2() {
	return "test";
	}	
	@PostMapping(value={"","/1","/2","/3"})
	public String t3() {
		return "test";
	}		
//----------------------------------------------------------------------		
	@RequestMapping("/abc")
	public String temp() {
		//1) 상대경로 : 현재 요청 url이 기준이 됨
		//(O) return "redirect:../test";	//http://localhost:9080/portfolio/test
		//(O) return "redirect:./";				//http://localhost:9080/portfolio/test
		//2) 절대경로 : 컨텍스트 루트가 기준이 됨
		//(O) return "redirect:/test";		//http://localhost:9080/portfolio/test
		//3) 외부서버 링크
		return "redirect:http://www.naver.com";
	}
	
	@RequestMapping("/abc2")
	public String temp2() {
		//1) 상대경로 : 현재 요청 url이 기준이 됨
		//(O) return "forward:";				// /portfolio/test
		//(X) return "forward:./";			// /portfolio/test/./
		//2) 절대경로 : 컨텍스트 루트가 기준이 됨
		return "forward:/test";					// /portfolio/test
		//3) 외부서버 링크
		//(X) return "forward:http://www.naver.com";
	}
}



















