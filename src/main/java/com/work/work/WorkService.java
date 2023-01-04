package com.work.work;

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
}
