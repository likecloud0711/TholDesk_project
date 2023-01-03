package com.work.ks.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.work.ks.board.dto.BoardDto;


@Mapper
public interface BoardDao {
	
	@Insert("insert into board (boardno, empno, boardtitle, announceyn, boardcontents, boarddate) values(#{boardno}, #{empno}, #{boardtitle}, #{announceyn}, #{boardcontents}, #{boarddate})")
	int insert(BoardDto dto);
	@Insert("insert into teamboard (boardno, empno, boardtitle, announceyn, boardcontents, boarddate) values(#{boardno}, #{empno}, #{boardtitle}, #{announceyn}, #{boardcontents}, #{boarddate})")
	int teaminsert(BoardDto dto);
	@Insert("insert into freeboard (boardno, empno, boardtitle, announceyn, boardcontents, boarddate) values(#{boardno}, #{empno}, #{boardtitle}, #{announceyn}, #{boardcontents}, #{boarddate})")
	int freeinsert(BoardDto dto);
  
	// 공지사항 페이지 기능
	@Select("select count(*) from board")
	int count(); // 개수 알수있도록 
	// 부서게시판 페이지 기능
	@Select("select count(*) from teamboard natural join employee where teamno = #{teamno}")
	int teamcount(String teamno);
	// 자유게시판 페이지 기능
	@Select("select count(*) from freeboard")
	int freecount(); 

	// 공지사항 페이지 기능 and 입력한 목록 보여주는 역할 and natural join employee를 씀으로써 empnm 가져올 수 있음
	@Select("select * from board natural join employee order by boardno desc limit #{start}, #{count}")
	List<BoardDto> list(Map<String, Object> m);
	// 부서게시판 페이지 기능 and 입력한 목록 보여주는 역할
	@Select("select * from teamboard natural join employee where teamno = #{teamno} order by boardno desc limit #{start}, #{count}")
	List<BoardDto> teamlist(Map<String, Object> m);
	// 자유게시판 페이지 기능 and 입력한 목록 보여주는 역할
	@Select("select * from freeboard natural join employee order by boardno desc limit #{start}, #{count}")
	List<BoardDto> freelist(Map<String, Object> m);
	
	// 부서게시판 같은 부서원들끼리만 이용가능하게 하는 역할
	@Select("select teamno from employee where empno = #{empno}")
	String myteam(int empno);

	// 입력한 게시판 번호에 맞는 것들을 가져오는 역할
	@Select("select * from board natural join employee where boardno = #{boardno}")
	BoardDto listOne(int boardno); 
	@Select("select * from teamboard natural join employee where boardno = #{boardno}")
	BoardDto teamlistOne(int boardno); 
	@Select("select * from freeboard natural join employee where boardno = #{boardno}")
	BoardDto freelistOne(int boardno); 
	
	// 글 삭제 기능
    @Delete("delete from board natural join employee where boardno = #{boardno}") 
    int delete(int no);
    @Delete("delete from teamboard natural join employee where boardno = #{boardno}") 
    int teamdelete(int no);
    @Delete("delete from freeboard natural join employee where boardno = #{boardno}") 
    int freedelete(int no);
    
	// 글 수정기능
	@Update("update board set boardtitle=#{boardtitle}, boardcontents=#{boardcontents} where boardno = #{boardno}") 
    int update(BoardDto dto); 
	@Update("update teamboard set boardtitle=#{boardtitle}, boardcontents=#{boardcontents} where boardno = #{boardno}") 
    int teamupdate(BoardDto dto); 
	@Update("update freeboard set boardtitle=#{boardtitle}, boardcontents=#{boardcontents} where boardno = #{boardno}") 
    int freeupdate(BoardDto dto); 
	
	// 조회수 기능
	@Update("update board set readcount = readcount + 1 where boardno = #{boardno}")
	int updateReadcount(int no);
	@Update("update teamboard set readcount = readcount + 1 where boardno = #{boardno}")
	int teamupdateReadcount(int no);
	@Update("update freeboard set readcount = readcount + 1 where boardno = #{boardno}")
	int freeupdateReadcount(int no);
	
	// 파일 업로드
	@Insert("insert into board (empno, boardtitle, originalname, path, boarddate, boardcontents, announceyn) "
			+ "values (#{empno}, #{boardtitle}, #{originalname}, #{path}, #{boarddate}, #{boardcontents}, #{announceyn})")
	int insertFile(BoardDto file);
	@Insert("insert into teamboard (empno, boardtitle, originalname, path, boarddate, boardcontents, announceyn) "
			+ "values (#{empno}, #{boardtitle}, #{originalname}, #{path}, #{boarddate}, #{boardcontents}, #{announceyn})")
	int teaminsertFile(BoardDto file);
	@Insert("insert into freeboard (empno, boardtitle, originalname, path, boarddate, boardcontents, announceyn) "
			+ "values (#{empno}, #{boardtitle}, #{originalname}, #{path}, #{boarddate}, #{boardcontents}, #{announceyn})")
	int freeinsertFile(BoardDto file);
	
	// 파일 업로드
	@Select("select path, originalname from board where boardno = #{no}")
	BoardDto fileList(int no); // 하나만 가져오니까 인트 지정해서 사용.
	@Select("select path, originalname from teamboard where boardno = #{no}")
	BoardDto teamfileList(int no);
	@Select("select path, originalname from freeboard where boardno = #{no}")
	BoardDto freefileList(int no);

	// 검색. sql문은 Mapper에 따로 저장했음. choose때문에.
	List<BoardDto> boardListSearch(Map<String, Object> m);
	int countSearch(Map<String, Object> m);
	List<BoardDto> teamboardListSearch(Map<String, Object> m);
	int teamcountSearch(Map<String, Object> m);
	List<BoardDto> freeboardListSearch(Map<String, Object> m);
	int freecountSearch(Map<String, Object> m);
	
	
}
