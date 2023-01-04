package com.work.work;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WorkDao {
	public int insertWork(int empno);
	
	public int updateEnd(int empno);
}
