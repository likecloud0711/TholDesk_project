package com.work.ks.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.work.ks.board.dto.BoardDto;
import com.work.ks.board.service.BoardService;


@Controller
public class DownloadController {
	
	@Autowired
	BoardService service;
	
	@GetMapping("/download/{no}") // {no} 는 url이기 때문에 pathvariable을 붙여줘야함
	public void fileDownload(HttpServletResponse response,@PathVariable int no, HttpServletRequest request) throws IOException {
		
		BoardDto dto = service.fileList(no); //service 의 filelist를 가져오는 dto 
		
		//File file = new File(dto.getPath()); 
		String path = request.getServletContext().getRealPath("/"); //  앞에 붙을 경로.
		File file = new File(path, dto.getPath()); // 경로를 가져와서 file변수에 저장

		String fileName = new String(dto.getOriginalname().getBytes("utf-8"),"iso-8859-1");
		
		response.setContentType("application/octet-stream; charset=utf-8"); 
		response.setHeader("Content-Disposition", "attachment; filename=\""  
				 
				+ fileName + "\";");//다운로드 받을 파일명 지정

		response.setHeader("Content-Transfer-Encoding", "binary");
		
		OutputStream out = response.getOutputStream();
		
		try (FileInputStream fis = new FileInputStream(file);){
			FileCopyUtils.copy(fis, out);
		}catch(Exception e) {}

		out.flush();
	}    
	
	@GetMapping("/teamdownload/{no}")
	public void teamfileDownload(HttpServletResponse response,@PathVariable int no, HttpServletRequest request) throws IOException {
		
		BoardDto dto = service.teamfileList(no); 

		String path = request.getServletContext().getRealPath("/"); 
		File file = new File(path, dto.getPath()); 

		String fileName = new String(dto.getOriginalname().getBytes("utf-8"),"iso-8859-1");
		
		response.setContentType("application/octet-stream; charset=utf-8"); 
		response.setHeader("Content-Disposition", "attachment; filename=\""  
				 
				+ fileName + "\";");

		response.setHeader("Content-Transfer-Encoding", "binary");
		
		OutputStream out = response.getOutputStream();
		
		try (FileInputStream fis = new FileInputStream(file);){
			FileCopyUtils.copy(fis, out);
		}catch(Exception e) {}

		out.flush();
	}   
	
	@GetMapping("/freedownload/{no}") // {no} 는 url이기 때문에 pathvariable을 붙여줘야함
	public void freefileDownload(HttpServletResponse response,@PathVariable int no, HttpServletRequest request) throws IOException {
		
		BoardDto dto = service.freefileList(no); //service 의 filelist를 가져오는 dto 
		
		//File file = new File(dto.getPath()); 
		String path = request.getServletContext().getRealPath("/"); //  앞에 붙을 경로.
		File file = new File(path, dto.getPath()); // 경로를 가져와서 file변수에 저장

		String fileName = new String(dto.getOriginalname().getBytes("utf-8"),"iso-8859-1");
		
		response.setContentType("application/octet-stream; charset=utf-8"); 
		response.setHeader("Content-Disposition", "attachment; filename=\""  
				 
				+ fileName + "\";");//다운로드 받을 파일명 지정

		response.setHeader("Content-Transfer-Encoding", "binary");
		
		OutputStream out = response.getOutputStream();
		
		try (FileInputStream fis = new FileInputStream(file);){
			FileCopyUtils.copy(fis, out);
		}catch(Exception e) {}

		out.flush();
	}   
	
}