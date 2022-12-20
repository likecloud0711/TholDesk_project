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
	
	public List<CommDto> selectComm(int boardno){
		return dao.selectComm(boardno);
	}
	public int insertComm(CommDto dto) {
		return dao.insertComm(dto);
	}
	public int deleteComm(int replyno) {
		return dao.deleteComm(replyno);
	}
}
