package com.work.vacation;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.work.employee.EmployeeDto;
import com.work.employee.EmployeeService;

@Controller
public class VacationController {
	@Autowired
	VacationService vacService;
	
	@Autowired
	EmployeeService empService;
	
	@GetMapping("/vacation/insert")
	public ModelAndView insertVac(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		int empno = (int) session.getAttribute("empno");
		List<EmployeeDto> list = empService.selectBossEmp(empno);
		
		mav.setViewName("/vacation/insert");
		mav.addObject("list", list);
		
		return mav;
	}
	
	@PostMapping("/vacCreate")
	public ModelAndView createVac(VacationDto vacDto) {
		ModelAndView mav = new ModelAndView();
		
		int cnt = vacService.insertVac(vacDto);
		if(cnt == 1) {
			mav.setViewName("/employee/ok");
		}
		return mav;
	}
	
	@GetMapping("/vacation/list")
	public ModelAndView ListVac(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int empno = (int) session.getAttribute("empno");
		List<VacationDto> list = vacService.selectVac(empno);
		
		for(int i=0; i<list.size();i++) {
			int empno1 = list.get(i).getEmpno();
			int empno2 = list.get(i).getSigner1();
			int empno3 = list.get(i).getSigner2();
			
			String name1 = empService.selectName(empno1);
			String name2 = empService.selectName(empno2);
			String name3 = empService.selectName(empno3);
			
			list.get(i).setempnm(name1);
			list.get(i).setSigner1name(name2);
			list.get(i).setSigner2name(name3);
		}
		
		mav.setViewName("/vacation/list");
		mav.addObject("list", list);
		
		return mav;
	}
	
	@GetMapping("/vacation/signer")
	public ModelAndView ListSgn(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int empno = (int) session.getAttribute("empno");
		List<VacationDto> list = vacService.selectsgn(empno);
		
		for(int i=0; i<list.size();i++) {
			int empno1 = list.get(i).getEmpno();
			
			String name1 = empService.selectName(empno1);
			
			list.get(i).setempnm(name1);
			
		}
		
		mav.setViewName("/vacation/signList");
		mav.addObject("list", list);
		
		return mav;
	}
	
	@GetMapping("/vacation/detail")
	public ModelAndView vacationDetail(int vacno) {
		ModelAndView mav = new ModelAndView();
		
		VacationDto vacDto = vacService.vacationDetail(vacno);
	
		int empno1 = vacDto.getEmpno();
		int empno2 = vacDto.getSigner1();
		int empno3 = vacDto.getSigner2();
		
		String name1 = empService.selectName(empno1);
		String name2 = empService.selectName(empno2);
		String name3 = empService.selectName(empno3);
		
		vacDto.setempnm(name1);
		vacDto.setSigner1name(name2);
		vacDto.setSigner2name(name3);
	
		mav.setViewName("/vacation/detail");
		mav.addObject("vacDto", vacDto);
		
		return mav;
	}
	
	@PostMapping("/injectVac")
	public ModelAndView injectVac(int vacno) {
		ModelAndView mav = new ModelAndView();
		
		int cnt = vacService.injectVac(vacno);
		if(cnt == 1) {
			mav.setViewName("redirect:/vacation/signer");
		}
		
		return mav;
	}
	
	@PostMapping("/approveVac")
	public ModelAndView approveVac(int vacno) {
		ModelAndView mav = new ModelAndView();
		
		int cnt = vacService.approveVac(vacno);
		if(cnt == 1) {
			mav.setViewName("redirect:/vacation/signer");
		}
		
		return mav;
	}
	
}
