package com.work.ks.board.service;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.work.ks.board.dao.CommDao;
import com.work.ks.board.dto.CommDto;


@Service
public class CommService {
	@Autowired
	CommDao dao;
	
// 공지사항 [start]
	public List<CommDto> selectComm(int boardno){
		return dao.selectComm(boardno);
	}
	public int insertComm(CommDto dto) {
		return dao.insertComm(dto);
	}
	public int deleteComm(int replyno) {
		return dao.deleteComm(replyno);
	}
// 공지사항 [end]
	
// 부서게시판 [start]
	public List<CommDto> teamselectComm(int boardno){
		return dao.teamselectComm(boardno);
	}
	public int teaminsertComm(CommDto dto) {
		return dao.teaminsertComm(dto);
	}
	public int teamdeleteComm(int replyno) {
		return dao.teamdeleteComm(replyno);
	}
// 부서게시판 [end]
		
// 공지사항 [start]
	public List<CommDto> freeselectComm(int boardno){
		return dao.freeselectComm(boardno);
	}
	public int freeinsertComm(CommDto dto) {
		return dao.freeinsertComm(dto);
	}
	public int freedeleteComm(int replyno) {
		return dao.freedeleteComm(replyno);
	}
// 공지사항 [end]
}
