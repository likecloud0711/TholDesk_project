package com.work.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class KyungController {
           
	@GetMapping("/test/kyung")
	@ResponseBody
	public String test() {
		return "test";   
	}
	
	//test test
}
