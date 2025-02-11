package com.exam.controller;
        
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.exam.dto.FeedbackDTO;
import com.exam.dto.GoodsDTO;
import com.exam.dto.MemberDTO;
import com.exam.service.FeedbackService;
import com.exam.service.GoodsService;

@Controller
@SessionAttributes("gCode")
public class GoodsController {
	
	GoodsService goodsService;
	FeedbackService feedbackService;
	//생성자로 주입    
	public GoodsController(GoodsService goodsService,FeedbackService feedbackService) {  
		this.goodsService = goodsService;
		this.feedbackService = feedbackService;
 
	}        
 

//	@GetMapping("/goodsRetrieve") //껍데기 retreive.jsp 
//	public String goodsRetrieve(@RequestParam(required=false) String gCode, Model m) {
//		상품 목록에서 자세히 보기로 요청한 경우에 gCode 를 세션에 저장
//		m.addAttribute("gCode",gCode);	
	
//		GoodsDTO dto = goodsService.goodsRetrieve(gCode);
//		m.addAttribute("goodsRetrieve",dto);
//		return "goodsRetrieve";
//	}   
	
	@GetMapping("/goodsList")
	public String getGoodsList(
	    @RequestParam(required = false) String sort,
	    @RequestParam(required = false, defaultValue = "") String gCategory,
	    Model model) {

  	    // 카테고리별로 상품을 가져오기
	    List<GoodsDTO> goodsList = goodsService.getAllGoodsByCategory(gCategory);

	    // 정렬 처리
	    if ("price_desc".equals(sort)) {
	        goodsList.sort(Comparator.comparing(GoodsDTO::getgPrice).reversed());
	    } else if ("price_asc".equals(sort)) {
	        goodsList.sort(Comparator.comparing(GoodsDTO::getgPrice));
	    } else if ("code_asc".equals(sort)) {
	        goodsList.sort(Comparator.comparing(GoodsDTO::getgCode));
	    }

	    // 모델에 데이터 추가
	    model.addAttribute("goodsList", goodsList);
	    model.addAttribute("sort", sort);
	    model.addAttribute("gCategory", gCategory);

	    return "main";
	}

           
      

	
	
	       
	@GetMapping("/goodsRetrieve")
	public ModelAndView goodsRetrieve(@RequestParam(required=false) String gCode, Model m,RedirectAttributes redirectAttributes) {
		if(gCode==null) {
			gCode = (String)m.getAttribute("gCode");
		}      
		   
		m.addAttribute("gCode",gCode);
		  
		GoodsDTO dto = goodsService.goodsRetrieve(gCode);
		ModelAndView mav = new ModelAndView();
		//모델 저장 
		mav.addObject("goodsRetrieve",dto);
		//뷰 저장
		mav.setViewName("goodsRetrieve");
		  
		List<FeedbackDTO> list = feedbackService.pullFeedback(gCode);
 		mav.addObject("feedback", list);
		    
		return mav;  
	}   
	  
	@PostMapping("/writeFeedback")
	public String writeFeedback(@RequestParam String userid,
	                            @RequestParam String gCode,
	                            @RequestParam String gContext, Model m,
	                            RedirectAttributes redirectAttributes) {
	    //MemberDTO dto = (MemberDTO)m.getAttribute("login");
		//AuthProvider 에서 저장시킨 Authentication 정보가 필요함
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberDTO dto = (MemberDTO)auth.getPrincipal();

		
	    FeedbackDTO feedbackDTO = new FeedbackDTO();
	    feedbackDTO.setUserid(userid); 
	    feedbackDTO.setgCode(gCode); 
	    feedbackDTO.setgContext(gContext); 
             
	    int n = feedbackService.writeFeedback(feedbackDTO);
     
	    List<FeedbackDTO> list = feedbackService.pullFeedback(gCode); 
	    //피드백 된 list 내용 모델에 저장
	    redirectAttributes.addFlashAttribute("feedback", list);
    
	    // goodsRetrieve 페이지로 리다이렉트하면서 gCode도 전달
	    return "redirect:/goodsRetrieve?gCode=" + gCode;
	}
	
	

}
