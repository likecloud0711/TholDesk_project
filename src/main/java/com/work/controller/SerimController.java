package com.work.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SerimController {

	@RequestMapping("/serim")
	@ResponseBody
	public String serim() {
		return "rerim";
	}
}
