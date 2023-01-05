package com.work.ks.board.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.work.ks.board.dao.BoardDao;
import com.work.ks.board.dto.BoardDto;




@Service
public class BoardService {
	
	@Autowired
	BoardDao dao;

// 공지사항[start]
	//공지사항 insert
	public int insert(BoardDto dto) {
		
		Date d = new Date(); // 날짜 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");// 날짜 
		dto.setBoarddate(sdf.format(d));// 날짜 
		return dao.insert(dto);		
	}
	// 공지사항 페이지 기능
	public List<BoardDto> list(int start){
		Map<String, Object> m = new HashMap<>(); // 뒤에도 똑같이 string, object면 생략가능
		m.put("start", start);
		m.put("count", 10);
		return dao.list(m);
	}
	// 페이지 기능 
	public int count() { 
		return dao.count(); 
	}
	
	// 상세 페이지 기능 
   public BoardDto listOne(int boardno) {
	   dao.updateReadcount(boardno); // and 조회수 기능
	   return dao.listOne(boardno);
	}
	//글 삭제 기능
	public int delete(int no) {
	return dao.delete(no);
	}
	//글 수정 기능
	public int update(BoardDto dto) {
		return dao.update(dto);
	}
	// 파일 업로드
	public int insertFile(BoardDto file) {
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		file.setBoarddate(sdf.format(d));
		return dao.insertFile(file);
	}
	// 파일 업로드
	public BoardDto fileList(int no){
		return dao.fileList(no);
	}
	//서치 기능
	public List<BoardDto> boardListSearch(String search,int start){
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("search", search);
		m.put("start", start);
		m.put("count", 10);  
		return dao.boardListSearch(m);
	}
	//서치 기능2
	public int countSearch(String search) {
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("search", search); 
		return dao.countSearch(m);
	}
// 공지사항[end]
	
// 부서게시판[start]	
	// 부서게시판 insert
	public int teaminsert(BoardDto dto) {
		
		Date d = new Date(); // 날짜 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");// 날짜 
		dto.setBoarddate(sdf.format(d));// 날짜 
		return dao.teaminsert(dto);		
	}
	// 페이지 기능
	public List<BoardDto> teamlist(String teamno, int start){
		Map<String, Object> m = new HashMap<>(); // 뒤에도 똑같이 string, object면 생략가능
		m.put("start", start);
		m.put("count", 10);
		m.put("teamno", teamno);
		return dao.teamlist(m);
	}
	// 페이지 기능 
	public int teamcount(String teamno) { 
		return dao.teamcount(teamno); 
	}

	public String myteam(int empno) {
		return dao.myteam(empno);
	}
	
	// 상세 페이지 기능 
   public BoardDto teamlistOne(int boardno) {
	   dao.teamupdateReadcount(boardno); // and 조회수 기능
	   return dao.teamlistOne(boardno);
	}
	//글 삭제 기능
	public int teamdelete(int no) {
	return dao.teamdelete(no);
	}
	//글 수정 기능
	public int teamupdate(BoardDto dto) {
		return dao.teamupdate(dto);
	}
	// 파일 업로드
	public int teaminsertFile(BoardDto file) {
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		file.setBoarddate(sdf.format(d));
		return dao.teaminsertFile(file);
	}
	// 파일 업로드
	public BoardDto teamfileList(int no){
		return dao.teamfileList(no);
	}
	//서치 기능
	public List<BoardDto> teamboardListSearch(String search,int start, String teamno){
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("search", search);
		m.put("start", start);
		m.put("count", 10);
		m.put("teamno", teamno);
		return dao.teamboardListSearch(m);
	}
	//서치 기능2
	public int teamcountSearch(String search ,String teamno) {
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("search", search); 
		m.put("teamno", teamno);
		return dao.teamcountSearch(m);
	}
// 부서게시판[end]	

// 자유게시판[start]	
	// 자유게시판 insert
	public int freeinsert(BoardDto dto) {
		Date d = new Date(); // 날짜 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");// 날짜 
		dto.setBoarddate(sdf.format(d));// 날짜 
		return dao.freeinsert(dto);
	}
	// 페이지 기능
	public List<BoardDto> freelist(int start){
		Map<String, Object> m = new HashMap<>(); // 뒤에도 똑같이 string, object면 생략가능
		m.put("start", start);
		m.put("count", 10);
		return dao.freelist(m);
	}
	// 페이지 기능 
	public int freecount() { 
		return dao.freecount(); 
	}
	// 상세 페이지 기능 
	public BoardDto freelistOne(int boardno) {
	   dao.freeupdateReadcount(boardno); // and 조회수 기능
	   return dao.freelistOne(boardno);
	}
	//글 삭제 기능
	public int freedelete(int no) {
	return dao.freedelete(no);
	}
	//글 수정 기능
	public int freeupdate(BoardDto dto) {
		return dao.freeupdate(dto);
	}
	// 파일 업로드
	public int freeinsertFile(BoardDto file) {
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		file.setBoarddate(sdf.format(d));
		return dao.freeinsertFile(file);
	}
	// 파일 업로드
	public BoardDto freefileList(int no){
		return dao.freefileList(no);
	}
	//서치 기능
	public List<BoardDto> freeboardListSearch(String search,int start){
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("search", search);
		m.put("start", start);
		m.put("count", 10);  
	return dao.freeboardListSearch(m);
	}
	//서치 기능2
	public int freecountSearch(String search) {
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("search", search); 
	return dao.freecountSearch(m);
	}
// 자유게시판[end]	

}