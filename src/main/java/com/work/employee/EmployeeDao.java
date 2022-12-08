package com.work.employee;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;

import com.work.employee.EmployeeDto;

@Mapper
public interface EmployeeDao {
	public int empInsert(EmployeeDto empDto);
}
