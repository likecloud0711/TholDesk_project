package com.work.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.work.employee.EmployeeDto;

@Service
public class EmployeeService {
	@Autowired
	EmployeeDao empDao;
	
	public int empInsert(EmployeeDto empdto) {
		int cnt = empDao.empInsert(empdto);
		
		return cnt;
	}
}
