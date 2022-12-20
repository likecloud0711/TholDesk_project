package com.work.sr.cal.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.work.sr.cal.dto.CalDto;

@Mapper
public interface CalDao {
	@Select("select * from calendar") //전체 일정
	List<CalDto> All();
	
	@Insert("insert into calendar (calno, stdt, eddt, calname, place, memo, teamno) values(#{calno}, #{stdt}, #{eddt}, #{calname}, #{place}, #{memo}, #{teamno})")
	int schPopup(CalDto dto);
}
