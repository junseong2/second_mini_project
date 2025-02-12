package com.exam.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import javax.imageio.ImageIO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.exam.dto.GoodsDTO;
import com.exam.service.GoodsService;

import jakarta.validation.Path;
import net.coobird.thumbnailator.Thumbnails;

@Controller
public class ManagerController {
    
   GoodsService goodsService;

    public ManagerController(GoodsService goodsService) {
      this.goodsService = goodsService;
   }
     


//   @GetMapping("/manager")  
//    public String manager() {
//        return "goods/managerConfirm";   
//    }
   
   @GetMapping("/manager")  
   public String managerPage() {
       return "manager";     
   }  
   
   // 로그인 처리 (POST)
   @PostMapping("/manager")
   public String managerLogin() {
       return "managerSuccess";
   }
    



    @PostMapping("/goodsRegister")
    public String registerGoods(@RequestParam String gCode,
                                @RequestParam String gCategory,
                                @RequestParam String gName,
                                @RequestParam String gContent,
                                @RequestParam int gPrice,
                                @RequestParam MultipartFile gImage,
                                RedirectAttributes redirectAttributes) {

        String imageFileName = gImage.getOriginalFilename(); 
//        File f = new File("C:/springboot3_study/sts-4.27.0.RELEASE/workspace/second_mini_project/src/main/resources/static/images/items/", imageFileName);
        File f = new File("C://upload", imageFileName);
        
        try {
        	
            gImage.transferTo(new File(f.toString())); 
            
        } catch (IOException e) {
            e.printStackTrace();
        }

        GoodsDTO goods = new GoodsDTO(gCode, gCategory, gName, gContent, gPrice, imageFileName);

        goodsService.goodsAdd(goods);
        
        redirectAttributes.addFlashAttribute("message", "상품이 정상적으로 등록되었습니다.");
        
        return "redirect:/main";  
    }
}
    

