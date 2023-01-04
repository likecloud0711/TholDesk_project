package com.work.work;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class WorkController {
	@Autowired
	WorkService workService;
	
	@GetMapping("/work/insertView")
	public ModelAndView workInsert() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/work/insert");
		
		return mav;
	}
	
	@PostMapping("/createWork")
	@ResponseBody
	public void createWork(HttpSession session) {
		int empno = (int) session.getAttribute("empno");
		int cnt = workService.insertWork(empno);
		String code = "";
		
		if(cnt == 1) {
			code = "success";
		}
		
	}
	
	@PostMapping("/updateWork")
	public void updateWork(int empno) {
		int cnt = workService.updateEmp(empno);
	}
}
