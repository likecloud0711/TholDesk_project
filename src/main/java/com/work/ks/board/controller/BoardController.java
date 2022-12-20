package com.work.ks.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.work.ks.board.dto.BoardDto;
import com.work.ks.board.dto.CommDto;
import com.work.ks.board.service.BoardService;
import com.work.ks.board.service.CommService;







@Controller
/*@SessionAttributes("user") 세션 저장할 부분. 로그인 , 로그아웃이 존재해야함*/ 
public class BoardController {
	
	@Autowired
	BoardService service;
	
	@Autowired
	CommService c_service;
	
	/*@ModelAttribute("user")
	public MemDto getDto() {
		return new MemDto();
	}*/
	
	// 메인 부분. 목록 글들이 보이는 부분
	/*@GetMapping("/ks/board")
	public String Boardform(Model m) {
		List<BoardDto> list = service.list();
		m.addAttribute("list",list);
		return "/ks/board";
	}*/
	
	// 작성폼 띄우는 부분
	@GetMapping("/ks/write")
	public String Writeform() {
		return "ks/write";
	}
	// 작성페이지에서 입력한 데이터를 보내는 역할.
	@PostMapping("/ks/write") 
	public String Writeform2(BoardDto dto) {
		service.insert(dto);
		return "redirect:/ks/board";
	}
	//페이징 부분과 목록 글들이 보이는 부분
	@RequestMapping("/ks/board")
	public String list(@RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		
		int count = service.count();
		if (count > 0) {
			int perPage = 10; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage;

			List<BoardDto> boardList = service.list(startRow);

			m.addAttribute("blist", boardList);

			int pageNum = 5;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0);
			// 전체 페이지 수 // 인트를 인트로 나누니까 몫만 남으니까. 나머지 값을 구하기 위해 . 트루면 1 폴스면 0
			// 나눴을때 0이 아니면 한페이지를 더 만들어줌.

			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum - 1;
			if (end > totalPages) {
				end = totalPages;
			}
			m.addAttribute("begin", begin); // view에서 쓰기위해 모델에 저장하는거임.
			m.addAttribute("end", end);
			m.addAttribute("pageNum", pageNum);
			m.addAttribute("totalPages", totalPages);
		}
		m.addAttribute("count", count);
		return "ks/board";
	}
	
	// 상세 페이지 부분
	   @GetMapping("/ks/board/{boardno}")
	   public String content(@PathVariable int boardno, Model m) {
	 
		  BoardDto dto = service.listOne(boardno);
	      m.addAttribute("dto", dto);
	      
	      List<CommDto> cList = c_service.selectComm(boardno); // 댓글 기능.
	      m.addAttribute("cList", cList); 
	      
	      return "/ks/read";
	      
	   }
	   
	   // 글 삭제 기능
		@RequestMapping("/ks/delete")
		public String delete(int no) {
			service.delete(no);
			return "redirect:board"; 
	   
		}
		
		//글 수정 기능1
		@GetMapping("/ks/update/{boardno}")
		public String update1(@PathVariable int boardno, Model m) {
			BoardDto dto = service.listOne(boardno);
			m.addAttribute("dto", dto); // 내가 지금 여기에 dto라고 지정을 했으니. 업데이트에서도 dto라고 써야함
			return "ks/update";
		} 
		
		//글 수정 기능2
		@PostMapping("/ks/update")
		public String update2(BoardDto dto) {
			service.update(dto);
			return "redirect:board";
		} 
		
}

