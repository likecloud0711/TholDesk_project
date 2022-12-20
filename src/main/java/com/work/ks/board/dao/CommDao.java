package com.work.ks.board.dao;

import java.util.List; 

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.work.ks.board.dto.CommDto;


@Mapper
public interface CommDao {
	
	@Select("select * from reply where boardno = #{boardno} order by replydate desc")
	List<CommDto> selectComm(int boardno);
	
	@Insert("insert into reply(empno, replycont, replydate, boardno) values(#{empno}, #{replycont}, now(), #{boardno})")
	int insertComm(CommDto dto);
	
	@Delete("delete from reply where replyno = #{replyno}")
	int deleteComm(int replyno);

}
