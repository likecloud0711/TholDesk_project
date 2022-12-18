package com.work.employee;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestParam;

import com.work.employee.EmployeeDto;

@Mapper
public interface EmployeeDao {
	public int empInsert(EmployeeDto empDto);
	
	public int pwdCheck(Map<String, Object> map);
	
	public EmployeeDto selectEmp(int empno);
	
	public int updateEmp(EmployeeDto empDto);
	
	public int deleteEmp(int empno);
}
