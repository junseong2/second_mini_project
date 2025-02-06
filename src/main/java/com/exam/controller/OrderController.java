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
import com.exam.service.OrderService;

@Controller
@SessionAttributes("login")
public class OrderController {

	OrderService orderService;
	
	public OrderController(OrderService orderService) {
		this.orderService = orderService;
	}

	@GetMapping("/orderConfirm")
	public String cartAdd(@RequestParam(name = "num", required = true) Integer num, Model m) {
	    // num 파라미터가 반드시 전달되어야 함을 명시합니다.

	    // orderService에서 해당 order에 대한 CartDTO 정보를 가져옵니다.
	    CartDTO cartDTO = orderService.orderConfirm(num);
	    
	    // 로그인된 사용자의 정보를 가져옵니다.
	    MemberDTO memberDTO = (MemberDTO) m.getAttribute("login");
	    String userid = memberDTO.getUserid();
	    
	    // orderService에서 해당 사용자에 대한 MemberDTO를 가져옵니다.
	    MemberDTO memberDetails = orderService.orderConfirmMember(userid);
	    
	    // 모델에 cartDTO와 memberDTO를 추가하여 뷰로 전달합니다.
	    m.addAttribute("cDTO", cartDTO);
	    m.addAttribute("mDTO", memberDetails);
	    
	    
	    // 최종적으로 "orderConfirm" 뷰를 리턴합니다.
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

	
	
}




