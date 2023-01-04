package com.work.employee;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	public List<EmployeeDto> selectAllEmp(){
		List<EmployeeDto> list = empDao.selectAllEmp();
		
		return list;
	}
	
	public List<EmployeeDto> selectBossEmp(int empno) {
		List<EmployeeDto> list = empDao.selectBossEmp(empno);
		
		return list;
	}
	
	public String selectName(int empno) {
		String empname = empDao.selectName(empno);
		
		return empname;
	}
}
