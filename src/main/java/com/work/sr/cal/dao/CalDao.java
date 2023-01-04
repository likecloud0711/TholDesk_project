package com.work.sr.cal.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.work.sr.cal.dto.CalDto;

@Mapper
public interface CalDao {
	@Select("select * from calendar natural join team where teamno in (10, #{teamno})") //전체 일정
	List<CalDto> All(String teamno);
	
	@Insert("insert into calendar (calno, stdt, eddt, calname, place, memo, teamno) values(#{calno}, #{stdt}, #{eddt}, #{calname}, #{place}, #{memo}, #{teamno})")
	int schPopup(CalDto dto);
	
	@Delete("delete from calendar where calname = #{calname} and stdt = #{stdt}")
	int delete(CalDto dto);
	
	@Select("select * from calendar where teamno = #{teamno}") //해당 부서원만 볼 수 있게
	List<CalDto> TeamSch(String teamno);
	
	@Select("select teamno from employee where empno = #{empno}")
	String myteam(int empno);
	
	@Update("update calendar set stdt = #{stdt}, eddt = #{eddt} where calno = #{calno}")
	int updateSch(CalDto dto);
}
