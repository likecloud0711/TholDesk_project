package com.work.ks.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.work.ks.board.dao.FileinfoDao;
import com.work.ks.board.dto.FileinfoDto;

@Service // 삭제해도 될듯.
public class FileinfoService { 
	@Autowired
	FileinfoDao dao;
	
	public int insertFile(FileinfoDto file) {
		return dao.insertFile(file);
	}
	public List<FileinfoDto>  fileList(){
		return dao.fileList();
	}
	public FileinfoDto fileOne(int fileid) {
		return dao.fileOne(fileid);
	}
}

