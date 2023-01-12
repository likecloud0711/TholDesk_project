package com.work.ks.board.dao;

import java.util.List; 

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.work.ks.board.dto.CommDto;


@Mapper
public interface CommDao {
	
	@Select("select * from reply natural join employee where boardno = #{boardno} order by replydate desc")
	List<CommDto> selectComm(int boardno);
	@Select("select * from teamreply natural join employee where boardno = #{boardno} order by replydate desc")
	List<CommDto> teamselectComm(int boardno);
	@Select("select * from freereply natural join employee where boardno = #{boardno} order by replydate desc")
	List<CommDto> freeselectComm(int boardno);
	
	@Insert("insert into reply(empno, replycont, replydate, boardno) values(#{empno}, #{replycont}, now(), #{boardno})")
	int insertComm(CommDto dto);
	@Insert("insert into teamreply(empno, replycont, replydate, boardno) values(#{empno}, #{replycont}, now(), #{boardno})")
	int teaminsertComm(CommDto dto);
	@Insert("insert into freereply(empno, replycont, replydate, boardno) values(#{empno}, #{replycont}, now(), #{boardno})")
	int freeinsertComm(CommDto dto);
	
	@Delete("delete from reply where replyno = #{replyno}")
	int deleteComm(int replyno);
	@Delete("delete from teamreply where replyno = #{replyno}")
	int teamdeleteComm(int replyno);
	@Delete("delete from freereply where replyno = #{replyno}")
	int freedeleteComm(int replyno);


}
