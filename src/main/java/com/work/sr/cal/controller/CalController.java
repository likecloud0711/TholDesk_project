package com.work.sr.cal.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.work.sr.cal.dto.CalDto;
import com.work.sr.cal.service.CalService;



@Controller
public class CalController {
	
	@Autowired
	CalService service;
	
	
	@GetMapping("/Calendar/CldMain") //캘린더 메인 
		public String All(Model m, HttpSession session, String teamno) {	
		int empno = (int)session.getAttribute("empno");
		teamno = service.myteam(empno);
		
		
		List<CalDto> dto = service.All(teamno);
		m.addAttribute("dto", dto);
		
		m.addAttribute("teamno", teamno);
		
		return "/Calendar/CldMain";
	}
	
	@GetMapping("/Calendar/CalPopup") // 일정추가 팝업 페이지
		public String schPopup(CalDto dto, HttpSession session, Model m) {
		
		
		int empno = (int)session.getAttribute("empno");
		String teamno = service.myteam(empno);
		m.addAttribute("teamno", teamno);
		
		
		return "/Calendar/CalPopup";
	}
	
	@PostMapping("/Calendar/CalPopup") //일정 추가 폼 
		public String schPopupForm(Model m, CalDto dto, HttpSession session) {	
		dto.setEddt(dto.getEddt()+" 00:01:01");
		service.schPopup(dto);
		return "/Calendar/CalPopupClose";
	}
	
	@DeleteMapping("/Calendar/CalDelte")
	@ResponseBody
	public String delete(CalDto dto, HttpSession session) {
		System.out.println(dto.getCalname()+" "+dto.getStdt());
		int i = service.delete(dto);
		session.getAttribute("empno");
		
		return ""+i;
	}
	
	@GetMapping("/Calendar/TeamSch/{teamno}")
		public String TeamSch(Model m, HttpSession session,@PathVariable String teamno) {
		
		int empno = (int)session.getAttribute("empno");
		
		
		List<CalDto> dto = service.TeamSch(teamno);
		
		System.out.println(dto);
		m.addAttribute("dto",dto);
		
		return "/Calendar/CldMain";
	}
	
	@PostMapping("/Calendar/updateSch")
	@ResponseBody
		public String updateSch(CalDto dto) {
		System.out.println(dto.getCalno());
		service.updateSch(dto);
		return "redirect:/Calendar/CldMain";
	}
		
}


