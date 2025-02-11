package com.exam.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.exam.dto.GoodsDTO;
import com.exam.service.GoodsService;

@Controller
public class MainController {
	  
	GoodsService service;       
	//생성자로 주입
	public MainController(GoodsService service) {
		super();
		this.service = service;
	}      
  
	@GetMapping("/main") //껍데기 main.jsp 
	@ModelAttribute("goodsList")
	public List<GoodsDTO> main(@RequestParam(required=false, defaultValue="bowling") String gCategory) {
		//JSP 에서 보여줄 데이터, 이것을 모델에 저장해야 함                 
		//request scope 에 저장됨..
		List<GoodsDTO> list = service.goodsList(gCategory);
		return list; 
	}               
	 
	@PostMapping("/search")
	@ModelAttribute("goodsList") 
	public List<GoodsDTO> search(@RequestParam(required = false, defaultValue = "") String search) {
		//JSP 에서 보여줄 데이터, 이것을 모델에 저장해야 함
		//request scope 에 저장됨..
		List<GoodsDTO> list = service.search(search);
		return list; 
	}  

}
