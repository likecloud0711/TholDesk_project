package com.work.ks.board.controller;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.work.ks.board.dto.CommDto;
import com.work.ks.board.service.CommService;



@RestController
public class CommController {
	@Autowired
	CommService service;
	
	@GetMapping("/comm/insert")
	public String insertComm(CommDto dto) {
		service.insertComm(dto);
		List<CommDto> cList = service.selectComm(dto.getBoardno());
		Gson gson = new Gson();
		
		return gson.toJson(cList); // List -> js.array

	}
	
	@GetMapping("/comm/delete/{replyno}")
	public String deleteComm(@PathVariable int replyno) {
		int i = service.deleteComm(replyno);
		return i+"";
	}
}
