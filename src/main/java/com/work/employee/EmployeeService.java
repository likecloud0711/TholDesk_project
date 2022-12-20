package com.work.employee;

import java.util.HashMap;
import java.util.Map;

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
	
	public int pwdCheck(Map<String, Object> map) {
		int cnt = empDao.pwdCheck(map);
		
		return cnt;
	}
	
	public EmployeeDto selectEmp(int empno) {
		EmployeeDto empDto = empDao.selectEmp(empno);
		
		return empDto;
	}
	
	public int updateEmp(EmployeeDto empDto) {
		int cnt = empDao.updateEmp(empDto);
				
		return cnt;
	}
	
	public int deleteEmp(int empno) {
		int cnt = empDao.deleteEmp(empno);
		
		return cnt;
	}
}
