package com.work.sr.cal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.work.sr.cal.dto.CalDto;
import com.work.sr.cal.service.CalService;

@Controller
public class CalController {
	
	@Autowired
	CalService service;
	
	
	@GetMapping("/Calendar/CldMain") //캘린더 메인 
		public String All(Model m) {	
		List<CalDto> dto = service.All();
		m.addAttribute("dto", dto);
		return "/Calendar/CldMain";
	}
	
	@GetMapping("/Calendar/CalPopup")
		public String schPopup(CalDto dto) {
		return "/Calendar/CalPopup";
	}
	
	@PostMapping("/Calendar/CalPopup")
		public String schPopupForm(CalDto dto) {
		service.schPopup(dto);
		return "/Calendar/CalPopupClose";
	}
}

