package com.work.sr.cal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.work.sr.cal.dao.CalDao;
import com.work.sr.cal.dto.CalDto;

@Service
public class CalService {
	
	@Autowired
	CalDao dao;
	
	public List<CalDto> All(){
		return dao.All();
	}
	
	public int schPopup(CalDto dto) {
		return dao.schPopup(dto);
	}
	
}
