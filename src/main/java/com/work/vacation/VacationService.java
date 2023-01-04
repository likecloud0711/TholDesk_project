package com.work.vacation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VacationService {
	@Autowired
	VacationDao vacDao;
	public int insertVac(VacationDto vacDto){
		int cnt = vacDao.insertVac(vacDto);
		
		return cnt;
	}
	
	public List<VacationDto> selectVac(int empno) {
		List<VacationDto> list = vacDao.selectVac(empno);
		
		return list;
	}
	
	public List<VacationDto> selectsgn(int empno) {
		List<VacationDto> list = vacDao.selectsgn(empno);
		
		return list;
	}
	
	public VacationDto vacationDetail(int vacno) {
		VacationDto vacDto = vacDao.vacationDetail(vacno);
		
		return vacDto;
	}
	
	public int injectVac(int vacno) {
		int cnt = vacDao.injectVac(vacno);
		
		return cnt;
	}
	
	public int approveVac(int vacno) {
		int cnt = vacDao.approveVac(vacno);
		
		return cnt;
	}
}
