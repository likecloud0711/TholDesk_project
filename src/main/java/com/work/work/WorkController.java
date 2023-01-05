package com.work.work;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


@RestController
public class WorkController {
	@Autowired
	WorkService workService;
	
	@GetMapping("/work/insertView")
	public ModelAndView workInsert(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int empno = (int) session.getAttribute("empno");
		mav.setViewName("/work/insert");
		
		WorkDto workDto = workService.selectWork(empno);
		if(workDto != null) {
			mav.addObject("workDto", workDto);
		}
		List<WorkDto> list = workService.selectWorklist(empno);
		mav.addObject("list", list);
		
		return mav;
	}
	
	@PostMapping("/createWork")
	public ModelAndView createWork(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int empno = (int) session.getAttribute("empno");
		int cnt = workService.insertWork(empno);
		
		mav.setViewName("redirect:/work/insertView");
		
		return mav;
	}
	
	@PostMapping("/updateWork")
	public ModelAndView updateWork(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int empno = (int) session.getAttribute("empno");
		int cnt = workService.updateEmp(empno);
		
		mav.setViewName("redirect:/work/insertView");
		
		return mav;
	}
	
}
