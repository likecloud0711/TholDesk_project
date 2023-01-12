package com.work.work;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WorkService {
	@Autowired
	WorkDao workDao;
	
	public int insertWork(int empno) {
		int cnt = workDao.insertWork(empno);
		
		return cnt;
	}
	
	public int updateEmp(int empno) {
		int cnt = workDao.updateEnd(empno);
		
		return cnt;
	}
	
	public WorkDto selectWork(int empno) {
		WorkDto workDto = workDao.selectWork(empno);
		
		return workDto;
	}
	
	public List<WorkDto> selectWorklist(int empno) {
		List<WorkDto> list = workDao.selectWorklist(empno);
		
		return list;
	}
}
