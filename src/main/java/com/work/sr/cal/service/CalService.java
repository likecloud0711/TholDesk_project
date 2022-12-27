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
	
	public List<CalDto> All(String teamno){
		return dao.All(teamno);
	}
	
	public int schPopup(CalDto dto) {
		return dao.schPopup(dto);
	}
	
	public int delete(CalDto dto) {
		return dao.delete(dto);
	}
	
	public List<CalDto> TeamSch(String teamno){
		return dao.TeamSch(teamno);
	}
	
	public String myteam(int empno) {
		return dao.myteam(empno);
	}
	public int updateSch(CalDto dto) {
		return dao.updateSch(dto);
	}
}
