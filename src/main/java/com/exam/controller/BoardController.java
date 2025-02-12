package com.exam.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.exam.dto.BoardDTO;
import com.exam.dto.FeedbackDTO;
import com.exam.dto.GoodsDTO;
import com.exam.dto.MemberDTO;
import com.exam.dto.PageDTO;
import com.exam.service.BoardService;
import com.exam.service.FeedbackService;
import com.exam.service.GoodsService;

@Controller
public class BoardController {

	BoardService boardService;

	// 생성자로 주입
	public BoardController(BoardService boardService) {
		this.boardService = boardService;
	}

	@GetMapping("/list")
	public String boardList(@RequestParam(required = false, defaultValue = "1") String curPage, Model m) {

		List<BoardDTO> list = boardService.list();

		// list 데이터를 scope에 저장
		m.addAttribute("findAll", list);

		return "list";
	}

	@GetMapping("/boardwrite")
	public String writeUI() {
		return "write";
	}

	@PostMapping("/boardwrite")
	public String write(@RequestParam String title, 
            @RequestParam String author,
            @RequestParam String content,
            @RequestParam MultipartFile image) {
		BoardDTO dto = new BoardDTO();
		  // 🔥 DTO에 이미지 파일명 저장

		String imageFileNames = image.getOriginalFilename();
		File f = new File("C://upload", imageFileNames);
		try {
 
			image.transferTo(new File(f.toString()));

		} catch (IOException e) {
			e.printStackTrace();
		} 
		dto.setTitle(title);
		dto.setAuthor(author); 
		dto.setContent(content); 
		dto.setImage(imageFileNames);
		boardService.write(dto);
		return "redirect:list";
	}

	@GetMapping("/retrieve")
	public String retrieve(@RequestParam String num, Model m) {
		BoardDTO dto = boardService.retrieve(Integer.parseInt(num));
		m.addAttribute("retrieve", dto);

		return "retrieve";
	}

	@GetMapping("/updateBoard")
	public String updateBoard(@RequestParam String num, @RequestParam String title, @RequestParam String author,
			@RequestParam String content) {
		BoardDTO dto = new BoardDTO();
		dto.setNum(Integer.parseInt(num));
		dto.setTitle(title);
		dto.setAuthor(author);
		dto.setContent(content);

		int n = boardService.update(dto);

		return "redirect:list";
	}

	@GetMapping("/deleteBoard")
	public String deleteBoard(@RequestParam String num) {

		int n = boardService.delete(Integer.parseInt(num));

		return "redirect:list";
	}

}
