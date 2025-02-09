package com.exam.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.exam.dto.MemberDTO;
import com.exam.service.MemberService;

@Controller
@SessionAttributes("login")
public class LoginController {
	
	MemberService memberService;
	public LoginController(MemberService memberService) {
		this.memberService = memberService;
	}

	@GetMapping("/loginForm") //껍데기 main.jsp 
	public String loginForm() {
		return "loginForm";
	} 
	
	@PostMapping("/loginForm") //껍데기 main.jsp 
	public String loginForm2() {
		return "loginForm";
	} 
	
	@PostMapping("/login")
	public String login(@RequestParam Map<String, String> map, Model m) {
		MemberDTO dto = memberService.login(map);
		if(dto!=null) {
			//정상 로그인
			m.addAttribute("login", dto);
			return "redirect:main";
		}
		
		//실패하면
		m.addAttribute("errorMessage","아이디 또는 비밀번호를 확인하세요.");
		return "loginForm"; //loginForm.jsp 로 가라
	}
	
	//로그아웃
	//로그인 이후의 작업이기 떄문에 로그인 여부 확인이 필요함
	//이 작업은 HandlerInterceptor 를 이용
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		//@SessionAttributes를 사용한 세션을 cleanup (삭제) 하는 방법
		status.setComplete();
		return "redirect:main";
	}
	
}
