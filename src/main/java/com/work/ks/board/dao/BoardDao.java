package com.work.ks.board.dao;

import java.util.List; 
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.work.ks.board.dto.BoardDto;


@Mapper
public interface BoardDao {
	
	@Insert("insert into board (boardno, empno, boardtitle, announceyn, boardcontents, boarddate) values(#{boardno}, #{empno}, #{boardtitle}, #{announceyn}, #{boardcontents}, #{boarddate})")
	int insert(BoardDto dto);
  
	// 페이지 기능
	@Select("select count(*) from board")
	int count(); // 개수 알수있도록 . 얘 만들었으니 이제 서비스로
	
	// 페이지 기능 and 입력한 목록 보여주는 역할
	@Select("select * from board order by boardno desc limit #{start}, #{count}")
	List<BoardDto> list(Map<String, Object> m);
	
	// 입력한 게시판 번호에 맞는 것들을 가져오는 역할
	@Select("select * from board where boardno = #{boardno}")
	BoardDto listOne(int boardno); 
	
	// 글 삭제 기능
    @Delete("delete from board where boardno = #{boardno}") 
    int delete(int no);
    
	// 글 수정기능
	@Update("update board set boardtitle=#{boardtitle}, boardcontents=#{boardcontents} where boardno = #{boardno}") 
    int update(BoardDto dto); 
	
	// 조회수 기능
	@Update("update board set readcount = readcount + 1 where boardno = #{boardno}")
	int updateReadcount(int no);

}
