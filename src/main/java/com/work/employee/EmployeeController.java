package com.work.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EmployeeController {
	@Autowired
	EmployeeService empService;
	
	@GetMapping("/insert")
	public ModelAndView empInsert() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/employee/insert");
		
		return mav;
	}
	
	@RequestMapping(value="/create", method = {RequestMethod.POST, RequestMethod.GET})
	  public ModelAndView create(EmployeeDto empDto){
	    ModelAndView mav = new ModelAndView();
	    
	    System.out.println(empDto.getEmpnm());
	    
	    int cnt= empService.empInsert(empDto);
	    
	    if (cnt == 1) {
	      mav.setViewName("/employee/ok");
	      
	    }
	    
	    mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
	    
	    return mav;
	  }
}
