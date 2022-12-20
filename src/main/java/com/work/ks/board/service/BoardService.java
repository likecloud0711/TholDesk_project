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
	
	public int insert(BoardDto dto) {
		dto.setEmpno(101);
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		dto.setBoarddate(sdf.format(d));
		return dao.insert(dto);		
	}

	// 페이지 기능
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

}