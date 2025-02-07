package com.exam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.exam.dto.CartDTO;
import com.exam.dto.MemberDTO;
import com.exam.dto.OrderDTO;
import com.exam.service.CartService;
import com.exam.service.OrderService;

import jakarta.validation.constraints.Size;

@Controller
@SessionAttributes("login")
public class OrderController {

	OrderService orderService;
	CartService cartService; 
	
	public OrderController(OrderService orderService,CartService cartService) {
		this.orderService = orderService;
		this.cartService = cartService;
	} 

	@GetMapping("/orderConfirm")

	public String cartAdd(@RequestParam Integer num, Model m) {
		
		CartDTO cartDTO = orderService.orderConfirm(num);
		
		MemberDTO dto =
				(MemberDTO)m.getAttribute("login");
		String userid = dto.getUserid();
		MemberDTO memberDTO = orderService.orderConfirmMember(userid);

		m.addAttribute("cDTO", cartDTO);
		m.addAttribute("mDTO", memberDTO);
		          
		return "orderConfirm";
	}   

	
	@PostMapping("/orderDone")
	   public String orderDone(Model m,
	         @RequestParam int num,
	         @RequestParam String username,
	         @RequestParam String post,
	         @RequestParam String addr1,
	         @RequestParam String addr2,
	         @RequestParam String phone, Model m2) { 
	      MemberDTO dto = (MemberDTO)m.getAttribute("login");
	      
	      String userid = dto.getUserid();
	      
	      CartDTO cartDTO = orderService.orderConfirm(num);
	      String gCode = cartDTO.getgCode();
	      String gSize = cartDTO.getgSize();
	      String gColor = cartDTO.getgColor(); 
	      int gAmount = cartDTO.getgAmount();
	        
	      OrderDTO orderDTO = new OrderDTO();
	      orderDTO.setNum(num);
	      orderDTO.setUserid(userid);
	      orderDTO.setgCode(gCode);
	      orderDTO.setgSize(gSize);
	      orderDTO.setgColor(gColor);
	      orderDTO.setgAmount(gAmount);
	      orderDTO.setOrderName(username);
	      orderDTO.setPost(post);
	      orderDTO.setAddr1(addr1);
	      orderDTO.setAddr2(addr2);
	      orderDTO.setPhone(phone);
	      
	       // 디버깅: post 값 출력
	       System.out.println("Received post: " + post);
	       
	      int n = orderService.orderDone(orderDTO);
	      m2.addAttribute("oDTO", orderDTO); 
	      m2.addAttribute("cDTO", cartDTO); 

	      int n2 = orderService.AfterOrder(num);
	      
	      return "orderDone";  
	   }

 
         
	@GetMapping("/buyGoods")
	public String buyGoods( @RequestParam String gCode,
				           @RequestParam String gSize,
			               @RequestParam  String gColor,
			               
			               @Size(min = 1, max = 2)
					      // @Size 적용가능한 타입: 문자열, 컬렉션, 배열
			               @RequestParam  String gAmount,
			               
			               Model m
			               ) {
		 
		//실패
		// @Validated 로 설정한 유효성체크는 에러발생시 ConstraintViolationException 예외가 발생되고
		// @ControllerAdvice 지정한 GlobalExceptionHandler 생성.
		
		//성공
		MemberDTO memberDTO = (MemberDTO)m.getAttribute("login");
		String userid = memberDTO.getUserid();
		
		CartDTO cartDTO = new CartDTO();
		cartDTO.setUserid(userid);
		cartDTO.setgCode(gCode);
		cartDTO.setgSize(gSize);
		cartDTO.setgColor(gColor);
		cartDTO.setgAmount( Integer.parseInt(gAmount));
		
		int n = cartService.cartAdd(cartDTO);
		int num = cartService.getLatestNum(cartDTO);
		System.out.println(cartDTO); 
		
		//m.addAttribute("cartDTO",cartDTO);
		
		CartDTO cDTO = orderService.orderConfirm(num);
		 
		MemberDTO dto =
				(MemberDTO)m.getAttribute("login");
		MemberDTO mDTO = orderService.orderConfirmMember(userid);

		m.addAttribute("cDTO", cDTO);
		m.addAttribute("mDTO", mDTO);
		   
		return "orderConfirm2";
	} 
	
} 




