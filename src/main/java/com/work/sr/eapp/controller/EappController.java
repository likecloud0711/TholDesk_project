package com.work.sr.eapp.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.work.employee.EmployeeDto;
import com.work.employee.EmployeeService;
import com.work.sr.eapp.dto.EappDto;
import com.work.sr.eapp.service.EappService;




@Controller
public class EappController {
	
	@Autowired
	EappService service;
	@Autowired
	EmployeeService empService;
	
	@GetMapping("/Eapp/eapproval")
	public String sr(@RequestParam(name="p", defaultValue="1")int page, Model m, HttpSession session) {
		int count = service.count();
		
		if(count > 0) {
			int perPage = 5;
			int startRow = (page -1) * perPage;
	
		List<EappDto> list = service.list(startRow);
		m.addAttribute("list",list);
		/*int empno = (int) session.getAttribute("empno");
		
		 * EmployeeDto empDto = empService.selectEmp(empno);
		 * 
		 * m.addAttribute("emp", empDto);
		 */
		
		int pageNum = 5;
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0);

		int begin = (page -1) / pageNum * pageNum + 1;
		int end = begin + pageNum -1;
		if(end > totalPages) {
			end = totalPages;
		}
		m.addAttribute("begin", begin);
		m.addAttribute("end",end);
		m.addAttribute("pageNum", pageNum);
		m.addAttribute("totalPages", totalPages);
	}
	m.addAttribute("count",count);
		
		return "/Eapp/eapproval";
	}
    
	@GetMapping("/Eapp/write") // 작성페이지
	public String writeform(Model m) {
		
		List<Map<String, Object>> elist = service.signer();
		m.addAttribute("elist", elist);
		
		return "/Eapp/write";
	}
	
	@PostMapping("/Eapp/write")
	public String write(EappDto dto, HttpSession session) {
		int empno = (int) session.getAttribute("empno");
		dto.setEmpno(empno);
		service.insert(dto);
		return "redirect:/Eapp/eapproval";
	}
	
	@PostMapping("/Eapp/outbox")
	public String outbox(EappDto dto, HttpSession session) {
		int empno = (int) session.getAttribute("empno");
		dto.setEmpno(empno);
		service.outbox(dto);
		return "redirect:/Eapp/eapproval";
	}
	
	@GetMapping("/Eapp/sign2")
	@ResponseBody()
	public String sign2(int empno) {
		List<Map<String, Object>> elist2 = service.signer2(empno);
		Gson gson = new Gson() ;
		String text = gson.toJson(elist2);
		return text;	
	}
	
	@GetMapping("/Eapp/content/{opno}") //상세보기 페이지 
	public String content(@PathVariable int opno, Model m) {
		EappDto dto = service.listOne(opno);


		m.addAttribute("dto", dto);

		String signer1 = service.opsign1(opno);
		m.addAttribute("signer1",signer1);

		String signer2 = service.opsign2(opno);
		m.addAttribute("signer2",signer2);
		
	int formno = dto.getFormno();
	if(formno == 1) {
		return "/Eapp/cont_1";
	}
	if(formno == 2) {
		return "/Eapp/cont_2";
	}
	if(formno == 3) {
		return "/Eapp/cont_3";
	}

		return "/Eapp/content";
		
	}
	
	@GetMapping("/Eapp/update/{opno}") //수정페이지 뷰
	public String updateEapp(@PathVariable int opno, Model m, HttpSession session) {
		EappDto dto = service.listOne(opno);
		m.addAttribute("dto", dto);
		
		int empno = (int) session.getAttribute("empno");
		dto.setEmpno(empno);
		
		return "/Eapp/update";
	}
	
	@PutMapping("/Eapp/update") // 수정페이지 값
	public String update(EappDto dto, HttpSession session) {
		service.updateEapp(dto);
		
		int empno = (int) session.getAttribute("empno");
		dto.setEmpno(empno);
		
		return "redirect:eapproval";
	}
	
	@DeleteMapping("/Eapp/delete") //문서 삭제
	@ResponseBody
	public String delete(int opno, HttpSession session) {
		int i = service.delete(opno);
		session.getAttribute("empno");
		
		return ""+i;
	}
	
	@GetMapping("/Eapp/signlist") //결재처리 해야할 목록 
	public String signlist(Model m, HttpSession session) {
		int empno = (int) session.getAttribute("empno");
		
		List<EappDto> dto = service.signlist(empno); //이후 세션 만들어지면 변경해야함. 현재 signlist 안에 사번 바꿔주면 그대로 페이지에 뜸. Good.. 
		m.addAttribute("dto", dto);
		
		return "/Eapp/signlist";
	}
	
	@GetMapping("/Eapp/signcontent/{opno}") //결재처리 해야할 페이지 
	public String signcontent(@PathVariable int opno, Model m, HttpSession session) {
		EappDto dto = service.listOne(opno);
		m.addAttribute("dto", dto);
		
		int empno = (int) session.getAttribute("empno");
		dto.setEmpno(empno);
		
		String signer1 = service.opsign1(opno);
		m.addAttribute("signer1",signer1);

		String signer2 = service.opsign2(opno);
		m.addAttribute("signer2",signer2);
		
		
		int formno = dto.getFormno();
		if(formno == 1) {
			return "/Eapp/signcont_1";
		}
		if(formno == 2) {
			return "/Eapp/signcont_2";
		}
		if(formno == 3) {
			return "/Eapp/signcont_3";
		}
		
		
		return "/Eapp/signcontent";
		
	}
	
	@GetMapping("/Eapp/rejectpage/{opno}") //반려 사유 보는 페이지
	public String rejectpage(@PathVariable int opno, Model m,HttpSession session) {
		EappDto dto = service.listOne(opno);
		m.addAttribute("dto", dto);
		
		int empno = (int) session.getAttribute("empno");
		dto.setEmpno(empno);
		
		return "/Eapp/rejectpage";
	}
	
	@GetMapping("/Eapp/signcontent") // 승인처리
	public String signdone(int opno, int opstatus, HttpSession session) {
		service.signdone(opno, opstatus);
		
		session.getAttribute("empno");
		
		return "redirect:eapproval";
	}
	
	@GetMapping("/Eapp/returncontent") 
	public String returnsign(int opno, HttpSession session) { //반려처리
		service.returnsign(opno);
		session.getAttribute("empno");
		return "redirect:eapproval";
	}
	
	@GetMapping("/Eapp/permission") //승인 된 결재 목록
	public String permission(Model m, HttpSession session) {
		List<EappDto> pmlist = service.permission();
		m.addAttribute("pmlist", pmlist );
		
		session.getAttribute("empno");
		
		
		
		return "/Eapp/permission";
	}
	
	@GetMapping("/Eapp/waiting") // 대기 상태인 문서 목록
	public String waiting(Model m, HttpSession session) {
		List<EappDto> wlist = service.waiting();
		m.addAttribute("wlist", wlist );
		
		session.getAttribute("empno");
		
		return "/Eapp/waiting";
	}
	
	@GetMapping("/Eapp/reject") // 반려 상태인 문서 목록
	public String reject(Model m, HttpSession session) {
		List<EappDto> relist = service.reject();
		m.addAttribute("relist", relist );
		
		session.getAttribute("empno");
		
		return "/Eapp/reject";
	}
	
	@GetMapping("/Eapp/outboxpage") // 임시보관함
	public String outboxpage(Model m, HttpSession session) {
		List<EappDto> oblist = service.outboxpage();
		m.addAttribute("oblist", oblist);
		
		session.getAttribute("empno");
		return "/Eapp/outboxpage";
	}
	
	@GetMapping("/Eapp/search") 
	public String search(int searchn, String search, @RequestParam(name="p", defaultValue = "1") int page, Model m) {
		int count = service.countSearch(searchn, search);
		if(count > 0) {
			int perPage = 10; // 한 페이지에 보일 글의 갯수
			int startRow = (page -1) * perPage;
			//int endRow = page * perPage;
			
			List<EappDto> EappSearch = service.EappSearch(searchn, search, startRow);
			
			m.addAttribute("esList", EappSearch);
			
			int pageNum = 5;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // 전체 페이지 갯수 
			
			int begin = (page -1) / pageNum * pageNum;
			int end = begin + pageNum -1;
			if(end > totalPages) {
				end = totalPages;
			}
			m.addAttribute("begin", begin);
			m.addAttribute("pageNum", pageNum);
			m.addAttribute("totalPages", totalPages);
			m.addAttribute("end", end);
		}
			m.addAttribute("count", count);
			m.addAttribute("searchn", searchn);
			m.addAttribute("search", search);
			
			return "/Eapp/search";
	}
	
	@GetMapping("/Eapp/rejectcont/{opno}") //반려 상세 보기
	public String rejectcont(@PathVariable int opno, Model m, HttpSession session) {
		service.returnsign(opno);
		EappDto dto = service.listOne(opno);
		m.addAttribute("dto", dto);
		
		session.getAttribute("empno");
		
		return "/Eapp/rejectcont";
	}
	@PostMapping("/Eapp/rejectcont") // 반려 상세보기에서 수정
	public String rejectcont(EappDto dto, HttpSession session) {
		service.rejectcont(dto);
		
		session.getAttribute("empno");
		
		return "redirect:/Eapp/eapproval";
	}
	
}
