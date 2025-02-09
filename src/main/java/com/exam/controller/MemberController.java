package com.exam.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.exam.dto.GoodsDTO;
import com.exam.dto.MemberDTO;
import com.exam.service.GoodsService;
import com.exam.service.MemberService;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.extern.slf4j.Slf4j;

@Controller
@Validated
@SessionAttributes("login")
@Slf4j
public class MemberController {
	
	MemberService memberService; 	
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}  
   
	//회원가입 화면 
	@GetMapping("/signup")
	public String signup() {   
		return "memberForm"; 
	}  	
	 
	//id 중복 체크하기
	@GetMapping("/idCheck")
	@ResponseBody
	public String idCheck(@RequestParam String userid) {
		String mesg = "아이디 사용 가능";
		MemberDTO dto = memberService.idCheck(userid);
		
		if(dto!=null) {  
			mesg="아이디 중복";
		} 
		   
		return mesg;
	}
	
	//회원가입
	@PostMapping("/signup")
	public String signup(@RequestParam String userid,
						
						 @Size(min=2, message="최소 2글자 이상 입력하세요.")
						 @RequestParam String passwd,
						 
						 @NotBlank(message="이름을 입력하세요.")
						 @RequestParam String username, 
						 
						 @RequestParam String post,
						 @RequestParam String addr1,
						 @RequestParam String addr2,

						 @RequestParam String phone1,
						 @NotBlank(message="휴대폰 중간번호는 필수사항입니다.")
						 @RequestParam String phone2,
						 @NotBlank(message="휴대폰 끝번호는 필수사항입니다.")
						 @RequestParam String phone3,
						 @RequestParam String email1,
						 @RequestParam String email2,
						 RedirectAttributes redirectAttributes
						) {
		//유효성 실패하면 ConstraintViolationException 예외발생
		//따라서 이 예외를 처리하는 @ControllerAdvice 빈을 만들어야 함
		//com.exam.exception 내 GlobalExceptionHandler.java
	
		//유효성 성공한 경우
		MemberDTO dto = new MemberDTO(userid, passwd, username, post,
			addr1, addr2, phone1, phone2, phone3, email1, email2);
		    
		int n = memberService.memberAdd(dto); 
		 
		//회원가입 완료 메시지를 전달
		redirectAttributes.addFlashAttribute("message", "회원가입이 정상적으로 완료되었습니다.");
		
		return "redirect:main"; 
	}  
	  
	//mypage
	@GetMapping("/mypage")
	public String mypage(Model m) { 
		MemberDTO dto = (MemberDTO)m.getAttribute("login");
		
		String userid = dto.getUserid();
		MemberDTO mypageDTO = memberService.mypage(userid);
		m.addAttribute("login",mypageDTO);
		
		return "mypage"; 
	} 
	    
	@GetMapping("/findid") 
	public String findid() { 
		return "findid";
	} 
	
	@PostMapping("/findid")
	public String findid(@NotBlank(message="이름을 입력하세요.")
						 @RequestParam String username,
						 @RequestParam String phone1,
						 @NotBlank(message="휴대폰 중간번호는 필수사항입니다.")
						 @RequestParam String phone2,
						 @NotBlank(message="휴대폰 끝번호는 필수사항입니다.")
						 @RequestParam String phone3, Model m) {
		
		MemberDTO dto = new MemberDTO();
		dto.setUsername(username);
		dto.setPhone1(phone1);  
		dto.setPhone2(phone2);
		dto.setPhone3(phone3); 
		
		String userid = memberService.findid(dto);
		log.info("userid:{}",userid); 
		
		if(userid==null) {
			m.addAttribute("errorMessage","일치하는 회원 정보가 없습니다.");
			return "findid";
		}
		
		m.addAttribute("userid",userid);
		
		return "findidSuccess";
	}
	
	@GetMapping("/findpw")
	public String findpw() { 
		return "findpw"; 
	} 
	
	@PostMapping("/findpw")
	public String findpw(@NotBlank(message="아이디를 입력하세요.")
						 @RequestParam String userid, Model m) {
		
		MemberDTO dto = new MemberDTO();
		dto.setUserid(userid);
		
		String passwd = memberService.findpw(dto);
		log.info("userid:{}",userid); 
		
		if(passwd==null) {
			m.addAttribute("errorMessage","일치하는 회원 정보가 없습니다.");
			return "findpw";
		}
		
		m.addAttribute("passwd",passwd);
		
		return "findpwSuccess"; 
	}
	
//	@GetMapping("/update")
//	public String update() { 
//		return "mypage"; 
//	} 
	
	@PostMapping("/update")
	public String update(@ModelAttribute MemberDTO dto, RedirectAttributes redirectAttributes) {
	    int n = memberService.update(dto);
	    redirectAttributes.addFlashAttribute("message", "업데이트가 정상적으로 완료되었습니다.");
	    return "redirect:/main";
	}
	
//	@GetMapping("/update")
//	public String update() {   
//		return "mypage"; 
//	} 
	
	@PostMapping("/withdraw")
	public String withdraw(@ModelAttribute("login") MemberDTO loginMember, 
	                       RedirectAttributes redirectAttributes,
	                       SessionStatus sessionStatus) {

	    String userid = loginMember.getUserid(); 
 
	    int n = memberService.withdraw(userid);
	    if (n > 0) {
	        sessionStatus.setComplete();
	        redirectAttributes.addFlashAttribute("message", "회원 탈퇴가 정상적으로 완료되었습니다.");
	    } else {
	        redirectAttributes.addFlashAttribute("error", "회원 탈퇴에 실패했습니다.");
	    }

	    return "redirect:/main";
	}


	
	
}
