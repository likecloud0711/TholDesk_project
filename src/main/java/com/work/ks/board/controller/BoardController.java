package com.work.ks.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.work.employee.EmployeeDto;
import com.work.employee.EmployeeService;
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
	
	@Autowired
	EmployeeService e_service;
	
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
	
// 공지사항[start]	
	// 공지사항 작성폼 띄우는 부분
	@GetMapping("/ks/write")
	public String Writeform(Model m, HttpSession session) {
		int empno = (int) session.getAttribute("empno");
		EmployeeDto dto = e_service.selectEmp(empno);
		
		m.addAttribute("dto", dto);
		return "ks/write";
	}
	// 공지사항 작성페이지에서 입력한 데이터를 보내는 역할.
	@PostMapping("/ks/write")
	public String Writeform2(BoardDto dto, MultipartFile file, HttpServletRequest request, Model m) {

		if (!file.getOriginalFilename().equals("")) {
			String fileName = upload(file, request);

			//dto.setFile1(file.getOriginalFilename());
			dto.setPath("/mainImg/"+fileName); // 경로
			dto.setOriginalname(fileName); // 원본이름
		}
		
		service.insertFile(dto);
		return "redirect:/ks/board";
	}
	//공지사항 페이징 부분과 목록 글들이 보이는 부분 
	@RequestMapping("/ks/board")
	public String list(@RequestParam(name = "p", defaultValue = "1") int page, Model m, HttpSession session) {
		 int empno = (int) session.getAttribute("empno");
		 EmployeeDto dto1 = e_service.selectEmp(empno);
		 
		 m.addAttribute("emp", dto1);
		
		 int count = service.count();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DAY_OF_MONTH, -1); //1일간 보이도록 하기위해서.
        String nowday = format.format(cal.getTime());
		if (count > 0) {
			int perPage = 10; 
			int startRow = (page - 1) * perPage;

			List<BoardDto> boardList = service.list(startRow);

			m.addAttribute("blist", boardList);

			int pageNum = 5;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0);

			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum - 1;
			if (end > totalPages) {
				end = totalPages;
			}
			m.addAttribute("begin", begin);
			m.addAttribute("end", end);
			m.addAttribute("pageNum", pageNum);
			m.addAttribute("totalPages", totalPages);
		}
		m.addAttribute("nowday",nowday);
		m.addAttribute("count", count);
		return "ks/board";
	}
	
	// 상세 페이지 부분
	   @GetMapping("/ks/board/{boardno}")
	   public String content(@PathVariable int boardno, Model m,HttpSession session) {
		   
		  int empno = (int) session.getAttribute("empno");
		  EmployeeDto dto1 = e_service.selectEmp(empno);
		  m.addAttribute("dto1", dto1);
		  
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
			m.addAttribute("dto", dto);
			return "ks/update";
		} 
		
		//글 수정 기능2
		@PostMapping("/ks/update")   
		public String update2(BoardDto dto) {
			service.update(dto);
			return "redirect:board";
		} 
		
		// 파일 업로드 기능
		private String upload(MultipartFile file, HttpServletRequest request) {
			String origName = file.getOriginalFilename();
			int index = origName.lastIndexOf(".");
			String ext = origName.substring(index + 1);// 파일 확장자 저장

			Random r = new Random();
			String fileName = System.currentTimeMillis() + "_" + r.nextInt(50) + "." + ext;

			try {
				String path = request.getServletContext().getRealPath("/mainImg");
				File f = new File(path, fileName);
				file.transferTo(f);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			return fileName;
		}
		
		// 서치 기능 부분
		@RequestMapping("/ks/search")
		public String search(String search, @RequestParam(name = "p", defaultValue = "1") int page, Model m) {
			
			int count = service.countSearch(search);
	        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	        Calendar cal = Calendar.getInstance();
	        cal.add(Calendar.DAY_OF_MONTH, -1); //1일간 보이도록 하기위해서.
	        String nowday = format.format(cal.getTime());
			if (count > 0) {
				int perPage = 10; 
				int startRow = (page - 1) * perPage;

				List<BoardDto> boardList = service.boardListSearch(search, startRow);

				m.addAttribute("blist", boardList);

				int pageNum = 5;
				int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // 전체 페이지 수

				int begin = (page - 1) / pageNum * pageNum + 1;
				int end = begin + pageNum - 1;
				if (end > totalPages) {
					end = totalPages;
				}
				m.addAttribute("begin", begin); 
				m.addAttribute("end", end);
				m.addAttribute("pageNum", pageNum);
				m.addAttribute("totalPages", totalPages);
			}
			m.addAttribute("nowday",nowday);
			m.addAttribute("count", count);
			m.addAttribute("search", search);
			return "ks/search";
		}
// 공지사항[end]	
		
		
// 부서게시판[start]			
		// 부서게시판 작성폼 띄우는 부분
		@GetMapping("/ks/teamwrite")
		public String teamWriteform(Model m, HttpSession session) {
			int empno = (int) session.getAttribute("empno");
			EmployeeDto dto = e_service.selectEmp(empno);
			
			m.addAttribute("dto", dto);
			return "ks/teamwrite";
		}
		// 부서게시판 작성페이지에서 입력한 데이터를 보내는 역할.
		@PostMapping("/ks/teamwrite")
		public String teamWriteform2(BoardDto dto, MultipartFile file, HttpServletRequest request, Model m) {
			if (!file.getOriginalFilename().equals("")) {
				String fileName = teamupload(file, request);

				//dto.setFile1(file.getOriginalFilename());
				dto.setPath("/mainImg/"+fileName); // 경로
				dto.setOriginalname(fileName); // 원본이름
			}
			
			service.teaminsertFile(dto);
			return "redirect:/ks/teamboard";
		}
		//부서게시판 페이징 부분과 목록 글들이 보이는 부분 
		@RequestMapping("/ks/teamboard")
		public String teamlist(@RequestParam(name = "p", defaultValue = "1") int page, Model m, String teamno, HttpSession session) {
			
			
			
			int empno = (int)session.getAttribute("empno");
			teamno = service.myteam(empno); 

			int count = service.teamcount(teamno);
	        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	        Calendar cal = Calendar.getInstance();
	        cal.add(Calendar.DAY_OF_MONTH, -1); //1일간 보이도록 하기위해서.
	        String nowday = format.format(cal.getTime());
			if (count > 0) {
				int perPage = 10; 
				int startRow = (page - 1) * perPage;
				
				List<BoardDto> boardList = service.teamlist(teamno, startRow);
				
				m.addAttribute("blist", boardList);
				
				int pageNum = 5;
				int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0);

				int begin = (page - 1) / pageNum * pageNum + 1;
				int end = begin + pageNum - 1;
				if (end > totalPages) {
					end = totalPages;
				}
				m.addAttribute("begin", begin);
				m.addAttribute("end", end);
				m.addAttribute("pageNum", pageNum);
				m.addAttribute("totalPages", totalPages);
			}
			m.addAttribute("nowday",nowday);
			m.addAttribute("count", count);

			
			return "ks/teamboard";
		}
		
		// 상세 페이지 부분
		   @GetMapping("/ks/teamboard/{boardno}")
		   public String teamcontent(@PathVariable int boardno, Model m, HttpSession session) {
			   
				  int empno = (int) session.getAttribute("empno");
				  EmployeeDto dto1 = e_service.selectEmp(empno);
				  m.addAttribute("dto1", dto1);
		 
			  BoardDto dto = service.teamlistOne(boardno);
		      m.addAttribute("dto", dto);
		      
		      List<CommDto> cList = c_service.teamselectComm(boardno); // 댓글 기능.
		      m.addAttribute("cList", cList); 
		      
		      return "/ks/teamread";
		      
		   }
		   
		   // 글 삭제 기능
			@RequestMapping("/ks/teamdelete")
			public String teamdelete(int no) {
				service.teamdelete(no);
				return "redirect:teamboard"; 
		   
			}
			
			//글 수정 기능1
			@GetMapping("/ks/teamupdate/{boardno}")
			public String teamupdate1(@PathVariable int boardno, Model m) {
				BoardDto dto = service.teamlistOne(boardno);
				m.addAttribute("dto", dto);
				return "ks/teamupdate";
			} 
			
			//글 수정 기능2
			@PostMapping("/ks/teamupdate")
			public String teamupdate2(BoardDto dto) {
				service.teamupdate(dto);
				return "redirect:teamboard";
			} 
			
			// 파일 업로드 기능
			private String teamupload(MultipartFile file, HttpServletRequest request) {
				String origName = file.getOriginalFilename();
				int index = origName.lastIndexOf(".");
				String ext = origName.substring(index + 1);// 파일 확장자 저장

				Random r = new Random();
				String fileName = System.currentTimeMillis() + "_" + r.nextInt(50) + "." + ext;

				try {
					String path = request.getServletContext().getRealPath("/mainImg");
					File f = new File(path, fileName);
					file.transferTo(f);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				return fileName;
			}
			
			// 서치 기능 부분
			@RequestMapping("/ks/teamsearch")
			public String teamsearch(String teamsearch, @RequestParam(name = "p", defaultValue = "1") int page, Model m, String teamno, HttpSession session) {
				 // uri랑 맞아야함 스트링 팀서치
							
				int empno = (int)session.getAttribute("empno");
				teamno = service.myteam(empno);
				
				int count = service.teamcountSearch(teamsearch, teamno);
		        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		        Calendar cal = Calendar.getInstance();
		        cal.add(Calendar.DAY_OF_MONTH, -1); //1일간 보이도록 하기위해서.
		        String nowday = format.format(cal.getTime());
		       
				if (count > 0) {
					int perPage = 10; 
					int startRow = (page - 1) * perPage;

					List<BoardDto> boardList = service.teamboardListSearch(teamsearch, startRow, teamno);
					
					m.addAttribute("blist", boardList);

					int pageNum = 5;
					int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // 전체 페이지 수

					int begin = (page - 1) / pageNum * pageNum + 1;
					int end = begin + pageNum - 1;
					if (end > totalPages) {
						end = totalPages;
					}
					m.addAttribute("begin", begin); 
					m.addAttribute("end", end);
					m.addAttribute("pageNum", pageNum);
					m.addAttribute("totalPages", totalPages);
				}
				m.addAttribute("nowday",nowday);
				m.addAttribute("count", count);
				m.addAttribute("search", teamsearch);
				return "ks/teamsearch";
			}
// 부서게시판[end]				
				
			
// 자유게시판[start]			
			// 자유게시판 작성폼 띄우는 부분
			@GetMapping("/ks/freewrite")
			public String freeWriteform(Model m, HttpSession session) {
				int empno = (int) session.getAttribute("empno");
				EmployeeDto dto = e_service.selectEmp(empno);
				
				m.addAttribute("dto", dto);
				return "ks/freewrite";
			}
			// 자유게시판 작성페이지에서 입력한 데이터를 보내는 역할.
			@PostMapping("/ks/freewrite")
			public String freeWriteform2(BoardDto dto, MultipartFile file, HttpServletRequest request, Model m) {

				if (!file.getOriginalFilename().equals("")) {
					String fileName = freeupload(file, request);

					//dto.setFile1(file.getOriginalFilename());
					dto.setPath("/mainImg/"+fileName); // 경로
					dto.setOriginalname(fileName); // 원본이름
				}
				
				service.freeinsertFile(dto);
				return "redirect:/ks/freeboard";
			}
			//자유게시판 페이징 부분과 목록 글들이 보이는 부분 
			@RequestMapping("/ks/freeboard")
			public String freelist(@RequestParam(name = "p", defaultValue = "1") int page, Model m) {
				
				int count = service.freecount();
		        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		        Calendar cal = Calendar.getInstance();
		        cal.add(Calendar.DAY_OF_MONTH, -1); //1일간 보이도록 하기위해서.
		        String nowday = format.format(cal.getTime());
				if (count > 0) {
					int perPage = 10; 
					int startRow = (page - 1) * perPage;

					List<BoardDto> boardList = service.freelist(startRow);

					m.addAttribute("blist", boardList);

					int pageNum = 5;
					int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0);

					int begin = (page - 1) / pageNum * pageNum + 1;
					int end = begin + pageNum - 1;
					if (end > totalPages) {
						end = totalPages;
					}
					m.addAttribute("begin", begin);
					m.addAttribute("end", end);
					m.addAttribute("pageNum", pageNum);
					m.addAttribute("totalPages", totalPages);
				}
				m.addAttribute("nowday",nowday);
				m.addAttribute("count", count);
				return "ks/freeboard";
			}
			
			// 상세 페이지 부분
			   @GetMapping("/ks/freeboard/{boardno}")
			   public String freecontent(@PathVariable int boardno, Model m, HttpSession session) {
				   
					  int empno = (int) session.getAttribute("empno");
					  EmployeeDto dto1 = e_service.selectEmp(empno);
					  m.addAttribute("dto1", dto1);
			 
				  BoardDto dto = service.freelistOne(boardno);
			      m.addAttribute("dto", dto);
			      
			      List<CommDto> cList = c_service.freeselectComm(boardno); // 댓글 기능.
			      m.addAttribute("cList", cList); 
			      
			      return "/ks/freeread";
			      
			   }
			   
			   // 글 삭제 기능
				@RequestMapping("/ks/freedelete")
				public String freedelete(int no) {
					service.freedelete(no);
					return "redirect:freeboard"; 
			   
				}
				
				//글 수정 기능1
				@GetMapping("/ks/freeupdate/{boardno}")
				public String freeupdate1(@PathVariable int boardno, Model m) {
					BoardDto dto = service.freelistOne(boardno);
					m.addAttribute("dto", dto);
					return "ks/freeupdate";
				} 
				
				//글 수정 기능2
				@PostMapping("/ks/freeupdate")
				public String freeupdate2(BoardDto dto) {
					service.freeupdate(dto);
					return "redirect:freeboard";
				} 
				
				// 파일 업로드 기능
				private String freeupload(MultipartFile file, HttpServletRequest request) {
					String origName = file.getOriginalFilename();
					int index = origName.lastIndexOf(".");
					String ext = origName.substring(index + 1);// 파일 확장자 저장

					Random r = new Random();
					String fileName = System.currentTimeMillis() + "_" + r.nextInt(50) + "." + ext;

					try {
						String path = request.getServletContext().getRealPath("/mainImg");
						File f = new File(path, fileName);
						file.transferTo(f);
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					return fileName;
				}
				
				// 서치 기능 부분
				@RequestMapping("/ks/freesearch")
				public String freesearch(String freesearch, @RequestParam(name = "p", defaultValue = "1") int page, Model m) {
					
					int count = service.freecountSearch(freesearch);
			        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			        Calendar cal = Calendar.getInstance();
			        cal.add(Calendar.DAY_OF_MONTH, -1); //1일간 보이도록 하기위해서.
			        String nowday = format.format(cal.getTime());
					if (count > 0) {
						int perPage = 10; 
						int startRow = (page - 1) * perPage;

						List<BoardDto> boardList = service.freeboardListSearch(freesearch, startRow);

						m.addAttribute("blist", boardList);

						int pageNum = 5;
						int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // 전체 페이지 수

						int begin = (page - 1) / pageNum * pageNum + 1;
						int end = begin + pageNum - 1;
						if (end > totalPages) {
							end = totalPages;
						}
						m.addAttribute("begin", begin); 
						m.addAttribute("end", end);
						m.addAttribute("pageNum", pageNum);
						m.addAttribute("totalPages", totalPages);
					}
					m.addAttribute("nowday",nowday);
					m.addAttribute("count", count);
					m.addAttribute("search", freesearch);
					return "ks/freesearch";
				}
	// 부서게시판[end]		
				
}

