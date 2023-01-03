package com.work.ks.board.dto;


import lombok.Data;

@Data
public class BoardDto {
	
	private int boardno; // 게시판 번호
	private int empno; // 작성자(사번)

	private String boardtitle; // 게시판제목
	private String boarddate; // 작성일
	private String announceyn; // N 공지유무
	private String boardcontents; // 게시판 내용
	private int readcount; // 조회수	
	private String originalname; // 파일 업로드 할 때.  원본파일명
	private String path; // 파일 업로드 할 때. 경로.path 
	//private String thumb1; // 파일 업로드 할 때. 이름. name
	private String empnm;
	private String adminyn;
	//private int teamno;

}
