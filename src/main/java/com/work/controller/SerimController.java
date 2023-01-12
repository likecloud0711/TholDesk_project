package com.work.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.work.employee.EmployeeDto;
import com.work.employee.EmployeeService;
import com.work.ks.board.dto.BoardDto;
import com.work.ks.board.service.BoardService;
import com.work.sr.cal.dto.CalDto;
import com.work.sr.cal.service.CalService;
import com.work.sr.eapp.dto.EappDto;
import com.work.sr.eapp.service.EappService;

@Controller
public class SerimController {
	
	@Autowired
	EappService service;
	@Autowired
	CalService c_service;
	@Autowired
	BoardService b_service ;
	@Autowired
	EmployeeService e_service  ;

	@RequestMapping("/serim")
	@ResponseBody
	public String serim() {
		return "rerim";
	}
	
	public String serim2() {
		return "rerim2";
	}
	
	@GetMapping("/hello")
	public String hello() {
		return "/hello";
	}
	
	@GetMapping("/top")
	public String top() {
		return "/top";
	}
	
	@GetMapping("/main")
	public String main(@RequestParam(name="p", defaultValue="1")int page, Model m, HttpSession session, String teamno) {
		int empno = (int)session.getAttribute("empno");
		
		
		int count = service.count();
		List<CalDto> dto = c_service.All(teamno);
		teamno = c_service.myteam(empno);
		
		 EmployeeDto dto1 = e_service.selectEmp(empno);
	       
		
		if(count > 0) {
			int perPage = 5;
			int startRow = (page -1) * perPage;
	
		List<EappDto> list = service.list(startRow);
		m.addAttribute("list",list);
		List<BoardDto> boardList = b_service.list(startRow);
		 m.addAttribute("blist", boardList);
		
		int pageNum = 3;
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
	m.addAttribute("dto",dto);
	m.addAttribute("teamno", teamno);
    m.addAttribute("emp", dto1);
		return "/main";
	}
	
	
}
