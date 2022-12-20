package com.work.ks.board.dto;

import lombok.Data;

@Data
public class BoardDto {
	
	private int boardno; // 게시판 번호
	private int empno; // 작성자(사번)
	private int size1; // ??
	private String boardtitle; // 게시판제목
	private String boarddate; // 작성일
	private String announceyn; // N 공지유무
	private String boardcontents; // 게시판 내용
	private String file1; // 파일 업로드 할 때
	private String file1saved; // 파일 업로드 할 때
	private String thumb1; // 파일 업로드 할 때
	private int readcount; // 조회수
	
	
	

}
