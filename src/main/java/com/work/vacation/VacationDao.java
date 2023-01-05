package com.work.vacation;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.work.vacation.VacationDto;

@Mapper
public interface VacationDao {
	public int insertVac(VacationDto vacDto);
	
	public List<VacationDto> selectVac(int empno);
	
	public List<VacationDto> selectsgn(int empno);
	
	public VacationDto vacationDetail(int vacno);
	
	public int injectVac(int vacno);
	
	public int approveVac(int vacno);
}
