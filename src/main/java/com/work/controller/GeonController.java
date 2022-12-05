package com.work.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class GeonController {
           
	@GetMapping("/test/kyung3")
	@ResponseBody
	public String test() {
		return "test";   
	}
	
	//test test
	
	@GetMapping("/test/kyung4")
	@ResponseBody
	public String test2() {
		return "test2";   
	}
}