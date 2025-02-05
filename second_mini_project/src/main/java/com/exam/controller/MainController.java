package com.exam.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;



@Controller
public class MainController {



	@GetMapping("/main") //main.jsp
	@ModelAttribute("goodsList")
	public void main(@RequestParam(required = false, defaultValue = "top")
	                    String gCategory) {
		
		// JSP에서 보여줄 데이터고 모델에 저장해야 된다.
		
	}
	
}
