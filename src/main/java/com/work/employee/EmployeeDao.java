package com.work.employee;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmployeeDao {
	public int empInsert(EmployeeDto empDto);
	
	public int pwdCheck(Map<String, Object> map);
	
	public EmployeeDto selectEmp(int empno);
	
	public int updateEmp(EmployeeDto empDto);
	
	public int deleteEmp(int empno);
	
	public List<EmployeeDto> selectAllEmp();
	
	public List<EmployeeDto> selectBossEmp(int empno);
	
	public String selectName(int empno);
}
