package com.work.work;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.work.vacation.VacationDto;

@Mapper
public interface WorkDao {
	public int insertWork(int empno);
	
	public int updateEnd(int empno);
	
	public WorkDto selectWork(int empno);
	
	public List<WorkDto> selectWorklist(int empno);
}
