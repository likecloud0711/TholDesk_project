package com.work.ks.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.work.employee.EmployeeDto;
import com.work.employee.EmployeeService;
import com.work.ks.board.dto.CommDto;
import com.work.ks.board.service.CommService;



@RestController
public class CommController {
	@Autowired
	CommService service;
	
	@Autowired
	EmployeeService e_service;

// 공지사항 [start]
	// 공지사항 댓글
	@GetMapping("/comm/insert")
	public String insertComm(CommDto dto,HttpSession session) {
		int empno = (int) session.getAttribute("empno");
		dto.setEmpno(empno);
		service.insertComm(dto);
		List<CommDto> cList = service.selectComm(dto.getBoardno());
		Gson gson = new Gson();
		
		return gson.toJson(cList);

	}
	
	@GetMapping("/comm/delete/{replyno}")
	public String deleteComm(@PathVariable int replyno,HttpSession session, Model m) {
		
		int empno = (int) session.getAttribute("empno");
		EmployeeDto dto = e_service.selectEmp(empno);
		m.addAttribute("dto", dto);
		
		int i = service.deleteComm(replyno);
		return i+"";
	}
// 공지사항 [end]

	
// 부서게시판 [start]
	// 부서게시판 댓글
	@GetMapping("/comm/teaminsert")
	public String teaminsertComm(CommDto dto,HttpSession session) {
		int empno = (int) session.getAttribute("empno");
		dto.setEmpno(empno);
		service.teaminsertComm(dto);
		List<CommDto> cList = service.teamselectComm(dto.getBoardno());
		Gson gson = new Gson();
		
		return gson.toJson(cList); // List -> js.array

	}
	
	@GetMapping("/comm/teamdelete/{replyno}")
	public String teamdeleteComm(@PathVariable int replyno,HttpSession session, Model m) {
		
		int empno = (int) session.getAttribute("empno");
		EmployeeDto dto = e_service.selectEmp(empno);
		m.addAttribute("dto", dto);
		
		int i = service.teamdeleteComm(replyno);
		return i+"";
	}
// 부서게시판 [end]

	
// 자유게시판 [start]
	// 공지사항 댓글
	@GetMapping("/comm/freeinsert")
	public String freeinsertComm(CommDto dto,HttpSession session) {
		int empno = (int) session.getAttribute("empno");
		dto.setEmpno(empno);
		service.freeinsertComm(dto);
		List<CommDto> cList = service.freeselectComm(dto.getBoardno());
		Gson gson = new Gson();
		
		return gson.toJson(cList); // List -> js.array

	}
	
	@GetMapping("/comm/freedelete/{replyno}")
	public String freedeleteComm(@PathVariable int replyno,HttpSession session, Model m) {
		
		int empno = (int) session.getAttribute("empno");
		EmployeeDto dto = e_service.selectEmp(empno);
		m.addAttribute("dto", dto);
		
		int i = service.freedeleteComm(replyno);
		return i+"";
	}
// 자유게시판 [end]
	
}
